#!/bin/bash

for pid in $(ps -Ao pid | tail -n +2); do
if [[ -r /proc/$pid/status && -r /proc/$pid/sched ]]; then
PPid=$(grep "PPid" /proc/$pid/status | awk '{print $2}')
sum_exec_runtime=$(grep "sum_exec_runtime" /proc/$pid/sched | awk '{ print $3 }')
nr_switches=$(grep "nr_switches" /proc/$pid/sched | awk '{ print $3 }')
if [[ -z "$sum_exec_runtime" || -z "nr_switches" ]]; then
art=0
else
art=$(echo $sum_exec_runtime $nr_switches | awk '{ print $1 / $2 }')
fi
fi
echo "$pid $PPid $art"
done | echo "$(sort -nk2 | awk '{print "ProcessID=" $1 " : Parent_ProcessID=" $2 "
: Average_running_Time=" $3}')" >> answer4.txt
