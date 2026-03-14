#!/bin/bash
AMI_ID="ami-05856bd26dd466893"
INSTANCE_TYPE="t3.micro"
KEY_NAME="ec2-key"
SECURITY_GROUP_ID=$(aws ec2 describe-security-groups --group-names ec2-g --query "SecurityGroups[*].GroupId" --output text)
INSTANCE_NAME="Windows1-Chrome"
 
USER_DATA='<powershell>
Invoke-WebRequest "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "C:\ChromeSetup.exe"
Start-Process "C:\ChromeSetup.exe" -ArgumentList "/silent /install" -Wait
</powershell>'
 
aws ec2 run-instances \
--image-id $AMI_ID \
--count 1 \
--instance-type $INSTANCE_TYPE \
--key-name $KEY_NAME \
--security-group-ids $SECURITY_GROUP_ID \
--user-data "$USER_DATA" \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"
 
echo "Windows1 EC2 instance with Chrome is launched"


