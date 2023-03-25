ifconfig | grep broadcast | cut -d " " -f 10 | cut -d "." -f 1,2,3
10.0.5

ping -c 1 10.0.5.171 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"
10.0.5.171

