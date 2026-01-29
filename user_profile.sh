#!/bin/bash

read -p "what is your name? " name
echo ""
read -p "what is your age? " age
echo ""
read -p "what city do you live in? " city
echo ""
echo "hello, $name. you are $age old and you live in $city"
echo ""
echo "today is: $(date)"
