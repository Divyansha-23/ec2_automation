#!/bin/bash
 
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker

echo "Linux EC2 instance with Docker is launched" > /home/ec2_automation/linux1_output.txt

