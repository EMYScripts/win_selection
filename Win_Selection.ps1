#﻿Write-Host  -ForegroundColor Green "Starting OSDCloud ZTI"
Start-Sleep -Seconds 5

$DefaultGateway = (ipconfig | Select-String "Default Gateway").line -split ":\s+" | Select-Object -Last 1
$input = $DefaultGateway

# Store the target password (replace with your secure storage method)
$TargetPassword = ConvertTo-SecureString -AsPlainText -Force -String "123456789"

# Prompt for the user's password
Write-Host "`n DISCLAIMER: USE AT YOUR OWN RISK - Going further will erase all data on your disk ! `n"-ForegroundColor Red
$UserPassword = Read-Host -Prompt "Enter the password to proceed with installation" -AsSecureString

# Compare the passwords
$TargetPasswordPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($TargetPassword))
$UserPasswordPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($UserPassword))

if ($UserPasswordPlain -eq $TargetPasswordPlain) {
    Write-Host "Password matched. Proceeding with installation..."

switch ($input)
{
    '192.168.1.1'  
    { 
    net use P: \\192.168.1.15\OSDCloud /user:test Emory2025!!!
    Start-Sleep -Seconds 5
    
    
    powershell.exe -ExecutionPolicy ByPass -File P:\OSDCloud\UltraVNC\ultravnc.ps1
    Start-Sleep -Seconds 5

    #Start OSDCloud ZTI the RIGHT way
    Write-Host  -ForegroundColor Green "Start OSDCloud"
    Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
    #Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

    #Download Unattend.xml 
    #Write-Host  -ForegroundColor Green "Downloading XML"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

    #Edit host file - add sdx.microsoft.com 
    #Write-Host  -ForegroundColor Green "add host record to block OOBE Updates"
    add-content c:\windows\system32\drivers\etc\hosts "127.0.0.1 sdx.microsoft.com ”

    #Restart from WinPE
    Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
    Start-Sleep -Seconds 20
    wpeutil reboot 
    }
    '192.168.50.1'  
        { 
    net use P: \\172.18.20.10\OSDCloud /user:test Emory2025!!!
    Start-Sleep -Seconds 5

    #Start OSDCloud ZTI the RIGHT way
    Write-Host  -ForegroundColor Green "Start OSDCloud"
    Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
    #Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

    #Download Unattend.xml 
    #Write-Host  -ForegroundColor Green "Downloading XML"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

    #Edit host file - add sdx.microsoft.com 
    #Write-Host  -ForegroundColor Green "add host record to block OOBE Updates"
    add-content c:\windows\system32\drivers\etc\hosts "127.0.0.1 sdx.microsoft.com ”

    #Restart from WinPE
    Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
    Start-Sleep -Seconds 20
    wpeutil reboot 
    } 
    '192.168.130.1' 
        { 
    net use P: \\192.168.1.15\OSDCloud /user:test Emory2025!!!
    Start-Sleep -Seconds 5

    #Start OSDCloud ZTI the RIGHT way
    Write-Host  -ForegroundColor Green "Start OSDCloud"
    Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
    #Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

    #Download Unattend.xml 
    #Write-Host  -ForegroundColor Green "Downloading XML"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

    #Edit host file - add sdx.microsoft.com 
    #Write-Host  -ForegroundColor Green "add host record to block OOBE Updates"
    add-content c:\windows\system32\drivers\etc\hosts "127.0.0.1 sdx.microsoft.com ”

    #Restart from WinPE
    Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
    Start-Sleep -Seconds 20
    wpeutil reboot 
    } 
    '192.168.131.1' 
        { 
    net use P: \\192.168.1.15\OSDCloud /user:test Emory2025!!!
    Start-Sleep -Seconds 5

    #Start OSDCloud ZTI the RIGHT way
    Write-Host  -ForegroundColor Green "Start OSDCloud"
    Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
    #Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

    #Download Unattend.xml 
    #Write-Host  -ForegroundColor Green "Downloading XML"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

    #Edit host file - add sdx.microsoft.com 
    #Write-Host  -ForegroundColor Green "add host record to block OOBE Updates"
    add-content c:\windows\system32\drivers\etc\hosts "127.0.0.1 sdx.microsoft.com ”

    #Restart from WinPE
    Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
    Start-Sleep -Seconds 20
    wpeutil reboot 
    } 
    '192.168.132.1' 
        { 
    net use P: \\192.168.1.15\OSDCloud /user:test Emory2025!!!
    Start-Sleep -Seconds 5

    #Start OSDCloud ZTI the RIGHT way
    Write-Host  -ForegroundColor Green "Start OSDCloud"
    Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
    #Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

    #Download Unattend.xml 
    #Write-Host  -ForegroundColor Green "Downloading XML"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

    #Edit host file - add sdx.microsoft.com 
    #Write-Host  -ForegroundColor Green "add host record to block OOBE Updates"
    add-content c:\windows\system32\drivers\etc\hosts "127.0.0.1 sdx.microsoft.com ”

    #Restart from WinPE
    Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
    Start-Sleep -Seconds 20
    wpeutil reboot 
    }
    '192.168.133.1' 
        { 
    net use P: \\192.168.1.15\OSDCloud /user:test Emory2025!!!
    Start-Sleep -Seconds 5

    #Start OSDCloud ZTI the RIGHT way
    Write-Host  -ForegroundColor Green "Start OSDCloud"
    Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
    #Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

    #Download Unattend.xml 
    #Write-Host  -ForegroundColor Green "Downloading XML"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

    #Edit host file - add sdx.microsoft.com 
    #Write-Host  -ForegroundColor Green "add host record to block OOBE Updates"
    add-content c:\windows\system32\drivers\etc\hosts "127.0.0.1 sdx.microsoft.com ”

    #Restart from WinPE
    Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
    Start-Sleep -Seconds 20
    wpeutil reboot 
    }
    '192.168.134.1' 
        { 
    net use P: \\192.168.1.15\OSDCloud /user:test Emory2025!!!
    Start-Sleep -Seconds 5

    #Start OSDCloud ZTI the RIGHT way
    Write-Host  -ForegroundColor Green "Start OSDCloud"
    Start-OSDCloud -OSVersion 'Windows 11' -OSBuild 24H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume -ZTI
    #Start-OSDCloud -OSVersion 'Windows 10' -OSBuild 22H2 -OSEdition Pro -OSLanguage en-us -OSLicense Volume

    #Download Unattend.xml 
    #Write-Host  -ForegroundColor Green "Downloading XML"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/EMYScripts/win_selection/main/unattend.xml" -OutFile "C:\windows\panther\unattend.xml"

    #Edit host file - add sdx.microsoft.com 
    #Write-Host  -ForegroundColor Green "add host record to block OOBE Updates"
    add-content c:\windows\system32\drivers\etc\hosts "127.0.0.1 sdx.microsoft.com ”

    #Restart from WinPE
    Write-Host  -ForegroundColor Green "Restarting in 20 seconds!"
    Start-Sleep -Seconds 20
    wpeutil reboot 
    }
   'Default' 
        { 
    wpeutil shutdown 
    }
}

} else {
    Write-Host "Passwords do not match. Installation aborted."
wpeutil shutdown
}
