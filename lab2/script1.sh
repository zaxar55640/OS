#!/bin/bash

p=$(ps -fu | awk '/user/ {print $2 " : " $8}' | tail -n + 2)
count=$(echo "$p" | wc -l)
echo "Count is $count"
echo "$p"
