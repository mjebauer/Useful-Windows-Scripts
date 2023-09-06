#  Short script to join a domain with a client

function Join-Domain {
    $domain = "testadomini.tld" # Enter  domain here
    $puser = "TESTADOMINI\Administrator"  # Enter the domain and privileged user here
    Add-Computer -Domainname $domain -Credential $puser -restart –force

}

Join-Domain
