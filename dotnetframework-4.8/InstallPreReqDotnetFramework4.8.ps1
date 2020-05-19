$scriptDirectory = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

#$dotnetFrameworkUrl = "http://go.microsoft.com/fwlink/?LinkId=2085155"
$vcpp11redistUrl = "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
$vcpp14redistUrl = "https://download.visualstudio.microsoft.com/download/pr/11687625/2cd2dba5748dc95950a5c42c2d2d78e4/VC_redist.x64.exe"
$TempDir = $env:TEMP
#$dotnetFrameworkPath = Join-Path $TempDir "ndp48-web.exe"
$vcpp11redistPath = Join-Path $TempDir "vcredist_x64.exe"
$vcpp14redistPath = Join-Path $TempDir "VC_redist.x64.exe"


$webClient = New-Object System.Net.WebClient
$DownloadStartTime = [DateTime]::UtcNow 
$webClient.DownloadFile($vcpp11redistUrl, $vcpp11redistPath)
$DownloadEndTime = [DateTime]::UtcNow 

if(Test-Path($vcpp11redistPath))
{
    Write-Output "$($vcpp11redistPath) file download Time: $(($DownloadEndTime).Subtract($DownloadStartTime).TotalSeconds) secs"

    Write-Output "Installing vc++ 11 Redistributable..."
    
    Start-Process "$vcpp11redistPath" -ArgumentList "/install /quiet /norestart /log $(Join-Path $scriptDirectory vcpp11redistlog.txt)" -Wait

    Write-Output "Done."
}
else
{
    Write-Error "Downlaod failed"
}

$DownloadStartTime = [DateTime]::UtcNow 
$webClient.DownloadFile($vcpp14redistUrl, $vcpp14redistPath)
$DownloadEndTime = [DateTime]::UtcNow 

if(Test-Path($vcpp14redistPath))
{
    Write-Output "$($vcpp14redistPath) file download Time: $(($DownloadEndTime).Subtract($DownloadStartTime).TotalSeconds) secs"

    Write-Output "Installing vc++ 14 Redistributable..."
    
    Start-Process "$vcpp14redistPath" -ArgumentList "/install /quiet /norestart /log $(Join-Path $scriptDirectory vcpp14redistlog.txt)" -Wait
    
    Write-Output "Done."
}
else
{
    Write-Error "Downlaod failed"
}