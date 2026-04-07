# Very Simple DDNS Client für PowerShell von ugg.li
# Github: https://github.com/weed-/simple-dyndns-uppdate/
# GPLv2

# --- configuration
$updateURL = "https://YOUR-DDNS-ISP.EXAMPLE.COM/URL/dnsupdate"
$hostname = "MYHOSTNAME.EXAMPLE.COM"
$username = "USERNAME"
$password = "PASSWORD"
$stateFile = "$env:ProgramData\simple-ddns-script_state.json"

# --- IPs holen (v4 und v6)
$ipv6 = (Resolve-DnsName myip.opendns.com -Server 2620:119:35::35 -Type AAAA).IPAddress
$ipv4 = (Resolve-DnsName myip.opendns.com -Server 208.67.222.222 -Type A).IPAddress

# --- IPv6 Präfix (z. B. /64) extrahieren, ggf. Prefix-Länge anpassen!
$ipv6Prefix = ($ipv6 -split ":")[0..3] -join ":"

# --- Alte Werte laden (falls vorhanden)
$oldIPv4 = $null
$oldIPv6Prefix = $null

if (Test-Path $stateFile) {
    $state = Get-Content $stateFile | ConvertFrom-Json
    $oldIPv4 = $state.ipv4
    $oldIPv6Prefix = $state.ipv6Prefix
}

# --- Aktuelle Werte mit alten vergleichen
if ($ipv4 -ne $oldIPv4 -or $ipv6Prefix -ne $oldIPv6Prefix) {
    Write-Host "Neue IP, Update wird gesendet ..."
    curl.exe --user "${username}:${password}" "${updateURL}?hostname=${hostname}&myip=${ipv4}&myip6=${ipv6}"

    # --- neue Werte speichern
    $newState = @{
        ipv4 = $ipv4
        ipv6Prefix = $ipv6Prefix
    }
    $newState | ConvertTo-Json | Set-Content $stateFile
} else {
    Write-Host "Keine Aenderung der IP, kein Update."
}
