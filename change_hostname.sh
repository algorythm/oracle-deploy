#!/bin/bash
read -p "Enter new FQDN (ex: my-domain.tld): " fqdn
read -p "Enter ip (ex: 5) 10.174.234." ip

external="10.174.234.$ip/24"
internal="10.0.3.$ip/24"

echo "Hostname = $fqdn"
echo "External = $external"
echo "Internal = $internal"

nmcli g hostname $fqdn
nmcli con mod eth0 ipv4.addr $external ipv4.gateway 10.174.234.1
nmcli con mod eth1 ipv4.addr $internal

echo "Network has been changed. Starting weberp12..."
systemctl restart network
echo "weberp12 has been started."

echo "Defining Virtual hosts in WLS..."
# Some more code here

echo;

./includes/change_hosts.sh "$fqdn" "$ip"
./includes/change_formsweb.sh "$fqdn"
./includes/change_vhost_wls.sh "$fqdn"
./includes/configure_ords.sh
./includes/httpd_add_virtual_host.sh "$fqdn"

# Enable the weberp12 service so it starts when the system boots
chkconfig weberp12 on
