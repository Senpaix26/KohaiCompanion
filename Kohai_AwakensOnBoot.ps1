# Run this script with admin privileges to auto-start Kohai-chan on boot

$InstallPath = "$env:USERPROFILE\KohaiSoulforge"
$ScriptPath = "$InstallPath\KohaiLauncher.bat"

New-Item -ItemType Directory -Path $InstallPath -Force
"start /d `"$InstallPath\SillyTavern`" start.bat" | Out-File -Encoding ascii $ScriptPath

$Action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c $ScriptPath"
$Trigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName "KohaiAwakens" -Description "Auto-start Kohai-chan at boot" -User "$env:USERNAME" -Force
