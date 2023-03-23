#! /bin/bash

echo "For monitor mode press 1"
read no

monit() {
    ifconfig wlan1 down
    iwconfig wlan1 mode monitor
    ifconfig wlan1 up
    iwconfig
}

if [ $no -eq 1 ]
then 
    echo "Switching to monitor mode"
    monit
else
    echo "Wront input"
fi
