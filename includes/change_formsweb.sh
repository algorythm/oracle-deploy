#!/bin/bash

# $1 = fqdn, $2 = ip

# The following line a the following lines added together:
# Remove all lines including 'changefmw': sed "s/\S*\(changefmw\)\S*//g" /etc/hosts
# Add FQDN to the loop line             : sed "/^#127.0.0.1/ s/$/ $1/" /etc/hosts
# Add FQDN to the external IP           : sed "/^#10.174.234.99/ s/$/ $1/" /etc/hosts
# Change the external IP address        : sed "s/10.174.234.99/10.174.234.$2/" /etc/hosts

sed "s/changefmw.softbase.dk/$1/" /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/fmwconfig/servers/WLS_FORMS/applications/formsapp_12.2.1/config/formsweb.cfg > ./new_formsweb.cfg
mv /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/fmwconfig/servers/WLS_FORMS/applications/formsapp_12.2.1/config/formsweb.cfg /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/fmwconfig/servers/WLS_FORMS/applications/formsapp_12.2.1/config/formsweb.cfg.original
mv ./new_formsweb.cfg /home/oracle/Oracle/Middleware12c/ofr1/user_projects/domains/SBErpc12/config/fmwconfig/servers/WLS_FORMS/applications/formsapp_12.2.1/config/formsweb.cfg
