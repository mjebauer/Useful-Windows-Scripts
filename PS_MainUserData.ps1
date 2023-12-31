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


# German:
# PowerShell-Skript zur Abfrage von Benutzerdaten aus der Windows Active Directory.
# Dieses Skript ist nützlich für Administratoren und Support-Mitarbeiter, um schnell auf Benutzerinformationen zuzugreifen und sie in die Zwischenablage zu kopieren.
# Auf Clients setzt es die Verwendung der Remote Server Administration Tools (RSAT) voraus.

# Script to gather user data from Windows Active Directory. On clients, you will need the Remote Server Administration Tools (RSAT).


$daten=(get-aduser -identity $args[0] -Properties * | Select Surname, GivenName, DisplayName, employeeType, SamAccountName, EmailAddress, UserPrincipalName, mailNickname, DistinguishedName, physicalDeliveryOfficeName, PasswordLastSet)

$Output="Nachname: "+$daten.Surname+"`r`n"
$Output+="Vorname: "+$daten.GivenName+"`r`n"
$Output+="Anzeigename: "+$daten.DisplayName+"`r`n"
$Output+="Anmeldename: "+$daten.SamAccountName+"`r`n"
$Output+="UPN: "+$daten.UserPrincipalName+"`r`n"
$Output+="OU: "+$daten.DistinguishedName+"`r`n"
$Output+="Kostenstelle: "+$daten.physicalDeliveryOfficeName+"`r`n"
$Output+="Email-Adresse: "+$daten.EmailAddress+"`r`n"
$Output 
$daten
$Output | clip
