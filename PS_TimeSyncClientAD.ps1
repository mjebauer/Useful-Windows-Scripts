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
