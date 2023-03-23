#! /bin/bash

read ip
ifconfig eth1 $ip
ifconfig | grep $ip 
