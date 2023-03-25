#!/bin/bash

ip_range=$1

file_name="liveIPs.txt"

[ -z $ip_range ] && echo "provide ip range" && exit

folder="$(echo "$ip_range" | sed "s./.-.")"

[ -e "$folder" ] || mkdir $folder
[ -e "$folder/$file_name" ] && echo "$file_name file already present in $folder" && exit

echo "starting fping -g $ip_range -a -s"

fping -g $ip_range -a -s > $folder/$file_name

echo "Total IPs:$(wc -l $folder/$file_name)"

