
#!/bin/bash
 
REGION="us-east-1"
INSTANCE_TYPE="t3.micro"
 
LINUX_AMI=$(aws ssm get-parameters \
--names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
--query "Parameters[0].Value" \
--output text \
--region $REGION)
 
WINDOWS_AMI=$(aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=Windows_Server-2019-English-Full-Base*" \
--query "Images[0].ImageId" \
--region $REGION \
--output text)
 
echo "Starting infrastructure deployment..."
 
echo "Launching Linux Instances..."
 
aws ec2 run-instances \
--image-id $LINUX_AMI \
--instance-type $INSTANCE_TYPE \
--count 1 \
--user-data file://linux/linux1.sh \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux1-Docker}]' \
--query 'Instances[0].InstanceID' \
--output text \
--region $REGION
 
aws ec2 run-instances \
--image-id $LINUX_AMI \
--instance-type $INSTANCE_TYPE \
--count 1 \
--user-data file://linux/linux2.sh \
--query 'Instances[0].InstanceID' \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux2-Nginx}]' \
--output text \
--region $REGION
 
aws ec2 run-instances \
--image-id $LINUX_AMI \
--instance-type $INSTANCE_TYPE \
--count 1 \
--user-data file://linux/linux3.sh \
--query 'Instances[0].InstanceID' \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Linux3-python}]' \
--output text \
--region $REGION
 
 
echo "Launching Windows Instances..."
 
aws ec2 run-instances \
--image-id $WINDOWS_AMI \
--instance-type $INSTANCE_TYPE \
--count 1 \
--key-name ec2-key \
--user-data file://windows/windows1.sh \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Windows1-Chrome}]' \
--query 'Instances[0].InstanceID' \
--output text \
--region $REGION
 
aws ec2 run-instances \
--image-id $WINDOWS_AMI \
--instance-type $INSTANCE_TYPE \
--count 1 \
--key-name ec2-key \
--user-data file://windows/windows2.sh \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Windows2-html}]' \
--query 'Instances[0].InstanceID' \
--output text \
--region $REGION
 
echo "Deployment completed"
