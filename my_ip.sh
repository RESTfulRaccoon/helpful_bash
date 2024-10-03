#!/bin/bash

### Script for catching WAN > LAN IP address used with XFCE generic monitor
### Will help keep you informed of which network you are currently using i.e. VPN, WAN, LAN, NONE
### Internal IP Address such as 192.168.0.0/16::172.16.0.0/12::10.0.0.0/8 means you are not connected to the internet,
### Home address (127.0.0.1) showing means you are not connected to a network at all

### curl ifconfig.me for WAN ip_address if error dont print to stdout and countinue, else print WAN IP
curl ifconfig.me 2>/dev/null || \
### check for LAN ip_address
nmcli -p device show | \
### cut output down for easier reading
grep IP4.ADDRESS | awk NR==1 | awk '{print $2}' | cut -d "/" -f 1
