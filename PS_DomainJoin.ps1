#  Short script to join a domain with a client

$domainStatus = (Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain
#  Short script to join a domain with a client

function Join-Domain {
    $domain = "testadomini.tld" # Enter  domain here
    $puser = "TESTADOMINI\Administrator"  # Enter the domain and privileged user here
    Add-Computer -Domainname $domain -Credential $puser -restart –force

}

if ($domainStatus) {
    # Show warning message
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

    [System.Windows.Forms.MessageBox]::Show("The computer is already enrolled in the domain.", "Warnung", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    exit

} else {
    # Show warning message
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

    [System.Windows.Forms.MessageBox]::Show("The computer will be enrolled in the domain.", "Warnung", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    Join-Domain
    
}
