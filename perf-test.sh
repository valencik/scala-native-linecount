#!/bin/bash

function native {
  time target/scala-2.11/count-out "$1" >/dev/null
}

function jvm {
  time scala -classpath target/scala-2.11/count_native0.2_2.11-0.1.0-SNAPSHOT.jar ca.valencik.Count "$1" >/dev/null
}

# An attempt to ensure data is cached by OS
wc "$1" >/dev/null

echo "$1 native $(native "$1" 2>&1 | grep real)"
echo "$1    jvm $(jvm "$1" 2>&1 | grep real)"
