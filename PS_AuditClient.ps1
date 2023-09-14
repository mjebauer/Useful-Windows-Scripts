# MIT License
#
# Copyright (c) 2023 Manuel Jebauer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

clear

# Benutzerdaten abfragen
write-host "-== Eingeloggter Benutzer: ==-"
whoami /user
write-host

# Benutzerkontoinformationen auf dem lokalen Client abrufen
$benutzer = Get-WmiObject -Class Win32_UserAccount

# lokale Benutzerkontoinformationen vom Client anzeigen
write-host "-== Lokale Benutzer ==-"
foreach ($user in $benutzer) {
    Write-Host "Benutzername: $($user.Name)"
    Write-Host "SID: $($user.SID)"
    Write-Host "Vollständiger Name: $($user.FullName)"
    Write-Host "----------------------"
}

write-host "-== Domänen-Benutzer ==-"
write-host
# Laden des System.DirectoryServices.AccountManagement-Namespaces
Add-Type -AssemblyName System.DirectoryServices.AccountManagement

# Verbindungsdaten zur Active Directory-Domäne
$domainName = "testadomini.tld"
$domainContext = [System.DirectoryServices.AccountManagement.ContextType]::Domain
$domain = New-Object System.DirectoryServices.AccountManagement.PrincipalContext $domainContext, $domainName

# Benutzerkonten abrufen
$userPrincipal = New-Object System.DirectoryServices.AccountManagement.UserPrincipal($domain)

# Benutzerkonten durchsuchen und Informationen anzeigen
$users = [System.DirectoryServices.AccountManagement.PrincipalSearcher]::new($userPrincipal)

foreach ($user in $users.FindAll()) {
    Write-Host "Benutzername: $($user.SamAccountName)"
    Write-Host "Anzeigename: $($user.DisplayName)"
    Write-Host "SID: $($user.Sid.Value)"
    Write-Host "Gruppenmitgliedschaften: $($user.GetGroups() | ForEach-Object { $_.Name })"
    Write-Host "Letzte Anmeldung: $($user.LastLogon)"
    Write-Host "----------------------"
}

