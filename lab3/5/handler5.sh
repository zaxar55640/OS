#!/bin/bash
res=1
mode="+"
( tail -f channel ) |
while true; do
read line;
case "$line" in
"+")
mode="$line"
;;
"*")
mode="$line"
;;
"QUIT")
pid=$$
echo "Stopped - QUIT message"
kill $(ps --ppid $pid | egrep 'tail$' | awk '{print $1}')
exit 0
;;
[0-9]*)
case $mode in
"+")
res=$(($res+$line))
echo $res
;;
"*")
res=$(($res*$line))
echo $res
;;
esac
;;
*)
killall tail
exit 1
;;
esac
done
