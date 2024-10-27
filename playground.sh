#!/bin/bash

THRESHOLD=80

cpu_usage=$(top -l 1 | grep -E "CPU" | sed "s/.*: *\([0-9.]*\)% user.*/\1/" | awk '{print 100 - $1}')

if (($(echo "$cpu_usage > $THRESHOLD" | bc -l))); then
  echo "CPU usage is above $THRESHOLD%. Current usage: $cpu_usage%" | mail -s "CPU Alert" you@example.com
fi
