#!/bin/bash
AMI_ID="ami-0c02fb55956c7d316"
INSTANCE_TYPE="t3.micro"
KEY_NAME="ec2-key"
SECURITY_GROUP_ID=$(aws ec2 describe-security-groups --group-names ec2-g --query "SecurityGroups[*].GroupId" --output text)
INSTANCE_NAME="Linux3-Python3"
 
USER_DATA='#!/bin/bash
yum update -y
yum install -y python3
'
 
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --user-data "$USER_DATA" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"
 
echo "Linux3 EC2 instance with Python3 is launching..."

