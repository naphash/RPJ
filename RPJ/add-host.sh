#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com)
echo "Checking VPS"
IZIN=$(curl http://rpj01.lestakun.tech:81/aksestokenvps | grep $MYIP)
if [ $MYIP = $IZIN ]; then
    echo -e "${green}Permission Accepted...${NC}"
else
    echo -e "${red}Permission Denied!${NC}"
    echo "Only For Premium Users"
    exit 0
fi
clear
read -rp "Domain/Host: " -e host
echo "IP=$host" >>/var/lib/premium-script/ipvps.conf
