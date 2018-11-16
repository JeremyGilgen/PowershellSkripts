# =====================================================================
# Programm: Get-Video-DOZ.ps1
# Aufruf: get-video-doz.ps1 ohne Parameter
# Beschreibung: Videodatei ab dem Internet auf das lokale System in das Homeverzeichnis 
#               des eingeloggten Benutzers herunterladen und direkt mit dem verknüpften 
#               Videoplayer starten
# Autor: Marco Frei
# Version: 0.3
# Datum: 13.06.2018
# =====================================================================

# Videos unter https://www.sample-videos.com/

$PSModuleAutoLoadingPreference = 'none'
$url = 'https://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_10mb.mp4'

Import-Module BITSTransfer 

$DLState = Read-Host -Prompt "interaktiv <1> oder im Hintergrund <2>" 

if ($DLState -eq "1")
{
    # Download erfolgt interaktiv
    Start-BitsTransfer $url $HOME\video1.mp4 # alternativ auch $env:HOMEPATH möglich
    
    # Video mit verknüpftem Media Player öffnen
    Invoke-Item $HOME\video1.mp4
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
