#!/bin/sh

echo "Please, enter the IP of target:"
read ip

echo "Starting scan..."
ports=$(nmap -p- --min-rate=1000  -T4 $ip | grep '^[0-9]' | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)

echo "This port are open on the machine"
echo $ports

echo "Please, choose a type of scan:"
echo "1 - Intrusive scan"
echo "2 - furtive TCP scan"
read choice

if [[ choice -eq 1 ]]
then
    echo "Starting intrusive scan..."
    sleep 0.5
    nmap -sC -sV -p$ports $ip
else
    echo "Starting TCP scan"
    sleep 0.5
    nmap -sS -A $ip
fi
