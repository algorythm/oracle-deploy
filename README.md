# Oracle Deploy
This is a script coded for at custom server setup.

The script is intended for the server at Oracle VM Manager called "SBSV12MASTERV3" (in cluster pool 3). 

Oracle Forms and Reports 12c has been pre-installed and pre-configured. There is a small Oracle Enterprise database server installed, but its only use is for LDAP. This instance is supposed to use an external database server.

All software needed is pre-installed, this script is only for the final configuration of IP-addresses, hostname, database server etc. 

The script will also configure ORDS, automatically deploy it to a tomcat server, retreive SSL certificates from Lets Encrypt, and configure apache to use these certificates and serve the ORDS app through a reverse proxy to the tomcat server.

## Usage:
Important things to note here:

Firstly, it is important to note that weberp12 has to be down (it should be by default though, otherwise, execute `service weberp12 stop`).
It is important that external DNS has been set before hand.

Make sure that the server can ping the database server.

Make sure that the firewall allows port 80/tcp and 443/tcp to the server. It can be checked with nmap:

`nmap -p 443 <ip-address>`

If it is filtered, the internal firewall might be blocking it. Open it with the firewall cmd:

`firewall-cmd --zone=public --permanent --add-service=https`

To list the firewall rules, use:

`firewall-cmd --zone=public --permanent --list-services`

A port can also be added manually:

`firewall-cmd --zone=public --add-port=8090/tcp`

When everything is set up as it should be, execute the following command:

`./setup.sh`

Answer all the questions, and the rest should be setup automatically. 

If everything had success, now reboot the server, and weberp12 and everything should start up automatically.
