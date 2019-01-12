# use: 快速安裝常用軟件
# author: nat
# email: nattu319@gmail.com
# choco official: https://chocolatey.org
# 檔案格式: powershell
# 執行步驟: 1.安裝chocolatey 2.安裝chocolateyGUI 3.安裝自選的軟件

# Q:如何執行此程式?
# A:管理員打開PowerShell, 先到程式存放的位置, ./chocolatey-install.ps1 按下Enter即可.

#--------------------1.安裝chocolatey--------------------

# 安裝方法(擇一)

# 方法一 : 用管理員打開 cmd 將以下的指令複製貼上
# @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# 方法二 : 用管理員打開 powershell 將以下的指令複製貼上
# Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


# 方法二可能出現以下錯誤

# 執行ps1時出現錯誤:「系統上已停用指令碼執行」,請執行以下命令.
# RemoteSigned的說明:指令碼可以執行。 從網際網路下載的指令碼和組態檔都必須有受信任發行者的數位簽章 (包括由電子郵件程式和立即訊息程式所下載)。 已在本機電腦上執行及撰寫的指令碼 (並非從網際網路所下載) 不需要數位簽章。 執行已簽署但惡意的指令碼會有風險。

# 解決方法,執行以下指令

# Set-ExecutionPolicy RemoteSigned

# 前面那段RemoteSigned執行後還是有錯誤訊息: 未經數位簽署。您無法在目前的系統上執行此指令碼。
# Unrestricted的說明: 可以執行未經簽署的指令碼  (執行惡意的指令碼會有風險)。 在執行從網際網路下載的指令碼和組態檔之前，對使用者提出警告。

# 解決方法,執行以下指令

# Set-ExecutionPolicy Unrestricted 

#--------------------1.安裝chocolatey結束--------------------





#--------------------2.安裝chocolateyGUI--------------------

# chocolatey
choco install -y chocolateygui chocolatey-core.extension

#--------------------2.安裝chocolateyGUI結束--------------------

#------------------------提示選單-------------------------------

[flags()] 
enum CustomBitFlags
{
    None = 0
    office = 1
    develop = 2
    server = 4
    runtimes = 8
    tool = 16
}
Write-Host "
    (1)office = wpsoffice, pdfp `n
    (2)develop = git, cmder, vscode, ftp `n
    (4)lamp = lamp `n
    (8)vm = vm `n
    (16)docker = docker `n
    (31)all `n
ex:install all,please enter 31`n";

$rawflags = Read-Host "please enter your number(flag): "
[CustomBitFlags]$flags = $rawflags

#--------------------------------------------------------------

#---------------------3.安裝自選的軟件-------------------------
# flag1
if ( $flags.HasFlag([CustomBitFlags]::office) ) 
{ 
    write-host "starting install office packages..."
    choco install -y wps-office-free adobereader
}
# flag2
if ( $flags.HasFlag([CustomBitFlags]::develop) ) 
{ 
    write-host "starting install develop packages..." 
    choco install -y git.install cmder vscode filezilla
}
# flag 4
if ( $flags.HasFlag([CustomBitFlags]::lamp) ) 
{ 
    write-host "starting install lamp..." 
    choco install -y bitnami-xampp mysql.workbench
}
#flag 8
if ( $flags.HasFlag([CustomBitFlags]::vm) ) 
{ 
    write-host "starting install vm..." 
    choco install -y virtualbox virtualbox.extensionpack vboxvmservice vagrant

}
#flag 16
if ( $flag.HasFlag([CustomBigFlags]::docker))
{
  choco install -y docker docker-compose docker-for-windows
  
}

#---------------------3.安裝自選的軟件結束-------------------------

Write-Host "Done,please close the window.`n"

