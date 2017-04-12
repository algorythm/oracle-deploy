#!/bin/bash

# $1 = fqdn, $2 = ip

# The following line a the following lines added together:
# Remove all lines including 'changefmw': sed "s/\S*\(changefmw\)\S*//g" /etc/hosts
# Add FQDN to the loop line             : sed "/^#127.0.0.1/ s/$/ $1/" /etc/hosts
# Add FQDN to the external IP           : sed "/^#10.174.234.99/ s/$/ $1/" /etc/hosts
# Change the external IP address        : sed "s/10.174.234.99/10.174.234.$2/" /etc/hosts

sed -e "s/\S*\(changefmw\)\S*//g" -e "/^#127.0.0.1/ s/$/ $1/" -e "/^#10.174.234.99/ s/$/ $1/" -e "s/10.174.234.99/10.174.234.$2/" /etc/hosts > ./new_hosts.txt
mv /etc/hosts /etc/hosts.original
mv ./new_hosts.txt /etc/hosts

# To fix the SELinux Shit:
chcon -R -h -t httpd_sys_script_exec_t /etc/hosts