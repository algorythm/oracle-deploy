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

echo "Network has been changed."

echo;

echo "Changing hosts file..."
./includes/change_hosts.sh "$fqdn" "$ip"
echo "Changing formsweb.cfg..."
./includes/change_formsweb.sh "$fqdn"
echo "Setting up virtual host in WLS..."
./includes/change_vhost_wls.sh "$fqdn"
echo "Configuring ORDS..."
./includes/configure_ords.sh

echo "Retrieving SSL certificates using Certbot from Lets Encrypt..."
/opt/certbot/certbot-auto certonly -n -d $fqdn
echo "Setting up cron job to update SSL certificates"
echo 30 5 * * * /opt/certbot/certbot-auto -n renew --post-hook "systemctl reload httpd"

# To fix the SELinux Shit:
chcon -R -h -t httpd_sys_script_exec_t /etc/letsencrypt/live/$fqdn/privkey.pem
chcon -R -h -t httpd_sys_script_exec_t /etc/letsencrypt/live/$fqdn/fullchain.pem

echo "Creating virtual hosts for apache..."
./includes/httpd_add_virtual_host.sh "$fqdn"

# Enable the weberp12 service so it starts when the system boots
chkconfig weberp12 on
