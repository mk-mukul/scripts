#!/bin/bash

servers="servers.csv" # file conteins server ips and credentials
live_ips="liveIPs.txt" # name of file contain the list of live ips
folder="10.7.0.0-16"
targets="targetIPs.txt"

total_servers=$(wc -l $servers | awk '{print $1}') # number of working servers
total_targets=$(wc -l $folder/$live_ips | awk '{print $1}') # number of tarters
targetsPerServer=$(echo "$total_targets/$total_servers" | bc) # number of target per server

for (( i=1; i<=$total_servers; i++ ))
do 
    line=$(sed -n "$i$(echo p)" $servers)
    server=$(echo $line | awk -F "," '{print $1}')
    [ -e "$folder/$server" ] || mkdir "$folder/$server"
    sl=$(echo "($i-1)*$targetsPerServer+1" | bc)
    el=$(echo "$i*$targetsPerServer" | bc)
    [ $i -eq $total_servers ] && el=$total_targets
    sed -n "$sl,$(echo $el)p" $folder/$live_ips > "$folder/$server/$targets"
done

