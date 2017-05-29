enablePlugins(ScalaNativePlugin)

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "ca.valencik",
      scalaVersion := "2.11.11",
      version      := "0.1.0-SNAPSHOT"
    )),
    name := "Count"
  )
