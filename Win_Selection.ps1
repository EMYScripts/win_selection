Write-Host  -ForegroundColor Green "Starting OSDCloud ZTI"
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}


#Variables to define the Windows OS / Edition etc to be applied during OSDCloud
$Product = (Get-MyComputerProduct)
$Model = (Get-MyComputerModel)
$Manufacturer = (Get-CimInstance -ClassName Win32_ComputerSystem).Manufacturer
$OSVersion = 'Windows 11' #Used to Determine Driver Pack
$OSReleaseID = '24H2' #Used to Determine Driver Pack
$OSName = 'Windows 11 24H2 x64'
$OSEdition = 'Pro'
$OSActivation = 'Volume'
$OSLanguage = 'en-us'


#Set OSDCloud Vars
$Global:MyOSDCloud = [ordered]@{
    Restart = [bool]$False
    RecoveryPartition = [bool]$true
    OEMActivation = [bool]$false
    WindowsUpdate = [bool]$true
    WindowsUpdateDrivers = [bool]$true
    WindowsDefenderUpdate = [bool]$true
    SetTimeZone = [bool]$true
    ClearDiskConfirm = [bool]$False
    ShutdownSetupComplete = [bool]$false
    SyncMSUpCatDriverUSB = [bool]$true
    CheckSHA1 = [bool]$true
}


#Launch OSDCloud
write-host "Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage"

Start-OSDCloud -OSName $OSName -OSEdition $OSEdition -OSActivation $OSActivation -OSLanguage $OSLanguage


#Latitude 3500 Series
#Write-Host  -ForegroundColor Green "Latitude - BIOS Setting"
#cmd.exe /c D:\CCTK\cctk.exe --EmbSataRaid=Ahci

#Optiplex 3000 Series
#Write-Host  -ForegroundColor Green "Optiplex - BIOS Setting"
#cmd.exe /c D:\CCTK\cctk.exe --AcPwrRcvry=on --WakeOnLan=LanOnly --AutoOn=Everyday --AutoOnHr=00 --AutoOnMn=00 --DeepSleepCtrl=Disabled --BlockSleep=Enabled

#Start OSDCloud ZTI the RIGHT way
#Write-Host  -ForegroundColor Green "Start OSDCloud"
#Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
#Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume



#Download Unattend.xml 
Write-Host  -ForegroundColor Green "Downloading XML"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

#Download Reg&Clean_up_PS 
#Write-Host  -ForegroundColor Green "Downloading Reg&Clean_up_PS"
#Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/Additional_Settings.ps1" -OutFile "C:\Reg_Clean_up.ps1"

#Restart from WinPE
Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
