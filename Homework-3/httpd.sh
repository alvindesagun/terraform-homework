#!/bin/bash

# This script is used to install Apache on an EC2 instance

sudo yum install -y httpd
sudo systemctl stop httpd
sudo systemctl enable httpd


# Create a simple HTML file to serve

cd /var/www/html
sudo echo "<html><h1>Hello Kaizen World</h1></html>" > index.html

# Start httpd

sudo systemctl start httpd