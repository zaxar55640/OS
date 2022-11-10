#!/bin/bash
while true; do
read line
if [[ "$line" == "QUIT" ]]; then
echo "$line" > channel
exit 0
fi
if [[ "$line" != "+" && "$line" != "*" && "$line" != [0-9]* ]]; then
echo "wrong data!"
echo "$line" > channel
exit 1
fi
echo "$line" > chanel
done
