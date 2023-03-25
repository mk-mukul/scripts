#!/bin/bash

ip_range=$1

inputIPs="liveIPs.txt"
file_name="openPORTs.txt"

[ -z $ip_range ] && echo "provide ip range" && exit

folder="$(echo "$ip_range" | sed "s./.-.")"

[ -e "$folder" ] || mkdir $folder
[ -e "$folder/$file_name" ] && echo "$file_name file already present in $folder" && exit

echo "starting nmap -iL $folder/$inputIPs -F -oG -"

nmap -iL $folder/$inputIPs -F -oG - | grep "open" > $folder/$file_name

echo "Total IPs with open PORTs:$(wc -l $folder/$file_name)"

