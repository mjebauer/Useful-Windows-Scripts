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

# The purpose of this script is to determine if enough space on the harddrive is left in regard of updates and installation of software.


clear
$MininmalHDDSizeGB=52
$diskSpace = Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($disk in $diskSpace) {
    $freeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)  # Umrechnung in GB mit Rundung auf 2 Dezimalstellen
    if ($freeSpaceGB -lt $MininmalHDDSizeGB) {
        Write-Host "Warnung: Geringer Festplattenplatz auf $($disk.DeviceID). Freier Speicherplatz: $freeSpaceGB GB"
    }
}
