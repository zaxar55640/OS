#!/bin/bash
ps -e -o pid,vsz= | sort -nk2 | tail -n1
