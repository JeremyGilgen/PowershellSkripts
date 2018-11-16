$path = 'C:\Users\James\Desktop\Module\Modul 122 Abläufe mit Scripts automatisieren Marco Frei\users-INFEFZ17BS.csv'
$CSVname = "user-INEFZ17BS.csv"

$users= Import-CSV $path


foreach ($user in $users)
{
Write-Host "Vorname lautet:" $user.FirstName "Nachname lautet:" $user.LastName
}



