#!/bin/bash

echo =======================================
echo SYSTEM HEALTH CHECK
echo Date:$(date)
echo =======================================
echo ""
echo == Disk Space Check ==
disk_usage=$(df -h / | tail -n1 | awk '{print $5}' | cut -d'%' -f1)
if [ "$disk_usage" -ge 90 ]
then
	echo "CRITICAL ALERT: Disk usage is at $disk_usage%"
elif [ "$disk_usage" -ge 80 ]
then
	echo "WARNING: Disk usage is at $disk_usage%"
else
	echo "System is currently at $disk_usage%"
fi
echo ""
echo == Memory Check ==
mem_used=$(free -m | grep "Mem:" | awk '{print $3}')
mem_total=$(free -m | grep "Mem:" | awk '{print $2}')
percent=$(echo "scale=0; $mem_used * 100 / $mem_total" | bc)
if [ "$percent" -ge 90 ]
then
	echo "CRITICAL: Memory is at $percent%"
elif [ "$percent" -ge 75 ]
then
	echo "WARNING: Memory is at $percent%"
else
	echo "Memory is currently at $percent%"
fi
echo ""
echo == Service Check ==
for service in sshd firewalld crond
do
	status=$(systemctl is-active $service)
	if [ "$status" = active ]
	then
		echo "$service service is active"
	else
		echo "$service service is inactive"
	fi
done
echo ""
echo == User Sessions ==
session=$(who | wc -l)
if [ "$session" -gt 5 ]
then
	echo "WARNING: $session sessions detected - review for unusual activity"
elif [ "$session" -ge 2 ]
then
	echo "Normal activity: $session sessions are currently active"
else
	echo "System quiet: $session session is active"
fi
echo ""
echo =======================================
echo HEALTH CHECK COMPLETE
echo =======================================
