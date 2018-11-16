# =====================================================================
# Programm: testkommandos.ps1
# Aufruf: testkommandos.ps1 ohne Parameter
# Beschreibung: Kommandos zum Unterricht PowerShell Grundlagen
# Autor: Marco Frei
# Version: 0.1
# Datum: 23.05.2018
# =====================================================================

# Datum anzeigen
Get-Date

# Prozesse anzeigen
Get-Process

# Verzeichnis auflisten
dir
ls
Get-ChildItem

# Programmversion abfragen
$PSVersionTable

# Ereignisanzeige filtern
Get-EventLog -LogName System -EntryType Error, Warning -Message *service* -Newest 15

# Parametertypen
Get-ChildItem -Path c:\windows -Filter *.log # benannter Parameter

Get-Eventlog -List # Switch Parameter

Get-Service Spooler # Positionsparameter
Get-ChildItem c:\windows *.log

Get-Process -Name s* -FileVersionInfo # enthält Fehlermeldungen 
Get-Process -Name s* -FileVersionInfo -ErrorAction SilentlyContinue # Fehlermeldungen unterdrücken
Get-Process -Name s* -FileVersionInfo -ea 0 # Aliasnamen für Parameter
    
# Ausführungsrichtlinie anpassen
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force # Windows 8
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force # Windows 10