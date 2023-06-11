#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33;1m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
ori='\e[32;1m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • Funy Vpn •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e ""
echo -e "${yell} Nama${ori}   : $Name "
echo -e "${yell} IP VPS${ori} : $(cat /root/.myip)"
echo -e "${yell} Domain${ori} : $(cat /etc/xray/domain)"
echo -e ""
echo -e "${yell} Trojan${ori} : STOPPED "
echo -e "${yell} Vless${ori}  : STOPPED "
echo -e "${yell} Vmess${ori}  : STOPPED "
echo -e ""        
echo -e "${red} VPS Anda Tidak Izinkan ${ori} "
echo -e "${red} Contact Admin Untuk Perizinan ${ori}"
echo -e ""
echo -e "${yell} Telegram${ori} : https://t.me/Funy_vpn"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
        
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
# VPS Information
#Domain
domain=$(cat /etc/root/domain)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
ISP=$(cat /root/.myisp)
CITY=$(cat /root/.mycity)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl ifconfig.me)
#Download/Upload today
dtoday="$(vnstat | grep today | awk '{print $2" "substr ($3, 1, 3)}')"
utoday="$(vnstat | grep today | awk '{print $5" "substr ($6, 1, 3)}')"
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}')"
dmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $2" "substr ($3, 1 ,3)}')"
umon="$(vnstat -m | grep `date +%G-%m` | awk '{print $5" "substr ($6, 1 ,3)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"
clear 
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • FunyVpn •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "  ${RB}FN${NC} ${YB}OS      :  "$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-) ${NC}         
echo -e "  ${RB}FN${NC} ${YB}KERNEL  :  $(uname -r) ${NC} "
echo -e "  ${RB}FN${NC} ${YB}UPTIME  :  $uptime ${NC} "
echo -e "  ${RB}FN${NC} ${YB}RAM     :  $uram MB / $tram MB ${NC} "
echo -e "  ${RB}FN${NC} ${YB}DOMAIN  :  $domain ${NC} "
echo -e "  ${RB}FN${NC} ${YB}IPVPS   :  $IPVPS ${NC} "
echo -e "  ${RB}FN${NC} ${YB}Data    : $ttoday ${NC}"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ❇️ Nginx			: "$green"Running"$NC""
else
echo -e " ❇️ Nginx			: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ❇️ XRAY Vmess TLS		: "$green"Running"$NC""
else
echo -e " ❇️ XRAY Vmess TLS		: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ❇️ XRAY Vless TLS		: "$green"Running"$NC""
else
echo -e " ❇️ XRAY Vless TLS		: "$red"Not Running (Error)"$NC""
fi

status="$(systemctl show xray@trojanws.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ❇️ XRAY Trojan TLS		: "$green"Running"$NC""
else
echo -e " ❇️ XRAY Trojan TLS		: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ❇️ XRAY Vmess None TLS		: "$green"Running"$NC""
else
echo -e " ❇️ XRAY Vmess None TLS		: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@vnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ❇️ XRAY Vless None TLS		: "$green"Running"$NC""
else
echo -e " ❇️ XRAY Vless None TLS		: "$red"Not Running (Error)"$NC""
fi
status="$(systemctl show xray@trnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " ❇️ XRAY Trojan None TLS		: "$green"Running"$NC""
else
echo -e " ❇️ XRAY Trojan None TLS		: "$red"Not Running (Error)"$NC""
fi
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • SCRIPT MENU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e " [\e[36m•1\e[0m] Vmess Menu"
echo -e " [\e[36m•2\e[0m] Vless Menu"
echo -e " [\e[36m•3\e[0m] Trojan Menu"
echo -e " [\e[36m•4\e[0m] System Menu"
echo -e " [\e[36m•5\e[0m] Status Service"
echo -e " [\e[36m•6\e[0m] CHANGE DNS SERVER"
echo -e ""
echo -e " [\e[36m•x\e[0m] Close Panel"
echo -e ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e " \e[33mClient Name   \E[0m: Xray Only"
echo -e " \e[33mScrip Version \E[0m: 1.1"
echo -e " \e[33mScrip Expired \E[0m: Lifetime"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; run_exp ; menu-ws ;;
2) clear ; run_exp ; menu-vless ;;
3) clear ; run_exp ; menu-tr ;;
4) clear ; run_exp ; menu-system;;
5) clear ; run_exp ; status ;;
6) clear ; run_exp ; dns ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; funny ;;
esac