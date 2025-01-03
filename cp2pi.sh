#!/bin/bash
# Bash script to send application onto the Raspberry Pi

source .env

echo -n "Enter the password for $PI_USER@$PI_IPADDR: "
read -s PI_PWD
export SSHPASS="$PI_PWD" 
echo

sshpass -e scp ./main.go $PI_USER@$PI_IPADDR:/home/$PI_USER/
sshpass -e ssh $PI_USER@$PI_IPADDR -t 'go build main.go'