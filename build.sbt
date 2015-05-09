import dsl._
import Keys._

enablePlugins(JavaServerAppPackaging)
enablePlugins(DebianPlugin)

name in Debian := "actor-server"
maintainer in Linux := "Andrey Kuznetsov <smith@actor.im>"
packageSummary in Linux := "An Actor.IM server"
packageDescription := "Fast and furious business communications server"
daemonUser in Linux := "actor"
daemonGroup in Linux := (daemonUser in Linux).value
bashScriptExtraDefines += """addJava "-Dconfig.file=${app_home}/../conf/application.conf""""
bashScriptConfigLocation := Some("${app_home}/../conf/jvmopts")
javaOptions in Universal ++= Seq("""-Dlogback.configurationFile=${app_home}/../conf/logback.xml""")

dockerBaseImage := "prettynatty/sbt"
dockerExposedPorts := Seq(8080)
packageName in Docker := "actorim-server"
version in Docker := version.value