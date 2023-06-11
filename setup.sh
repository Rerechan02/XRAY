#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : FN
# (C) Copyright 2022
# =========================================
clear
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
export Server_URL="raw.githubusercontent.com/Rerechan02/XRAY/main"
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
mkdir /etc/xray
mkdir /etc/root
mkdir /etc/v2ray
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple='\e[0;35m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }


red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
MYIP=$(wget -qO- icanhazip.com/ip);
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minutes $(( ${1} % 60 )) seconds"
}
start=$(date +%s)

echo -e "[ ${green}INFO${NC} ] Preparing the autoscript installation ~"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Installation file is ready to begin !"
sleep 1

if [ -f "/usr/local/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi

mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
#echo -e "${red}FN${NC} ${green}Established By FN 2022${NC} ${red}FN${NC}"
#DOWNLOAD SOURCE SCRIPT
echo -e "${red}    FN${NC} ${green} CUSTOM SETUP DOMAIN VPS     ${NC}"
echo -e "${red}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo "1. Use Domain From Script / Gunakan Domain Dari Script"
echo "2. Choose Your Own Domain / Pilih Domain Sendiri"
echo -e "${red}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
read -rp "Choose Your Domain Installation : " dom 

if test $dom -eq 1; then
clear
wget -q -O /root/cf.sh "https://${Server_URL}/cf.sh"
chmod +x /root/cf.sh
./cf.sh
elif test $dom -eq 2; then
read -rp "Enter Your Domain : " domen 
echo $domen > /root/domain
echo $domen > /etc/root/domain
echo $domen > /etc/xray/scdomain
echo $domen > /etc/xray/domain
echo $domen > /etc/v2ray/domain



else 
echo "Not Found Argument"
exit 1
fi
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /root/domain
#clear
#echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
#echo -e ""
#sleep 1
#Install SSH-VPN
echo -e "\e[0;32mINSTALLING SERVICE...\e[0m"
sleep 1
wget https://${Server_URL}/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
sleep 3
clear
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 3
wget -q -O /root/xray.sh "https://${Server_URL}/xray.sh"
chmod +x /root/xray.sh
./xray.sh
echo -e "${GREEN}Done!${NC}"
sleep 2
clear
#rm -rf /usr/share/nginx/html/index.html
#wget -q -O /usr/share/nginx/html/index.html "https://raw.githubusercontent.com/Rerechan02/XRAY/main/OTHERS/index.html"

# Finish
rm -f /root/ins-xray.sh
rm -f /root/ssh-vpn.sh



#Install WARNA WARNI
echo -e "\e[0;32mINSTALLING PELANGI\e[0m"
sleep 1
apt install ruby -y
apt install socat cron bash-completion ntpdate -y
gem install lolcat
apt install software-properties-common -y
apt install certbot python python2 -y
clear

# Version
echo "1.0" > /home/ver
clear
echo ""
echo -e "${RB}      .-------------------------------------------.${NC}"
echo -e "${RB}      |${NC}      ${CB}Installation Has Been Completed${NC}      ${RB}|${NC}"
echo -e "${RB}      '-------------------------------------------'${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "      ${WB}Multiport Websocket Autoscript By FN${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${WB}»»» Protocol Service «««  |  »»» Network Protocol «««${NC}  "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}FN${NC} ${YB}Vmess Websocket${NC}         ${WB}|${NC}  ${YB}- Websocket (CDN) TLS${NC}"
echo -e "  ${RB}FN${NC} ${YB}Vless Websocket${NC}         ${WB}|${NC}  ${YB}- Websocket (CDN) NTLS${NC}"
echo -e "  ${RB}FN${NC} ${YB}Trojan Websocket${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "           ${WB}»»» YAML Service Information «««${NC}          "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}FN${NC} ${YB}YAML XRAY VMESS WS${NC}"
echo -e "  ${RB}FN${NC} ${YB}YAML XRAY VLESS WS${NC}"
echo -e "  ${RB}FN${NC} ${YB}YAML XRAY TROJAN WS${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "             ${WB}»»» Server Information «««${NC}                 "
    echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}FN${NC} ${YB}Timezone                : Asia/Jakarta (GMT +7)${NC}"
echo -e "  ${RB}FN${NC} ${YB}Fail2Ban                : [ON]${NC}"
echo -e "  ${RB}FN${NC} ${YB}Dflate                  : [ON]${NC}"
echo -e "  ${RB}FN${NC} ${YB}IPtables                : [ON]${NC}"
echo -e "  ${RB}FN${NC} ${YB}Auto-Reboot             : [ON]${NC}"
echo -e "  ${RB}FN${NC} ${YB}IPV6                    : [OFF]${NC}"
echo -e ""
echo -e "  ${RB}FN${NC} ${YB}Autoreboot On 06.00 GMT +8${NC}"
echo -e "  ${RB}FN${NC} ${YB}Automatic Delete Expired Account${NC}"
echo -e "  ${RB}FN${NC} ${YB}Bandwith Monitor${NC}"
echo -e "  ${RB}FN${NC} ${YB}Check Login User${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "              ${WB}»»» Network Port Service «««${NC}             "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}FN${NC} ${YB}HTTP                    : 80, 8080, 8880${NC}"
echo -e "  ${RB}FN${NC} ${YB}HTTPS                   : 443${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo ""
secs_to_human "$(($(date +%s) - ${start}))"
echo ""
rm -r setup.sh
echo ""
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} For Reboot") "
reboot
