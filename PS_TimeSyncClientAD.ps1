# This script is designed to prevent time differences between the Active Directory Server and the client.
# This can help prevent issues with user authentication against the Active Directory.

# Step 1: Check the current status of the Windows Time Service.
w32tm /query /status

# Step 2: Modify the configuration of the Windows Time Service to synchronize time with the Active Directory.
# Make sure to replace "testadomini.tld" with the domain name of your Active Directory.
w32tm /config /manualpeerlist:testadomini.tld /syncfromflags:manual /reliable:YES /update

# Step 3: Stop and restart the Windows Time Service to apply the configuration changes.
net stop w32time
net start w32time

# Step 4: Recheck the current status of the Windows Time Service to ensure successful synchronization.
w32tm /query /status
