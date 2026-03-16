#!/bin/bash
yum update -y
amazon-linux-extras install nginx1 -y
systemctl start nginx
systemctl enable nginx
echo "Nginx Server Created" > /home/ec2_automation/linux2_output.txt 
