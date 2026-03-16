#!/bin/bash

<powershell>
Invoke-WebRequest "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile "C:\ChromeSetup.exe"
Start-Process "C:\ChromeSetup.exe" -ArgumentList "/silent /install" -Wait
</powershell>
  
echo "Windows1 EC2 instance with Chrome is launched" > /home/ec2_automation/windows1_output.txt

