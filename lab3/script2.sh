#!/bin/bash
at now + 2 minute -f ./script1.sh &
tail -n 0 -f ~/report &
