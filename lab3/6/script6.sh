#!/bin/bash
mkfifo pipe
./handler6.sh &
./gen6.sh
rm pipe
