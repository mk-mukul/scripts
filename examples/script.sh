
#! /usr/bin/bash

# which bash
# STRING="Null Byte"
# echo "Hacker love to learn on $STRING"

# $1 and $2 is argument after command
# echo "I firmly belive that $1 is the best $2 for the office of $3"

# echo $(whoami)

# echo "What is your name?"
# read name
# if [ $name ]; then
#     echo "Hello $name!"
# else
#     echo "Name not entered"
# fi

# sudo apt update

ifconfig | grep broadcast | awk '{print $2}'

alias ipaddress="ifconfig | grep broadcast | awk '{print $2}'"
alias whatismyipaddress="echo $(ifconfig | grep broadcast | awk '{print $2}')"
