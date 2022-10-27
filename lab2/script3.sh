#!/bin/bash
echo "$(ps -Ao pid,stime | tail -1)"
