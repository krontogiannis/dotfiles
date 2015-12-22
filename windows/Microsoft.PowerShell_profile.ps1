function global:Get-SystemUptime {
    $operatingSystem = Get-WmiObject Win32_OperatingSystem
    "$((Get-Date) - ([Management.ManagementDateTimeConverter]::ToDateTime($operatingSystem.LastBootUpTime)))"
}

function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    Write-Host $env:COMPUTERNAME.ToLower() -NoNewline -ForegroundColor Red
    Write-VcsStatus
    Write-Host " >" -NoNewline -ForegroundColor Green
    $global:LASTEXITCODE = $realLASTEXITCODE
    return " "
}

function global:Start-ElevatedPrompt {
    if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { 
        Start-Process powershell.exe "-NoLogo -NoProfile -NoExit -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs 
    }
}

Set-Alias sudo Start-ElevatedPrompt 

Write-Host "$env:USERNAME at $env:COMPUTERNAME" -ForegroundColor Yellow
Write-Host "Uptime : $(Get-SystemUptime)" -ForegroundColor yellow
Write-Host "Current directory : $PWD" -ForegroundColor Yellow 
Write-Host " "

Import-Module posh-git