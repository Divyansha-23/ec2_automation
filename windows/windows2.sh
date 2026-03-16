<powershell>
 
$html = @"
<!DOCTYPE html>
<html>
<head>
<title>Welcome page</title>
</head>
<body>
<p> Hello !!</p>
</body>
</html>
"@
 
Set-Content -Path "C:\index.html" -Value $html
 
"Extended HTML page created successfully" | Out-File C:\windows2.txt
 
</powershell>



