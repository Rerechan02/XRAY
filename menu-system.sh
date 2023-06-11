#!/bin/bash
run_back() {
echo ""
read -p "Pres Enter kembali ke HOME : " jejeje        
funny    
}

clear
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • SYSTEM MENU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e ""
echo -e "  ${RB}01.${NC} ${YB}LIMIT BANDWITH SPEED ${NC}"
echo -e "  ${RB}02.${NC} ${YB}CHANGE DOMAIN ${NC}"
echo -e "  ${RB}03.${NC} ${YB}RENEW CERT XRAYS ${NC}"
echo -e "  ${RB}04.${NC} ${YB}CHECK VPN STATUS ${NC}"
echo -e "  ${RB}05.${NC} ${YB}CHECK VPN PORT ${NC}"
echo -e "  ${RB}06.${NC} ${YB}RESTART VPN SERVICE ${NC}"
echo -e "  ${RB}07.${NC} ${YB}SPEEDTEST ${NC}"
echo -e "  ${RB}08.${NC} ${YB}CHECK BANDWIDTH ${NC}"
echo -e "  ${RB}09.${NC} ${YB}BACKUP ${NC}"
echo -e "  ${RB}10.${NC} ${YB}RESTORE ${NC}"
echo -e "  ${RB}11.${NC} ${YB}REBOOT ${NC}"
echo -e "  ${RB}12.${NC} ${YB}EXIT ${NC}"
echo -e ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; limit ; run_back ;;
2) clear ; add-host ; run_back ;;
3) clear ; certxray ; run_back ;;
4) clear ; status ; run_back ;;
5) clear ; info ; run_back ;;
6) clear ; restart ; run_back ;;
7) clear ; speedtest ; run_back ;;
8) clear ; vnstat ; run_back ;;
9) clear ; backup ; run_back ;;
10) clear ; restore ; run_back ;;
11) clear ; reboot ;;
12) clear ; exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; mennu-system ;;
esac