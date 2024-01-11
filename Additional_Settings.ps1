#Remove News Feeds & Widget
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f
ECHO 'Y' | Winget uninstall "Windows Web Experience pack"


reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v EnableDynamicContentInWSB /t REG_DWORD /d 0 /f

#Remove Windows Store
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 1 /f

Get-appxpackage -allusers *Microsoft.WindowsStore* | Remove-AppxPackage -allusers

#OSDCloud Cleanup	
Remove-Item -Path C:\Drivers, C:\OSDCloud -Recurse -Force
