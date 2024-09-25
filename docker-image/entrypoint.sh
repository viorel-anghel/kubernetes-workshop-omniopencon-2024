#!/bin/bash

if [ "$MY_USERNAME" ]
then
	sed -i -e 's/Hello World/Hello $MY_USERNAME/' /var/www/html/index.html
fi	

nginx -g "daemon off;"

