#!/bin/bash

yum update -y
yum install -y python3

echo "Linux server with python installed" > index.html
nohup python3 -m http.server 80 &
