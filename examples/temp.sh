#!/bin/bash

# echo "My name is $1. I live in $2. I study in $3."

echo "what is your name?"
read name
if [ $name ]; then
	echo "$name is a good name"
else
	echo "name is not entered"
fi

# echo "wow, $name is such a cool name"
# echo "your username in this computer $(whoami)"
