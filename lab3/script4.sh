#!/bin/bash
./cycle4.sh $
pid1=$!
./cycle4.sh &
pid2=$!
./cycle4.sh &
pid3=$!

renice +10 $pid1
cpulimit -p $pid1 -l 10

kill $pid3
cpulimit -p $pid1 -l 10
