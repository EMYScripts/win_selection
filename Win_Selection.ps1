Write-Host  -ForegroundColor Green "Starting OSDCloud ZTI"
Start-Sleep -Seconds 5

#Start OSDCloud ZTI the RIGHT way
Write-Host  -ForegroundColor Green "Start OSDCloud"
Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 23H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI

#Download Unattend.xml
Write-Host  -ForegroundColor Green "Downloading XML"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

#Restart from WinPE
Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
