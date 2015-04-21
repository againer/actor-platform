package im.actor.server

import java.net.InetSocketAddress

import akka.stream.ActorFlowMaterializer

import im.actor.api.rpc.auth.{ ResponseSendAuthCode, RequestSignUp, RequestSendAuthCode }
import im.actor.api.rpc.codecs.RequestCodec
import im.actor.api.rpc.sequence.RequestGetDifference
import im.actor.api.rpc.{ Request, RpcOk, RpcResult }
import im.actor.server.api.frontend.{ Tcp => TcpFrontend }
import im.actor.server.api.rpc.RpcApiService.AttachService
import im.actor.server.api.rpc.service.auth.AuthServiceImpl
import im.actor.server.api.rpc.service.contacts.ContactsServiceImpl
import im.actor.server.api.rpc.service.groups.GroupsServiceImpl
import im.actor.server.api.rpc.service.messaging.MessagingServiceImpl
import im.actor.server.api.rpc.service.sequence.SequenceServiceImpl
import im.actor.server.api.rpc.{ RpcApiService, RpcResultCodec }
import im.actor.server.db.DbInit
import im.actor.server.mtproto.codecs.protocol._
import im.actor.server.mtproto.protocol._
import im.actor.server.mtproto.transport.{ Ack, MTPackage, ProtoPackage, TransportPackage }
import im.actor.server.presences.PresenceManager
import im.actor.server.push.{ SeqUpdatesManager, WeakUpdatesManager }
import im.actor.server.session.Session
import im.actor.util.testing._

class SimpleServerE2eSpec extends ActorFlatSuite with DbInit {
  behavior of "Server"

  it should "connect and Handshake" in e1

  it should "respond to RPC requests" in e2

  val serverConfig = system.settings.config
  val sqlConfig = serverConfig.getConfig("persist.sql")
  val ds = initDs(sqlConfig)

  implicit val db = initDb(ds)
  implicit val flowMaterializer = ActorFlowMaterializer()

  implicit val seqUpdManagerRegion = SeqUpdatesManager.startRegion()
  implicit val weakUpdManagerRegion = WeakUpdatesManager.startRegion()
  implicit val presenceManagerRegion = PresenceManager.startRegion()
  val rpcApiService = system.actorOf(RpcApiService.props())
  implicit val sessionRegion = Session.startRegion(Some(Session.props(rpcApiService)))

  val services = Seq(
    new AuthServiceImpl,
    new ContactsServiceImpl,
    new MessagingServiceImpl,
    new GroupsServiceImpl,
    new SequenceServiceImpl
  )

  services foreach { service =>
    rpcApiService ! AttachService(service)
  }

  TcpFrontend.start(serverConfig, sessionRegion)

  val remote = new InetSocketAddress("localhost", 8080)

  def e1() = {
    val client = MTProtoClient()
    client.connectAndHandshake(remote)
    client.close()
  }

  def e2() = {
    implicit val client = MTProtoClient()

    client.connectAndHandshake(remote)

    val authId = 1L
    val sessionId = 2L
    val phoneNumber = 75550000000L

    val smsHash = {
      val messageId = 3L

      val requestBytes = RequestCodec.encode(Request(RequestSendAuthCode(phoneNumber, 1, "apiKey"))).require
      val mbBytes = MessageBoxCodec.encode(MessageBox(messageId, RpcRequestBox(requestBytes))).require
      val mtPackage = MTPackage(authId, sessionId, mbBytes)

      client.send(ProtoPackage(mtPackage))

      expectAck()
      expectNewSession(sessionId, messageId)
      expectMessageAck(messageId)

      val result = receiveRpcResult(messageId)
      result shouldBe an[RpcOk]

      result.asInstanceOf[RpcOk].response.asInstanceOf[ResponseSendAuthCode].smsHash
    }

    {
      val messageId = 4L

      val requestBytes = RequestCodec.encode(Request(RequestSignUp(
        phoneNumber = phoneNumber,
        smsHash = smsHash,
        smsCode = "0000",
        name = "Wayne Brain",
        deviceHash = Array(4, 5, 6),
        deviceTitle = "Specs virtual device",
        appId = 1,
        appKey = "appKey",
        isSilent = false
      ))).require
      val mbBytes = MessageBoxCodec.encode(MessageBox(messageId, RpcRequestBox(requestBytes))).require
      val mtPackage = MTPackage(authId, sessionId, mbBytes)

      client.send(ProtoPackage(mtPackage))

      expectAck()
      expectMessageAck(messageId)

      val result = receiveRpcResult(messageId)
      result shouldBe an[RpcOk]
    }

    {
      val messageId = 5L

      val requestBytes = RequestCodec.encode(Request(RequestGetDifference(999, Array()))).require
      val mbBytes = MessageBoxCodec.encode(MessageBox(messageId, RpcRequestBox(requestBytes))).require
      val mtPackage = MTPackage(authId, sessionId, mbBytes)

      client.send(ProtoPackage(mtPackage))

      expectAck()
      expectMessageAck(messageId)

      val result = receiveRpcResult(messageId)
      result shouldBe an[RpcOk]
    }

    client.close()
  }

  // TODO: DRY
  private def expectAck(index: Int)(implicit client: MTProtoClient): Ack = {
    client.receiveTransportPackage() match {
      case Some(TransportPackage(_, ack @ Ack(i))) =>
        i should ===(index)
        ack
      case None => throw new Exception("Transport package with ack not received")
      case x => throw new Exception(s"Expected ack but ${x} received")
    }
  }

  private def expectAck()(implicit client: MTProtoClient): Ack = {
    client.receiveTransportPackage() match {
      case Some(TransportPackage(_, ack @ Ack(_))) =>
        ack
      case None => throw new Exception("Transport package with ack not received")
      case x => throw new Exception(s"Expected ack but ${x} received")
    }
  }

  private def expectMessageAck(messageId: Long)(implicit client: MTProtoClient): MessageAck = {
    val mb = receiveMessageBox()
    mb.body shouldBe a[MessageAck]

    val expectedAck = MessageAck(Vector(messageId))

    val ack = mb.body.asInstanceOf[MessageAck]
    ack should ===(expectedAck)

    ack
  }

  private def receiveRpcResult(messageId: Long)(implicit client: MTProtoClient): RpcResult = {
    val mb = receiveMessageBox()
    mb.body shouldBe an[RpcResponseBox]

    val rspBox = mb.body.asInstanceOf[RpcResponseBox]
    rspBox.messageId should ===(messageId)

    RpcResultCodec.decode(rspBox.bodyBytes).require.value
  }

  private def receiveMessageBox()(implicit client: MTProtoClient): MessageBox = {
    val mtp = receiveMTPackage()
    MessageBoxCodec.decode(mtp.messageBytes).require.value
  }

  private def receiveMTPackage()(implicit client: MTProtoClient): MTPackage = {
    val body = client.receiveTransportPackage() match {
      case Some(TransportPackage(_, body)) => body
      case None => throw new Exception("Transport package not received")
    }

    body shouldBe a[MTPackage]
    body.asInstanceOf[MTPackage]
  }

  private def expectNewSession(sessionId: Long, messageId: Long)(implicit client: MTProtoClient): Unit = {
    val mtp = receiveMTPackage()

    val expectedNewSession = NewSession(sessionId, messageId)

    val mb = MessageBoxCodec.decode(mtp.messageBytes).require.value
    mb.body shouldBe a[NewSession]
    mb.body should ===(expectedNewSession)
  }

  override def afterAll = {
    super.afterAll()
    ds.close()
  }
}