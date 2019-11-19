#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
#yum update -y
sudo yum -y install httpd

# make sure nginx is started
sudo service httpd start
sudo systemctl start httpd
