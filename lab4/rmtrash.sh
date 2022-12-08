#!/bin/bash
if [[ $# != 1 ]]; then
echo "Wrong Data given! Write a file name."
exit 1
fi

if ! [[ -d ~/trash ]]; then
mkdir ~/trash
fi

if ! [[ -f ~/trash.log ]]; then
touch ~/trash.log
fi

int=1
name="$int"

while [[ -e ~/trash/$name ]]; do
int=$((int + 1))
name="$int"
done

ln ./$1 ~/trash/$name
rm ./$1
echo "$(realpath -- "$1"):$name" >> ~/trash.log
