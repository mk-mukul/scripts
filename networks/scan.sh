#!/bin/bash

ip_range=$1
live_ips="liveIPs.txt"
open_ports="openPORTs.txt"

[ -z $ip_range ] && echo "provide ip range" && exit

folder="$(echo "$ip_range" | sed "s./.-.")"
[ -e "$folder" ] || mkdir $folder

# ******** starting Ping scan *****************
echo "starting ping scan... "
over_write="y"
[ -e "$folder/$live_ips" ] && echo -n "$live_ips file already present in $folder. Do you want to over write it?(y/n): " && read over_write
[ "$over_write" != "y" ] && exit
echo "starting : fping -g $ip_range -a -s"
fping -g $ip_range -a -s > $folder/$live_ips
echo "Total IPs:$(wc -l $folder/$live_ips)"
# ************* ping scan complete ****************

# ************ starting port scan *********************
echo "starting port scan... "
over_write="y"
[ -e "$folder/$open_ports" ] && echo -n "$open_ports file already present in $folder. Do you want to over write it?(y/n): " && read over_write
[ "$over_write" != "y" ] && exit
echo "starting nmap -iL $folder/$live_ips -F -oG -"
nmap -iL $folder/$live_ips -F -oG - | grep "open" > $folder/$open_ports
echo "Total IPs with open PORTs:$(wc -l $folder/$open_ports)"
# ************* port scan complete *****************

echo "Scanning complete"

echo "Find file in the folder = $folder"
