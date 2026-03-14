#!/bin/bash
AMI_ID="ami-0c02fb55956c7d316"
INSTANCE_TYPE="t3.micro"
KEY_NAME="ec2-key"
SECURITY_GROUP="ec2-sg"
INSTANCE_NAME="Linux1-Docker"
 
USER_DATA='#!/bin/bash
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
'
 
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids sg-043d28570c0bf905e \
    --user-data "$USER_DATA" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"
 
echo "Linux EC2 instance with Docker is launching..."

