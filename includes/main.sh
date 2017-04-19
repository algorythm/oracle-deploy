#!/bin/bash
read -p "Enter new FQDN (ex: my-domain.tld): " fqdn

#./includes/change_network.sh
#echo "Changing formsweb.cfg..."
#./includes/change_formsweb.sh "$fqdn"
#echo "Setting up virtual host in WLS..."
#./includes/change_vhost_wls.sh "$fqdn"
echo "Configuring ORDS..."
./includes/configure_ords.sh

#echo "Retrieving SSL certificates using Certbot from Lets Encrypt..."
#/opt/certbot/certbot-auto certonly --standalone -d $fqdn
#echo "Setting up cron job to update SSL certificates"
#mkdir /root/certbot-log
#echo "30 5 * * * /opt/certbot/certbot-auto -n renew --post-hook \"systemctl reload httpd\" >> /root/certbot-log/renew.log" >> /etc/crontab

# To fix the SELinux Shit:
#echo "Fixing SELinux for certbot keys"
#chcon -R -h -t httpd_sys_script_exec_t /etc/letsencrypt/live/$fqdn/privkey.pem
#chcon -R -h -t httpd_sys_script_exec_t /etc/letsencrypt/live/$fqdn/fullchain.pem

#./includes/fix_selinux.sh $fqdn

#echo "Restarting httpd"
#systemctl restart httpd

#echo "Creating virtual hosts for apache..."
#./includes/httpd_add_virtual_host.sh "$fqdn"

# Enable the weberp12 service so it starts when the system boots
#chkconfig weberp12 on
