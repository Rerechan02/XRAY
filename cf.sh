#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : FN
# (C) Copyright 2022
# =========================================

clear
MYIP=$(wget -qO- ipinfo.io/ip);
clear
apt install jq curl -y >/dev/null 2>&1
DOMAIN=funy.biz.id
sub=$(</dev/urandom tr -dc a-x1-9 | head -c6 | tr -d '\r' | tr -d '\r\n')
SUB_DOMAIN=${sub}.funy.biz.id
CF_ID=widyabakti02@gmail.com
CF_KEY=c97cc106a957747e35470bdf56e2dd6cbace5
set -euo pipefail
IP=$(wget -qO- ipinfo.io/ip);
echo "Updating DNS for ${SUB_DOMAIN}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${SUB_DOMAIN}'","content":"'${IP}'","ttl":120,"proxied":false}')

echo "Host : $SUB_DOMAIN"
echo $SUB_DOMAIN > /root/domain
echo $SUB_DOMAIN > /etc/xray/domain
echo $SUB_DOMAIN > /etc/root/domain
rm -f /root/cf.sh
