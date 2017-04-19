#!/bin/bash
echo "Fixing SELinux for certbot keys"
chcon -R -h -t httpd_sys_script_exec_t /etc/letsencrypt/live/$1/privkey.pem
chcon -R -h -t httpd_sys_script_exec_t /etc/letsencrypt/live/$1/fullchain.pem

echo "Fixing SELiunux for Virtual hosts"
chcon -R -h -t httpd_sys_script_exec_t /etc/httpd/sites-available/002-$1.conf
chcon -R -h -t httpd_sys_script_exec_t /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/fmwconfig/components/ReportsServerComponent/reports_ohs.conf
chcon -R -h -t httpd_sys_script_exec_t /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/fmwconfig/components/FORMS/instances/forms1/server/forms.conf

echo "Fixing SELinux for /var/www/html and /var/www/html/public"
chcon -R -h -t httpd_sys_rw_content_t /var/www/html/public
chcon -R -h -t httpd_sys_rw_content_t /var/www/html

echo "Fixing  SELinux proxy to 127.0.0.1:8080"
/usr/sbin/setsebool -P httpd_can_network_connect 1