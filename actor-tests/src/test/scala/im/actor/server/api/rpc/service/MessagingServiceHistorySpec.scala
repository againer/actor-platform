package im.actor.server.api.rpc.service

import im.actor.api.rpc._
import im.actor.api.rpc.messaging.{ MessageState, TextMessage }
import im.actor.api.rpc.misc.ResponseVoid
import im.actor.api.rpc.peers.PeerType
import im.actor.server.api.rpc.service.groups.GroupsServiceImpl
import im.actor.server.api.util.ACL
import im.actor.server.presences.PresenceManager
import im.actor.server.push.{ SeqUpdatesManager, WeakUpdatesManager }
import im.actor.server.social.SocialManager

class MessagingServiceHistorySpec extends BaseServiceSuite with GroupsServiceHelpers {
  behavior of "MessagingServiceHistoryService"

  it should "Load history (private)" in s.privat

  it should "Load dialogs" in s.dialogs

  implicit val seqUpdManagerRegion = buildSeqUpdManagerRegion()
  implicit val weakUpdManagerRegion = WeakUpdatesManager.startRegion()
  implicit val presenceManagerRegion = PresenceManager.startRegion()
  implicit val socialManagerRegion = SocialManager.startRegion()

  val rpcApiService = buildRpcApiService()
  implicit val sessionRegion = buildSessionRegion(rpcApiService)

  implicit val service = new messaging.MessagingServiceImpl
  implicit val groupsService = new GroupsServiceImpl
  implicit val authService = buildAuthService()
  implicit val ec = system.dispatcher

  object s {
    val (user1, authId1, _) = createUser()
    val sessionId1 = createSessionId()

    val (user2, authId2, _) = createUser()
    val sessionId2 = createSessionId()

    val clientData1 = ClientData(authId1, sessionId1, Some(user1.id))
    val clientData2 = ClientData(authId2, sessionId2, Some(user2.id))

    val user1Model = getUserModel(user1.id)
    val user1AccessHash = ACL.userAccessHash(authId2, user1.id, user1Model.accessSalt)
    val user1Peer = peers.OutPeer(PeerType.Private, user1.id, user1AccessHash)

    val user2Model = getUserModel(user2.id)
    val user2AccessHash = ACL.userAccessHash(authId1, user2.id, user2Model.accessSalt)
    val user2Peer = peers.OutPeer(PeerType.Private, user2.id, user2AccessHash)

    def privat() = {
      val step = 2000L

      val startDate = {
        implicit val clientData = clientData1

        val startDate = System.currentTimeMillis()

        whenReady(service.handleSendMessage(user2Peer, 1L, TextMessage("Hi Shiva 1", None)))(_ ⇒ ())

        Thread.sleep(step)

        whenReady(service.handleSendMessage(user2Peer, 2L, TextMessage("Hi Shiva 2", None)))(_ ⇒ ())

        Thread.sleep(step)

        whenReady(service.handleSendMessage(user2Peer, 3L, TextMessage("Hi Shiva 3", None)))(_ ⇒ ())

        Thread.sleep(step * 2) // wait more to widen delay between 3rd and 4rd messages (we don't want 4rd message to be in ResponseLoadHistory)

        whenReady(service.handleSendMessage(user2Peer, 4L, TextMessage("Hi Shiva 4", None)))(_ ⇒ ())

        startDate
      }

      {
        implicit val clientData = clientData2

        whenReady(service.handleMessageReceived(user1Peer, startDate + step * 2)) { resp ⇒
          resp should matchPattern {
            case Ok(ResponseVoid) ⇒
          }
        }

        whenReady(service.handleMessageRead(user1Peer, startDate + step)) { resp ⇒
          resp should matchPattern {
            case Ok(ResponseVoid) ⇒
          }
        }
      }

      {
        implicit val clientData = clientData1

        whenReady(service.handleLoadHistory(user2Peer, startDate + step * 3 + step, 100)) { resp ⇒
          resp should matchPattern {
            case Ok(_) ⇒
          }
          val respBody = resp.toOption.get

          respBody.users.length should ===(0)
          respBody.history.length should ===(3)
          respBody.history.map(_.state) should ===(Seq(Some(MessageState.Sent), Some(MessageState.Received), Some(MessageState.Read)))
        }
      }
    }

    def dialogs() = {
      {
        implicit val clientData = clientData1

        whenReady(service.handleLoadDialogs(0, 100)) { resp ⇒
          resp should matchPattern {
            case Ok(_) ⇒
          }

          val respBody = resp.toOption.get

          respBody.dialogs.length should ===(1)
          val dialog = respBody.dialogs.head
          dialog.unreadCount should ===(0)
          respBody.users.length should ===(1)
        }
      }

      {
        implicit val clientData = clientData2

        whenReady(service.handleLoadDialogs(0, 100)) { resp ⇒
          resp should matchPattern {
            case Ok(_) ⇒
          }

          val respBody = resp.toOption.get

          respBody.dialogs.length should ===(1)
          val dialog = respBody.dialogs.head
          dialog.unreadCount should ===(3)
          respBody.users.length should ===(1)
        }
      }
    }
  }

}