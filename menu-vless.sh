#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : NevermoreSSH
# (C) Copyright 2022
# =========================================
P='\e[0;35m'
B='\033[0;36m'
N='\e[0m'
clear
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e "             ═══[Vless]═══"
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e " 1)  Create Vless Account"
echo -e " 2)  Trial Vless Account"
echo -e " 3)  Check User Login Vless"
echo -e " 4)  Deleting Vless Account"
echo -e " 5)  Renew Vless Account"
echo -e " 6)  List Member Vless"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e " 0)   MENU UTAMA"
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e ""
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       add-vless
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 2 ]]; then
       trial-vless
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 3 ]]; then
       cek-vless
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 4 ]]; then
       del-vless
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 5 ]]; then
       renew-vless
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 6 ]]; then
       user-vless
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 0 ]]; then
       clear
       funny
    else
       clear
       menu-vless
    fi
fi