#!/bin/bash
#Procopas
#Kancil
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# CHEK STATUS
# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear
domain=$(cat /etc/xray/domain)
echo -e "${CYAN}==========================================\033[0m${NC}"
echo -e "\E[44;1;39m                $domain           \E[0m"
echo -e "${CYAN}==========================================\033[0m${NC}"
echo -e ""
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx				: "$green"Running"$NC""
else
echo -e " Nginx				: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vmess TLS			: "$green"Running"$NC""
else
echo -e " XRAY Vmess TLS			: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vless TLS			: "$green"Running"$NC""
else
echo -e " XRAY Vless TLS			: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@trojanws.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Trojan TLS		: "$green"Running"$NC""
else
echo -e " XRAY Trojan TLS		: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vmess None TLS		: "$green"Running"$NC""
else
echo -e " XRAY Vmess None TLS		: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@vnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Vless None TLS		: "$green"Running"$NC""
else
echo -e " XRAY Vless None TLS		: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@trnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY Trojan None TLS		: "$green"Running"$NC""
else
echo -e " XRAY Trojan None TLS		: "$red"Not Running (Error)"$NC""
fi
echo "" 
echo -e "${CYAN}==========================================\033[0m${NC}"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
funny
