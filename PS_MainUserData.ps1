$daten=(get-aduser -identity $args[0] -Properties * | Select Surname, GivenName, DisplayName, employeeType, SamAccountName, EmailAddress, UserPrincipalName, mailNickname, DistinguishedName, physicalDeliveryOfficeName, PasswordLastSet)

# LastLogonDate
# Description
# PasswordLastSet
# PasswordExpired

#write-host "Nachname: " $daten.Surname
#write-host "Vorname: " $daten.GivenName
#write-host "Anzeigename: " $daten.DisplayName
#write-host "Anmeldename: " $daten.SamAccountName
#write-host "UPN: " $daten.UserPrincipalName
#write-host "Mail-Nickname: " $daten.mailNickname

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
