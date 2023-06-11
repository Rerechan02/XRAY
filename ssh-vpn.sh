#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : NevermoreSSH
# (C) Copyright 2022
# =========================================
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
export Server_URL="raw.githubusercontent.com/Rerechan02/XRAY/main"
clear
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
MYIP=$(wget -qO- ipv4.icanhazip.com);
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

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID
domain=$(cat /etc/xray/domain)
#Detail
country="ID"
state="Project"
locality=""
organization=""
organizationalunit=""
commonname="t"
email="rere@rerechan02.com"

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl

# install netfilter-persistent
apt-get install netfilter-persistent

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "status" >> .profile

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://${Server_URL}/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://${Server_URL}/vps.conf"
/etc/init.d/nginx restart

echo "=== Install Dropbear ==="
# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart
/etc/init.d/dropbear restart

cd
#INSTALL VNSTAT
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://github.com/NevermoreSSH/vnstat/releases/download/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install fail2ban
apt -y install fail2ban

# banner /etc/issue.net
sleep 1
echo -e "[ ${green}INFO$NC ] Settings banner"
wget -q -O /etc/baner.rere "https://raw.githubusercontent.com/Rerechan02/Example/main/issue.net"
chmod +x /etc/baner.rere
    echo "Banner /etc/baner.rere" >> /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/baner.rere"@g' /etc/default/dropbear
cat> /etc/baner.rere << END
<b><font color="blue"> Termikasih Telah Menggunakan AutoScript Kami<br></font></b><br>
<font color ='red'>- No DDOS !!!</font><br>
<font color ='red'>- No Torrent !!!</font><br>
<font color ='red'>- No Carding !!!</font><br>
<font color ='red'>- No Hacking !!!</font><br>
<font color ='red'>- No Spamming !!!</font><br>
<font color ='red'>- No Playstation Site !!!</font><br>
<font color ='red'>- No Ilegal Activities !!!</font><br>
<font color="white">Report Server Down? : t.me/Rerechan02</font><br>
END


# install resolvconf service
apt install resolvconf -y

#start resolvconf service
systemctl start resolvconf.service
systemctl enable resolvconf.service

# download script
cd /usr/local/sbin
wget -O add-host "https://${Server_URL}/add-host.sh"
wget -O speedtest "https://${Server_URL}/speedtest_cli.py"
wget -O xp "https://${Server_URL}/xp.sh"
wget -O funny "https://${Server_URL}/menu.sh"
wget -O status "https://${Server_URL}/status.sh"
wget -O info "https://${Server_URL}/info.sh"
wget -O restart "https://${Server_URL}/restart.sh"
wget -O limit "https://${Server_URL}/limit-speed.sh"
wget -O menu-tr "https://${Server_URL}/menu-tr.sh"
wget -O menu-ws "https://${Server_URL}/menu-ws.sh"
wget -O menu-vless "https://${Server_URL}/menu-vless.sh"
wget -O certxray "https://${Server_URL}/cert.sh"
wget -O menu-system "https://${Server_URL}/menu-system.sh"
wget -O dns "https://${Server_URL}/dns.sh"

chmod +x dns
chmod +x menu-tr
chmod +x acs-set
chmod +x menu-ws
chmod +x menu-vless
chmod +x menu-system
chmod +x certxray
chmod +x funny
chmod +x add-host
chmod +x speedtest
chmod +x xp
chmod +x status
chmod +x info
chmod +x restart
chmod +x limit
chmod +x *
echo "0 6 * * * root reboot" >> /etc/crontab
echo "0 1 * * * root /usr/local/sbin/xp" >> /etc/crontab
echo "0 2 * * * root /usr/bin/cleaner" >> /etc/crontab
echo "0 12 * * * root restart" >> /etc/crontab
echo "0 18 * * * root reboot" >> /etc/crontab
echo "0 23 * * * root restart" >> /etc/crontab
cd

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting nginx"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/cron restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban"
/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting resolvconf"
/etc/init.d/resolvconf restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting vnstat"
/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting stunnel4 "
/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 1

screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile
cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
# finishing
clear
