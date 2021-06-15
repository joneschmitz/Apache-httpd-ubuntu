#!/bin/bash

sudo apt update
sudo apt install gcc -y
sudo apt install make
sudo apt install g++ -y
cd ~
mkdir apache
cd ~/apache/
wget https://apache.claz.org//httpd/httpd-2.4.46.tar.gz
tar xf httpd-2.4.46.tar.gz
wget https://mirror.olnevhost.net/pub/apache//apr/apr-1.7.0.tar.gz
tar xvf apr-1.7.0.tar.gz
cd httpd-2.4.46/srclib/
cp -r ../../apr-1.7.0 .
cd ~/apache/
wget https://mirrors.gigenet.com/apache//apr/apr-util-1.6.1.tar.gz
tar xvf apr-util-1.6.1.tar.gz
cd httpd-2.4.46/srclib/
cp -r ../../apr-util-1.6.1 .
mv apr-1.7.0 apr
mv apr-util-1.6.1 apr-util
cd ~/apache/
wget https://github.com/libexpat/libexpat/releases/download/R_2_4_1/expat-2.4.1.tar.gz
tar xf expat-2.4.1.tar.gz
cd expat-2.4.1/
sudo ./configure
sudo make
sudo make install
cd ~/apache/
rm Makefile config.h config.log config.status libpcre.pc libpcrecpp.pc libpcreposix.pc libtool pcre-config pcre.h pcre_stringpiece.h stamp-h1 prcecpparg.h pcrecpparg.h
                #cd ~/apache
wget https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.gz
tar xf pcre-8.44.tar.gz
cd pcre-8.44/
sudo ./configure
sudo make
sudo make install
cd ~/apache/httpd-2.4.46/
sudo ./configure
sudo make
sudo make install
 
cd ~/apache/pcre-8.44/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
cd /usr/local/apache2/bin/
sudo cp /usr/local/lib/libpcre.so.1 /usr/lib/
sudo cp /usr/local/lib/libpcre.so.1 /lib/
 
cd /usr/local/apache2/
sudo chmod -R 755 htdocs
sudo chown -R $(whoami) htdocs/
 
sudo sh -c 'echo "[Unit]
Description=httpd Apache Web Server
 
[Service]
Type=forking
PIDFile=/usr/local/apache2/logs/httpd.pid
ExecStart=/bin/bash /usr/local/apache2/bin/apachectl start
ExecStop=/bin/bash /usr/local/apache2/bin/apachectl graceful-stop
ExecReload=/bin/bash /usr/local/apache2/bin/apachectl graceful
 
[Install]
WantedBy=multi-user.target" > /usr/lib/systemd/system/apache.service'
sudo systemctl enable apache
sudo service apache start
 
clear
echo "Apache2 using httpd now installed"
echo
echo "Service can be started through the service 'apache'"
echo "Store web pages in /usr/local/apache2/htdocs/"
echo "View publicly using http or port 80"
