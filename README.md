# Intro

This repo includes a very simple line count code example to illustrate a performance difference in scala-native and JVM implementations.

The following code is much slower on scala-native than the JVM for large files:

```scala
import scala.io.Source

object Count {
  def main(args: Array[String]) = {
    val data = Source.fromFile(args(0))
    println(data.getLines.length)
  }
}
```

See the following timings for various file sizes:
(Where `data_1k` contains 1,000 md5 hashes, `data_10k` has 10,000, and so on.)

```
   data_1k	native	0m0.033s
  data_10k	native	0m0.227s
 data_100k	native	0m2.047s
data_1000k	native	0m20.671s

   data_1k	jvm	0m0.791s
  data_10k	jvm	0m0.755s
 data_100k	jvm	0m0.788s
data_1000k	jvm	0m0.902s
```


# Reproducing

After cloning this repo, have sbt build the JAR and executable:

```
sbt package nativeLink
```

Generate test data:
(this will take a couple seconds)

```
./gen-data.sh
```

Test the native and jvm implementations on a test data file:

```
./perf-test.sh data_1k
```

Test on all data files:
(this may take about 30 seconds))

```
ls data_1*k | xargs -n1 -P1 ./perf-test.sh
```
