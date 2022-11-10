#!/bin/bash
mkfifo channel

./handler5.sh &
./gen5.sh

rm channel
