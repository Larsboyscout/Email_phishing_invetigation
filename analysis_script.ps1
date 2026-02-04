# SOC Analyst File Integrity Check
$filePath = ".\26-82161805190996.docx"

# 1. Generate SHA256 Hash to check against VirusTotal/Talos
Write-Host "Generating File Hash..." -ForegroundColor Cyan
Get-FileHash -Path $filePath -Algorithm SHA256

# 2. Check for 'Hidden' or 'System' attributes
Write-Host "`nChecking File Attributes..." -ForegroundColor Cyan
Get-Item -Path $filePath | Select-Object Name, Attributes, Length

# 3. Check for Alternative Data Streams (ADS) 
# Malware sometimes hides payloads in 'Zone.Identifier' or custom streams
Write-Host "`nChecking for Alternative Data Streams..." -ForegroundColor Cyan
Get-Item -Path $filePath -Stream *
