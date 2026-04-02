# simple-dyndns-uppdate
A very simple PowerShell script that handles IPv4 und IPv6 DDNS (DynDNS) updates. Idea stolen from ugg.li. Must be installed on every, if v6 is used. This is not a 'centralized' solution.

## Features
- Custom Update URL, works everwhere
- IPv4 and IPv6
- Send updates only if IP/Prefix changed since last update

## Installation


## Usage
Run PS from task Scheduler:
`%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe`
... with these arguments:
`-noninteractive -file "PATH\simple-ddns-update.ps1" -ExecutionPolicy Bypass`