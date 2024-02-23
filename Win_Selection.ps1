Write-Host  -ForegroundColor Green "Starting OSDCloud ZTI"
Start-Sleep -Seconds 5

#Latitude 3500 Series
#Write-Host  -ForegroundColor Green "Latitude - BIOS Setting"
#cmd.exe /c D:\CCTK\cctk.exe --EmbSataRaid=Ahci

#Optiplex 3000 Series
#Write-Host  -ForegroundColor Green "Optiplex - BIOS Setting"
#cmd.exe /c D:\CCTK\cctk.exe --AcPwrRcvry=on --WakeOnLan=LanOnly --AutoOn=Everyday --AutoOnHr=00 --AutoOnMn=00 --DeepSleepCtrl=Disabled --BlockSleep=Enabled

#Start OSDCloud ZTI the RIGHT way
Write-Host  -ForegroundColor Green "Start OSDCloud"
Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 23H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume
#Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

#Download Unattend.xml 
Write-Host  -ForegroundColor Green "Downloading XML"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

#Download Reg&Clean_up_PS 
Write-Host  -ForegroundColor Green "Downloading Reg&Clean_up_PS"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/Additional_Settings.ps1" -OutFile "C:\Reg_Clean_up.ps1"

#Restart from WinPE
#Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
#Start-Sleep -Seconds 20
#wpeutil reboot
