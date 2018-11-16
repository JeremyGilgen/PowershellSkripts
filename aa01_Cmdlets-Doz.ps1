# =====================================================================
# Programm: aa01-Cmdlets-Doz.ps1
# Aufruf: aa01-cmdlets-doz.ps1 ohne Parameter
# Beschreibung: Arbeitsauftrag aa01, Antworten zu Aufgabe 3 / 4
# Autor: Marco Frei
# Version: 0.2
# Datum: 25.02.2018
# =====================================================================

# Aufgabe 3a)
Get-Date -Uformat %V
Get-Date -Uformat %V -Date 1970-11-24

# Aufgabe 3b)
(Get-Date).AddHours(-24)

# Aufgabe 3c)
Get-EventLog -LogName System -EntryType Error,Warning -After (Get-Date).AddHours(-24) | Out-GridView -Title "Ausgabe"
Get-EventLog -LogName System -EntryType Error,Warning -After (Get-Date).AddHours(-24) | Format-Table -Wrap | Out-File $Home\Desktop\EventlogTable.txt
Get-EventLog -LogName System -EntryType Error,Warning -After (Get-Date).AddHours(-24) | Format-List | Out-File $Home\Desktop\EventlogList.txt

# Aufgabe 3d)
Get-Service -Name S* | Where-Object {$_.Status -eq "Running"}
Get-Service S* | where Status -eq "Running" # abgekürzte Version mit Alias und ohne Skriptblock
Get-Service -DisplayName S* | Where-Object {$_.Status -eq "Running"}

# Exkurs: Zugriff auf alle Eigenschaften einer Objektabfrage
Get-Service -Name S* | Select-Object * | Out-GridView
Get-Service -Name S* | Export-Csv $Home\Desktop\service-n.csv

# PowerShell-Remoting - Verbindungsaufbau
Enter-PSSession -ComputerName hfi-srv-doz1 -Credential scriptuser

# Aufgabe 4c)
Get-EventLog -LogName System -EntryType Error,Warning -After (get-date).AddDays(-1) | Out-File c:\Users\scriptuser\Desktop\Eventlog.txt

# Hinweis: lokal ausführen FENSTER AUFZEIGEN
Invoke-Command 10.1.2.123 -ScriptBlock { Get-EventLog -LogName System -EntryType Error,Warning -After (Get-Date).AddDays(-1) } -credential scriptuser | Out-Gridview -Title "Ausgabe"

# Aufgabe 4d)
Get-Service "S*" | where {$_.status -eq "running"} | Out-File c:\Users\scriptuser\Desktop\Services.txt

