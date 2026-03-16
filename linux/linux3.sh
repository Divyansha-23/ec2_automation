#!/bin/bash

yum update -y
yum install -y python3
 
echo "Linux3 EC2 instance with Python3 is launched" > /home/ec2_automation/linux3_output.txt

