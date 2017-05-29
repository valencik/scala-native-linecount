#!/bin/bash

function initial_data {
  for i in $(seq 1000); do
    md5 -qs "$i" >> data_1k
  done
}

function dupe_data {
  for i in $(seq "$1"); do
    cat data_1k >> "data_$1k"
  done
}

initial_data
dupe_data 10
dupe_data 100
dupe_data 1000
