#!/bin/bash

ip_range=$1

[ -z $ip_range ] && echo "provide ip range" && exit

folder="$(echo "$ip_range" | sed "s./.-.")"

./fping.sh $ip_range
./ports.sh $ip_range

echo "Search complete"

echo "Find file in the folder = $folder"
