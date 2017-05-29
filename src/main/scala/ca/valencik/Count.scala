package ca.valencik

import scala.io.Source

object Count {

  def main(args: Array[String]) = {
    val data = Source.fromFile(args(0))
    println(data.getLines.length)
  }

}
