#!/bin/bash

ip_range=$1 # ip range to be scanned
servers=$2 # file conteins server ips and credentials
live_ips="liveIPs.txt" # name of file contain the list of live ips
results="openPORTs.txt" # name of file contain results of scanning

[ -z $ip_range ] && echo "provide ip range" && exit
[ -z $servers ] && echo "provide working server for scanning" && exit

folder="$(echo "$ip_range" | sed "s./.-.")"
[ -e "$folder" ] || mkdir $folder

# ******** starting Ping scan *****************
echo "starting ping scan... "
over_write="y"
[ -e "$folder/$live_ips" ] && echo -n "$live_ips file already present in $folder. Do you want to over write it?(y/n): " && read over_write
[ "$over_write" != "y" ] && exit
echo "starting : fping -g $ip_range -a -s" && fping -g $ip_range -a -s > $folder/$live_ips
echo "ping scan completed"
echo "Total IPs:$(wc -l $folder/$live_ips)"
# ************* ping scan complete ****************

# # ************ starting port scan *********************
# echo "starting port scan... "
# over_write="y"
# [ -e "$folder/$open_ports" ] && echo -n "$open_ports file already present in $folder. Do you want to over write it?(y/n): " && read over_write
# [ "$over_write" != "y" ] && exit
# echo "starting nmap -iL $folder/$live_ips -F -oG -"
# nmap -iL $folder/$live_ips -F -oG - | grep "open" > $folder/$open_ports
# echo "Total IPs with open PORTs:$(wc -l $folder/$open_ports)"
# # ************* port scan complete *****************


# make the folder stracture for the server and assign the target ips
echo "makeing the folder stracture for the server and assigning the target ips"
targets="targetIPs.txt" # file contain the list of targets
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


# starting the servers to do the scanning
echo "starting the servers to do the scanning"
while read -r line
do
    path=$folder
    server=$(echo $line | awk -F "," '{print $1}')
    username=$(echo $line | awk -F "," '{print $2}')
    password=$(echo $line | awk -F "," '{print $3}')
    echo Starting the server "$server" with username "$username"
    xterm -e ./expect.exp "$server" "$username" "$password" "$path" "$targets" "$results" &
done < $servers

echo "************ Task Complete *************"
