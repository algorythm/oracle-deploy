#!/bin/bash
read -p "Enter ip (ex: 5) 10.174.234." ip

external="10.174.234.$ip/24"
internal="10.0.3.$ip/24"

echo "Hostname = $1"
echo "External = $external"
echo "Internal = $internal"

nmcli g hostname $fqdn
nmcli con mod eth0 ipv4.addr $external ipv4.gateway 10.174.234.1
nmcli con mod eth1 ipv4.addr $internal

echo "Network has been changed."

echo;

echo "Changing hosts file..."
./includes/change_hosts.sh "$1" "$ip"