#!/bin/bash
dir1=~/test
report=~/report
host="www.net_nikogo.ru"
testfile=$(date "%F_%R")
mkdir $dir1 && echo "$testfile" > "$report" && touch $dir1/$testfile
ping -c 1 $host || echo "$testfile Site is not available" >> $report
