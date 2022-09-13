<#
Name: Get M365 Endpoints.ps1

This script is used to read the JSON File for the Microsoft 365 Endpoints published by Microsoft

Below is a list of the files created from this script:
    <Year>-<Month>-<Date>-<Hour>-<Minuite>-Office 365 Worldwide (+GCC).JSON   - This list contains all the IP's listed in the Office 365 Worldwide (+GCC) Endpoint list
    <Year>-<Month>-<Date>-<Hour>-<Minuite>-Office 365 U.S. Government GCC High.JSON   - This list contains all the IP's listed in the Office 365 U.S. Government GCC High Endpoint list
    <Year>-<Month>-<Date>-<Hour>-<Minuite>-Office 365 U.S. Government DoD.JSON   - This list contains all the IP's listed in the Office 365 U.S. Government DoD Endpoint list

Reference URL's
    https://docs.microsoft.com/en-us/microsoft-365/enterprise/urls-and-ip-address-ranges?view=o365-worldwide
    https://docs.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-u-s-government-gcc-high-endpoints?view=o365-worldwide
    https://docs.microsoft.com/en-us/microsoft-365/enterprise/microsoft-365-u-s-government-dod-endpoints?view=o365-worldwide

Michael Patterson
scripts@mwpatterson.com

Revision History
    2022-09-13 - Initial Release

#>

# Get Date & Backup Locations
$date = get-date -Format "yyyy-MM-dd-HH-mm"
$backupRoot = "C:\" #Can use another drive if available
$backupFolder = "Temp\M365Endpoints\"
$backupFolderPath = $backupRoot + $backupFolder
#$backupFileName = $date + "-" + $env:USERDNSDOMAIN #Full Domain Name 
#$backupPath = $backupFolderPath + $backupFileName

# Office 365 endpoints: Office 365 Worldwide (+GCC)
$backupFileName = $date + "-" + "Office 365 Worldwide (+GCC).json" #Full Domain Name 
$backupPath = $backupFolderPath + $backupFileName
#Invoke-WebRequest -Uri https://endpoints.office.com/endpoints/worldwide?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7 | ConvertFrom-Json # Office 365 endpoints: Office 365 Worldwide (+GCC)
$tempAR = Invoke-WebRequest -Uri https://endpoints.office.com/endpoints/worldwide?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7 | ConvertFrom-Json # Office 365 endpoints: Office 365 Worldwide (+GCC)
$tempAR | ConvertTo-Json | Out-File $backupPath

# Office 365 endpoints: Office 365 U.S. Government GCC High
$backupFileName = $date + "-" + "Office 365 U.S. Government GCC High.json" #Full Domain Name 
$backupPath = $backupFolderPath + $backupFileName
#Invoke-WebRequest -Uri https://endpoints.office.com/endpoints/USGOVGCCHigh?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7 | ConvertFrom-Json # Office 365 endpoints: Office 365 U.S. Government GCC High
$tempAR = Invoke-WebRequest -Uri https://endpoints.office.com/endpoints/USGOVGCCHigh?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7 | ConvertFrom-Json # Office 365 endpoints: Office 365 U.S. Government GCC High
$tempAR | ConvertTo-Json | Out-File $backupPath

# Office 365 endpoints: Office 365 U.S. Government DoD
$backupFileName = $date + "-" + "Office 365 U.S. Government DoD.json" #Full Domain Name 
$backupPath = $backupFolderPath + $backupFileName
#Invoke-WebRequest -Uri https://endpoints.office.com/endpoints/USGOVDoD?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7 | ConvertFrom-Json # Office 365 endpoints: Office 365 U.S. Government DoD
$tempAR = Invoke-WebRequest -Uri https://endpoints.office.com/endpoints/USGOVDoD?clientrequestid=b10c5ed1-bad1-445f-b386-b919946339a7 | ConvertFrom-Json # Office 365 endpoints: Office 365 U.S. Government DoD
$tempAR | ConvertTo-Json | Out-File $backupPath


