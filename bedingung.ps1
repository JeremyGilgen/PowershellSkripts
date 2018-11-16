# =====================================================================
# Programm: bedingung.ps1
# Aufruf: bedingung.ps1 ohne Parameter
# Beschreibung: Bedingungen zur Steuerung von Codeteilen, welche ausgeführt werden
# Autor: Marco Frei
# Version: 0.2
# Datum: 4.6.2018
# =====================================================================

# eingegebene Zahl auswerten
$myKey = 0
$myKey = Read-Host -Prompt "Bitte gebe eine Zahl ein!"

if ($myKey -ne 0) { Write-Output "Ich bin keine Null !" }

if ($myKey -eq 1)
{
    # echo ist ein Alias für das Cmdlet Write-Output
    echo "Ich bin eine 1 !"    
}

# else-Teil kann auch weggelassen werden

else
{
    Write-Host "Ich bin keine 1, sondern eine" $myKey
}

# Ladezustand ausgeben
Read-Host "Ladezustand ausgeben"
$ladezustand = Get-WmiObject -Class Win32_Battery |
Measure-Object -Property EstimatedChargeRemaining -Average |
Select-Object -ExpandProperty Average
$alarm = $ladezustand -lt 10

if ($ladezustand -eq $null)
{
    'Kein Akku vorhanden.'
}

elseif ($alarm -eq $true)
{
    'Hier könnte eine Alarmmeldung oder Aktion stehen'
}

else
{
    Write-Host "Alles in Ordnung, Ladezustand:" $ladezustand " %"
}

# Uhrzeiten auswerten
Read-Host "Uhrzeiten auswerten"
$datum = Get-Date
$stunde = $datum.Hour

Switch ($stunde)
{
    { $_ -gt 6 -and $_ -lt 12 } { 'Guten Morgen!' }
    { $_ -ge 12 -and $_ -le 13 } { 'en Guete!' }
    { $_ -gt 13 -and $_ -lt 18 } { 'Bald ist Feierabend ...!' }
    { $_ -ge 18 } { 'Bis morgen!' }
    default { 'Es herrscht Nacht ...' }
}

