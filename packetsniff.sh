#!/bin/bash

if [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ]
then 
echo "This script is used to capture papckets using tcpduump and create a .pcap file"
echo "Options: [-h help] [--help help]"
echo "Syntax: ./packetsniff.sh <Source IP> <Destination IP> <Name of PCAP file or Path along with name of PCAP file> [Interface]"
echo "Example ./packetsniff.sh 192.168.177.132 192.168.177.135 test.pcap eth0"
echo "Network range can also be mention and 'any' can also be mentioned."
echo "Default interface will be 'eth0'".
echo "Note: Terminate the script by Ctrl + C when you feel like you have captured the packets"

else
flag=1
if [ "$1" == "" ] || [ "$2" == "" ]
then
echo "Please enter the Source IP/Destiniation IP"
echo "Enter './packetsniffer -h' for help"
flag=0
fi
if [ "$3" == "" ]
then
echo "Please enter the name of the PCAP file or path along with the name of the PCAP file"
echo "Enter './packetsniffer -h' for help"
flag=0
fi
if [ "$4" == "" ]
then
interface="eth0"
else
interface=$4
fi
if [ "$flag" == 1 ] 
then
sudo tcpdump -w $3 -U -i $interface -v src $1 and dst $2
fi
fi