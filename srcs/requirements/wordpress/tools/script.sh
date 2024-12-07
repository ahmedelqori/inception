#!/bin/sh

sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/' /etc/lighttpd/lighttpd.conf
sed -i 's|"/usr/bin/php-cgi"|"/usr/bin/php-cgi82"|'  /etc/lighttpd/mod_fastcgi.conf

rc-service lighttpd start 
rc-update add lighttpd default
rc-service lighttpd restart
mkdir -p /usr/share/webapps/
cd /usr/share/webapps/
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
chown -R lighttpd /usr/share/webapps/
ln -s /usr/share/webapps/wordpress//var/www/localhost/htdocs/wordpress


# /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
