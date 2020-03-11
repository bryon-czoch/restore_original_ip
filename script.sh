#!/bin/bash

sudo apt-get install apache2-dev libtool git

##Clone the following for the most recent build of mod_cloudflare:

git clone https://github.com/cloudflare/mod_cloudflare.git; cd mod_cloudflare

##Use the Apache extension tool to convert the .c file into a module

apxs -a -i -c mod_cloudflare.c

##Restart and verify the module is active

sudo apachectl restart; apache2ctl -M|grep cloudflare

#If your web server is behind a load balancer, add the following line to your Apache configuration (httpd.conf usually) and replace 123.123.123.123 with your load balancer's IP address:

#IfModule cloudflare_module
#CloudFlareRemoteIPHeader X-Forwarded-For
#CloudFlareRemoteIPTrustedProxy [insert your load balancer’s IP address]
#DenyAllButCloudFlare
#/IfModule
