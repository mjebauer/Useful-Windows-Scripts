# Install Windows Update from elevated Powershell

# Import the Windows Update module
Import-Module -Name WindowsUpdate
Get-WindowsUpdate -Install -Confirm:$false
