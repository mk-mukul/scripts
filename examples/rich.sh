#!/bin/bash

echo "what is your name?"
read name
echo "what is your age?"
read age
echo "hello $name, you are $age years old."

sleep 2
echo "calculating..."
sleep 1
echo "*...."
sleep 1
echo "**..."
sleep 1
echo "***.."
sleep 1
echo "****."
sleep 1
echo "*****"
sleep 1

richage=$((($RANDOM % 20)+$age))

echo "$name, you will become rich when you are $richage years old."
