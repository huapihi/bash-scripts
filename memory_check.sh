#!/bin/bash

used=$(free -m | grep "Mem:" | awk '{print $3}')
total=$(free -m | grep "Mem:" | awk '{print $2}')

percent=$(echo "scale=0; $used * 100 / $total" | bc)

if [ "$percent" -ge 90 ]
then
	echo "CRITICAL: memory usage is at $percent%"
elif [ "$percent" -ge 75 ]
then
	echo "WARNING: memory usage is at $percent%"
else
	echo "memory is OK"
fi

