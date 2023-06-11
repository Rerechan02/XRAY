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
echo -e "             ═══[Trojan]═══"
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e " 1)  Create Trojan Account"
echo -e " 2)  Trial Trojan Account"
echo -e " 3)  Check User Login Trojan"
echo -e " 4)  Deleting Trojan Account"
echo -e " 5)  Renew Trojan Account"
echo -e " 6)  List Member Trojan"        
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e " x)   MENU UTAMA"
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e ""
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       add-tr
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 2 ]]; then
       trial-tr
       read -n1 -r -p "Press any key to continue..."
       cek-tr
    elif [[ $x -eq 3 ]]; then
       funny
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 4 ]]; then
       del-tr
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 5 ]]; then
       renew-tr
       read -n1 -r -p "Press any key to continue..."
       funny
    elif [[ $x -eq 6 ]]; then
       user-tr
       read -n1 -r -p "Press any key to continue..."
       menu
    elif [[ $x -eq x ]]; then
       clear
       funny
    else
       clear
       menu-tr
    fi
fi