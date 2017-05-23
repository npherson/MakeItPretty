$cs = Get-WmiObject -Class Win32_ComputerSystem
$myPath = split-path -parent $MyInvocation.MyCommand.Path

Copy-Item -Path "$myPath\OEMLogo.bmp" -Destination "$Env:systemroot\system32\" -Force

$manufacturer = $cs.Manufacturer
$model = $cs.Model

if(-not (Test-Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation"))
{
    New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion" -Name "OEMInformation"
}
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation" -Name Logo -PropertyType String -Value "%systemroot%\system32\OEMLogo.bmp" -Force
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation" -Name Manufacturer -PropertyType String -Value "$manufacturer" -Force
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation" -Name Model -PropertyType String -Value "$model" -Force
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation" -Name SupportHours -PropertyType String -Value "9 AM - 5 PM" -Force
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation" -Name SupportPhone -PropertyType String -Value "0118 999 881 999 119 725 3" -Force
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\OEMInformation" -Name SupportUrl -PropertyType String -Value "http://ServiceDesk.dundermifflin.com" -Force
