# =====================================================================
# Programm: laufwerke.ps1
# Aufruf: laufwerke.ps1 ohne Parameter
# Beschreibung: Aufgaben zu Laufwerken und Verzeichnissen, Fachwissen, Folie 14
# Autor: Marco Frei
# Version: 0.2
# Datum: 13.06.2018
# =====================================================================

# Aufgabe 1
# Was bewirken folgende Kommandos?

# 1a)
# Merges Windows Update .etl files into a single log file (Windows 10 / Server 2016)
Get-WindowsUpdateLog
Get-Content $env:homepath\desktop\windowsupdate.log -Encoding UTF8 | Where-Object { $_ -like ‘*completed successfully*' } | Select-Object -First 10 | Out-GridView -Title "completed successfully"

# 1b)
Get-ChildItem -Path $env:windir -File -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.Extension -eq '.bmp' -or $_.Extension -eq '.jpg' } | Out-GridView

# Aufgabe 2
# Wie lautet das Kommando, um im Windowsverzeichnis alle Dateien aufzulisten, welche grösser als 100 MB sind? 

Get-ChildItem -Path $env:windir -recurse | Where-Object { $_.Length -gt 100MB } | Out-Gridview -Title "Dateien grösser 100 MB"

# Ausgabe ergänzt mit Auswahl eigener Eigenschaften
Get-ChildItem -Path $env:windir -recurse | Where-Object { $_.Length -gt 100MB } | Select-Object -Property Length, Name, Directory | Out-Gridview -Title "Dateien grösser 100 MB"
Get-ChildItem -Path $env:windir -recurse -erroraction SilentlyContinue | Where-Object { $_.Length -gt 100MB } | Select-Object -Property Length, Name, Directory | Out-Gridview -Title "Dateien grösser 100 MB"
Get-ChildItem -Path $env:windir -recurse -ea 0 | Where-Object { $_.Length -gt 100MB } | Select-Object -Property Length, Name, Directory | Out-Gridview -Title "Dateien grösser 100 MB"

# Aufgabe 3
# siehe Skript copy-userlog-DOZ.ps1
