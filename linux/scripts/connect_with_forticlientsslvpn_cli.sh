#!/bin/sh
################################################################################
#
#
################################################################################
server="https://vpngate.reply.it"
port="443"
user="s.celia"

echo "[INFO] connecting to $user@$server:$port"
/opt/forticlientsslvpn/64bit/forticlientsslvpn_cli --server $server:$port --vpnuser $user
