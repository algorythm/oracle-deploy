# Tips SBSV12MASTER
## Installation script:
https://github.com/awo-dev/oracle-deploy

## How to use firewall-cmd:
https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7

## Issue with symbolic links (if they are red when listing (ls)):
http://askubuntu.com/questions/365454/apache2-error-could-not-open-configuration-file-etc-apache2-conf-d-no-such-fi
   Conclusion: Use absolute paths

## Oracle Information about configurating WebLogic for Apache:
https://docs.oracle.com/middleware/1212/webtier/PLGWL/apache.htm#PLGWL406
Same as above, just a bit older:
https://docs.oracle.com/cd/E13222_01/wls/docs81/plugins/apache.html

## Issue with WebLogic and Apache. Conclusion: select the correct version for the version of apache:
http://stackoverflow.com/questions/24266352/cannot-load-home-pavanbsd-wlsplugin-lib-mod-wl-so-into-server-home-pavanbsd-w

## Install SSL mod for apache (yum install mod_ssl openssl):
https://wiki.centos.org/HowTos/Https

## Install certbot manually:
https://certbot.eff.org/#pip-other
```
   cd /opt && mkdir certbot && cd certbot
   wget https://dl.eff.org/certbot-auto
   chmod a+x certbot-auto
```


## Issue with SELinux and apache (HTTPD) for files/folders:
http://forums.fedoraforum.org/showthread.php?t=273768
http://serverfault.com/questions/626610/selinux-preventing-apache-from-writing-to-a-file

## Disable SELinux (don't do it):
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security-Enhanced_Linux/sect-Security-Enhanced_Linux-Enabling_and_Disabling_SELinux-Disabling_SELinux.html
   _We found a way around this. Now SELinux is enabled. If it gets disabled, and enabled again, you may get a lot of issues (we did)._

## Configuring ORDS with tomcat:
https://docs.oracle.com/cd/E37099_01/doc.20/e25066/install.htm#AELIG7227

## Issue with images /usr/share/tomcat/i (pop-up when opening https://<host>/ords):
http://www.inside-oracle-apex.com/apex-5-0-there-are-issues-with-the-configuration-of-the-static-files-in-your-environment/
   _Step 1. We hadn't executed @apex_rest_config.sql. See how to do it in our installation script._

## Issue: 503 Service Unavailable with mod_proxy (httpd/tomcat):
http://stackoverflow.com/questions/25644487/httpd-returning-503-service-unavailable-with-mod-proxy-for-tomcat-8
	**Conclusion**: `/usr/sbin/setsebool -P httpd_can_network_connect 1`
   (see http://sysadminsjourney.com/content/2010/02/01/apache-modproxy-error-13permission-denied-error-rhel/) (better)