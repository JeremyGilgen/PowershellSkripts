#=================================================================================
#Programm: Import-INZ-JeGi
#Beschreibung: Importiert Vor- und Nachnamen aus der Exceldatei und zeigt diese an
#Autor: Jeremy Gilgen
#Version 1.0
#Datum: 29.06.2018
#=================================================================================

$path = 'C:\Users\James\Desktop\Module\Modul 122 Abl�ufe mit Scripts automatisieren Marco Frei\Abschlusspr�fung\users-IBZ.csv'
$CSVname = "users-IBZ.csv"

$users= Import-CSV $path


foreach ($user in $users)
{
Write-Host "Vorname lautet:" $user.FirstName "Nachname lautet:" $user.LastName
}

