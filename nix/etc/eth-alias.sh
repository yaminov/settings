#!/bin/sh

modprobe dummy
ifconfig dummy0 hw ether 00:01:02:03:04:05
ip link set name eth0 dev dummy0
ifconfig eth0 up

