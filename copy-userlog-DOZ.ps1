# =====================================================================
# Programm: Copy-UserLog-DOZ.ps1
# Aufruf: copy-userlog-doz.ps1 ohne Parameter
# Beschreibung: kopiert alle log-Dateien aus dem gesamten Benutzerprofil
# in den Ordner C:\BackupUserLog 
# Autor: Marco Frei
# Version: 0.1
# Datum: 28.08.2017
# =====================================================================

# Festlegung des Quellpfades
$sourcePath = $env:USERPROFILE
# $sourcePath = $env:windir

# Festlegung des Zielpfades
$destPath = "C:\BackupUserLogs"
# $destPath = "C:\BackupWinLogs"

# überprüfen, ob ein Ordner oder eine Datei existiert:
if ( (Test-Path -Path $destPath) -eq $false)
{
    New-Item $destPath -ItemType Directory
}
# alle Protokolldateien (*.log) aus dem gesamten Benutzerprofil in einen Backup-Ordner kopieren 
# unterschiedliche Ausführungsreihenfolge zwischen Parameter -filter und -include 
Get-ChildItem -Path $sourcePath -include *.log -Recurse -Force -ErrorAction Continue -File | Copy-Item -Destination $destPath -ErrorAction SilentlyContinue 

# Ordner im Windows-Explorer öffnen:
Invoke-Item -Path $destPath

# =====================================================================
# Option: einfache Logdatei führen
# =====================================================================

# $myDate = Get-Date -Format 'yyyyMMdd'
# $myLogName = "_" + $myDate + "_log.txt"

$myLogName = "_" + (Get-Date -Format 'yyyyMMdd') + "_log.txt"
$myLogPath = "C:\BackupLogs"
if ( (Test-Path -Path $myLogPath) -eq $false) { New-Item $myLogPath -ItemType Directory }

Get-ChildItem -Path $destPath | select Name, CreationTime | Out-File "$myLogPath\$myLogName"
