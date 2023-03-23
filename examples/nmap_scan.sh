#! /bin/bash

echo "Enter IP"
read ip
echo "Enter Port"
read port
echo -e "select a scan \n 1 for Aggresive \n 2 for Syn \n 3 for TCP"
read st

if [ $st -eq 1 ]
then 
    nmap -A $ip -p $port | grep open
elif [ $st -eq 2 ]
then 
    nmap -sS -O -sV $ip -p $port | grep open
elif [ $st -eq 3 ]
then 
    nmap -sT -O -sV $ip -p $port | grep open
fi
