#!/bin/bash
source answer4.txt
rm answer5.txt
touch answer5.txt
previous_ppid=0
sum=0
count=0
while read line
do
ppid=$(echo $line | awk -F "=" '{print $3}' | awk -F ":" '{print $1}')
art=$(echo $line | awk -F "=" 'print $4}')
if [[ "$ppid" -eq "$previous_ppid" ]]; then
count=$((count + 1))
sum=$(echo $sum $art | awk '{print $1 + $2}')
else
sum=$(echo $sum $count | awk '{print $1 + $2}')
echo "Average_Running_Children_of_ParentID=$previous_ppid is $sum" >> answer5.txt
sum=$art
count=1
previous_ppid=$ppid
fi
echo $line >> answer5.txt
done < answer4.txt
sum=$(echo $sum $count | awk '{print $1/$2}')
echo "Average_Running_Children_of_ParentID=$previous_ppid is $sum" >> answer5.txt
