#!/bin/bash
AMI_ID="ami-05856bd26dd466893"
INSTANCE_TYPE="t3.micro"
KEY_NAME="ec2-key"
SECURITY_GROUP_ID=$(aws ec2 describe-security-groups --group-names ec2-g --query "SecurityGroups[*].GroupId" --output text)
INSTANCE_NAME="Windows2-Jenkins"
 
USER_DATA='<powershell>
Invoke-WebRequest "https://get.jenkins.io/windows-stable/jenkins.msi" -OutFile "C:\Jenkins.msi"
Start-Process "msiexec.exe" -ArgumentList "/i C:\Jenkins.msi /qn /norestart" -Wait
</powershell>'
 
aws ec2 run-instances \
--image-id $AMI_ID \
--count 1 \
--instance-type $INSTANCE_TYPE \
--key-name $KEY_NAME \
--security-group-ids $SECURITY_GROUP_ID \
--user-data "$USER_DATA" \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"
 
echo "Windows2 EC2 instance with Jenkins is launching..."


