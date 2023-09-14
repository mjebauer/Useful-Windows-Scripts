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

    [System.Windows.Forms.MessageBox]::Show("The computer will be enrolled in the domain, followed by a reboot.", "Warnung", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
    Join-Domain
    
}
