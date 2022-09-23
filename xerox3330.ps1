Set-ExecutionPolicy remotesigned
#Download file
$url = "https://download.support.xerox.com/pub/drivers/3330/drivers/win10x64/ar/3330_5.496.4.0_PCL6_x64.exe"
New-Item "C:\temp" -itemType Directory
$file = "c:\temp\3330_5.496.4.0_PCL6_x64.exe"
Invoke-WebRequest -Uri $url -OutFile $file

#Install Printer
##\\localhost\3330v_3345v_dnip\3330_5.496.4.0_PCL6_x64.exe /s
c:\temp\3330_5.496.4.0_PCL6_x64.exe /s
Start-Sleep 20

Invoke-Command {pnputil.exe -a "C:\Xerox\3330_5.496.4.0_PCL6_x64_Driver.inf\x2STUSX.inf"}
Add-PrinterDriver -Name "Xerox Phaser 3330 PCL6"
Get-PrinterDriver
#Crear puerto
#Add-PrinterPort -Name "IP_192.168.61.99_XA" -PrinterHostAddress "IP_192.168.61.99"
Add-PrinterPort -Name "LocalPort3330"
Start-Sleep 10
#Add-Printer -Name "Xerox Phaser 3330" -ShareName "Xerox Phaser 3330 PCL6"  -PortName IP_192.168.61.99_XA -DriverName "Xerox Phaser 3330 PCL6"
Add-Printer -Name "Xerox Phaser 3330" -ShareName "Xerox Phaser 3330 PCL6"  -PortName "LocalPort3330" -DriverName "Xerox Phaser 3330 PCL6"
