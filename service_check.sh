#!/bin/bash

read -p "what service would you like to check? " service

status=$(systemctl is-active $service)

if [ "$status" = active ]
then
	echo "$service service is active"
else
	echo "$service service is inactive"
fi

