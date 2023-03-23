#! /bin/bash

read mac

ifconfig eth1 down
ifconfig eth1 hw ehter $mac
ifconfig eth1 up
ifconfig

