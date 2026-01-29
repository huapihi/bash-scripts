#!/bin/bash

stock=50
price=10
choice=0

while [ "$choice" != 6 ]
do
	echo "1. check stock"
	echo "2. add stock"
	echo "3. remove stock"
	echo "4. change price"
	echo "5. calculate total value"
	echo "6. exit"
	read -p "pick an option:" choice
	if [ "$choice" = 1 ]
	then
		echo "you currently have $stock stocks."
		sleep 1
	elif [ "$choice" = 2 ]
	then
		read -p "how many stocks would you like to add? " amount
		stock=$((stock + amount))
		echo "you have added $amount stocks and your new total is $stock stocks."
		sleep 1
	elif [ "$choice" = 3 ]
	then
		read -p "how much would you like to remove? " amount
		if [ "$amount" -gt "$stock" ]
		then
			echo "invalid entry, you do not have enough stocks to remove."
		else
			stock=$((stock - amount))
			echo "you have removed $amount stocks and your new total is $stock stocks."
		fi
		sleep 1
	elif [ "$choice" = 4 ]
	then
		read -p "what would you like to set the price per item as? \$" newprice
		valid=0
		while [ "$valid" = 0 ]
		do
			read -p "you want to set the price to \$"$newprice", correct? " answer
			if [ "$answer" = yes ]
			then
				price=$newprice
				echo "the new price is \$"$newprice""
				valid=1
			elif [ "$answer" = no ]
			then
				echo "the price did not change."
				echo "the price is still \$"$price""
				valid=1
			else
				echo "invalid answer, please enter 'yes' or 'no'."
			fi
		done
		sleep 1
	elif [ "$choice" = 5 ]
	then
		total=$((stock * price))
		echo "the current total value is \$"$total""
		sleep 1
	elif [ "$choice" = 6 ]
	then
		echo "thank you for using the automated inventory system."
	else
		echo "invalid option."
	fi
done
