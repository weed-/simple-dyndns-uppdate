# simple-dyndns-uppdate
A very simple PowerShell script that handles IPv4 und IPv6 DDNS (DynDNS) updates. Idea stolen from ugg.li. Must be installed on every machine, if IPv6 is used. This is not a 'centralized' solution.

## Features
- Custom Update URL (works everwhere)
- Gets IPv4 and IPv6 public adress via openDNS
- Send updates only if IP or Prefix changed since last update

## Installation
Just download, save to secure location (your credentials will be saved in this), edit the parameters ("configuration") and use it.

## Usage
Run PS from task Scheduler:
`%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe`
... with these arguments:
`-noninteractive -file "PATH\simple-ddns-update.ps1" -ExecutionPolicy Bypass`