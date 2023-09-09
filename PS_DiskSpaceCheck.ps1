clear
$MininmalHDDSizeGB=52
$diskSpace = Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

foreach ($disk in $diskSpace) {
    $freeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)  # Umrechnung in GB mit Rundung auf 2 Dezimalstellen
    if ($freeSpaceGB -lt $MininmalHDDSizeGB) {
        Write-Host "Warnung: Geringer Festplattenplatz auf $($disk.DeviceID). Freier Speicherplatz: $freeSpaceGB GB"
    }
}
