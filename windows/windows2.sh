<powershell>
Install-WindowsFeature -name Web-Server -IncludeManagementTools
Start-Service W3SVC 
$hostname = $env:COMPUTERNAME
$time = Get-Date
$message = "HTML page created successfully"
 
$html = @"
 
<!DOCTYPE html>
<html>
 
<head>
<title>Windows Instance Dashboard</title>
 
<style>
body{
    font-family: Arial;
    background-color:#f2f2f2;
    text-align:center;
}
 
.container{
    margin-top:120px;
    background:white;
    padding:30px;
    width:450px;
    margin:auto;
    border-radius:10px;
    box-shadow:0 0 10px gray;
}
 
h1{
    color:#2c3e50;
}
 
p{
    font-size:18px;
}
</style>
 
</head>
 
<body>
 
<div class="container">
 
<h1>Hello from Windows Instance</h1>
 
<p><b>Instance Name:</b> $hostname</p>
 
<p><b>Page Generated At:</b> $time</p>
 
<p><b>Status:</b> $message</p>
 
</div>
 
</body>
 
</html>
 
"@
 
Set-Content -Path "C:\inetpub\wwwroot\index.html" -Value "<h1>Windows instance with html page created</h1>"
 
$message | Out-File C:\windows2.txt
 
</powershell>
 
