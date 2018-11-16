#_____________________
#Programm: Get-Video-JeGi
#Beschreibung: Video downloaden und lokal abspielen
#Location:c:\windows\system32
#Autor: Jeremy Gilgen
#Datum: 25.06.2018
#Version 1.0
#_____________________


Get-Module
Get-Module -ListAvailable

$PSModuleAutoLoadingPreference = 'none'
Get-Command -Module "Bitstransfer"


Import-Module BitsTransfer

#synchron herunterladen
$path = "home\desktop\Hasenvideo"
$url = "https://sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4"
$Hase = "C:\home\desktop"
if (Test-Path -eq $path)
{
new-item -Path $path -ItemType Directory -ErrorAction SilentlyContinue
}
Start-BitsTransfer -Source $url -Destination "$home\desktop\Hase.mp4" 

Invoke-Item -path "$home\desktop\Hase.mp4"

#asynchron herunterladen
#video donwloaden von www.sample-videos.com
$PSModuleAutoLoadingPreference = 'none'
$url = "https://sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4"

Import-Module BitsTransfer

$DLState = Read-Host -Prompt "Interaktiv <1> ider im Hintergrund <2>"
if ($DLState -eq "1")
{
Start-BitsTransfer $url $home\video1.mp4 #alternativ auch $env:HOMEPATH möglich
Invoke-Item $home\video1.mp4
}
elseif ($DLState -eq "2")
{
    # Download erfolgt im Hintergrund
    $DLJobID = Start-BitsTransfer -asynchronous $url $HOME\video2.wmv 

    # Download Status prüfen
    while ($DLJobID.JobState -eq "connecting")
    {
        write-host "connecting..."
        sleep (1)
    }

    while ($DLJobID.JobState -eq "transferring")
    {
        write-host "downloading..."
        sleep (1)
    }

    if ($DLJobID.JobState -eq "Transferred")
    {
        Get-BitsTransfer | Complete-BitsTransfer 
        write-host "transferred..."
        Invoke-Item $HOME\video2.wmv
    }
    else
    {
        write-host "Download fehlgeschlagen !"
    }
}

else
{
    Write-Host "falsche Taste"
}

Remove-Module BITSTransfer
Get-Module
Clear-Variable PSModuleAutoLoadingPreference
