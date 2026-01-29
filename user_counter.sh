#!/bin/bash

user_count=$(who | wc -l)

if [ "$user_count" -gt 5 ]
then
	echo "WARNING: $user_count active sessions detected - review for unusual activity"
elif [ "$user_count" -ge 2 ]
then
	echo "Normal activity: $user_count users currently logged in"
else
	echo "System quiet: $user_count session active"
fi
