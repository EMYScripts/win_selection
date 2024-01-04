#Remove News Feeds & Widget
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f
ECHO Yes | Winget uninstall "Windows Web Experience pack"

#Remove Windows Store
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v RemoveWindowsStore /t REG_DWORD /d 1 /f

#OSDCloud Cleanup	
Remove-Item -Path C:\Drivers, C:\OSDCloud -Recurse -Force