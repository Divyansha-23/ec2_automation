#!/bin/bash
 
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
docker run -d -p 80:80 nginx bash -c "echo Docker installed successfully > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
