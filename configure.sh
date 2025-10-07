#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo apt install -y net-tools
get_ip_addr="$(ifconfig eth0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')"
ip_addr="$(echo "$get_ip_addr")"
echo "You can now access this guest OS from Hyper-V host using the following command:\n"
echo "ssh $(whoami)@$ip_addr"
