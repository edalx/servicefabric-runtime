$scriptDirectory = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

$dotnetUrl = "https://download.visualstudio.microsoft.com/download/pr/cfe420d5-084c-4590-b387-f89f3387d4c9/db4c577b995c54dee0530d8230e87145/dotnet-runtime-3.1.2-win-x64.exe"
$ASPNetCoreUrl = "https://download.visualstudio.microsoft.com/download/pr/326b33d1-6bbd-4149-ba35-c94784700674/c06386c2b09401fa94f9595617899d5d/aspnetcore-runtime-3.1.2-win-x64.exe"
$vcpp11redistUrl = "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
$vcpp14redistUrl = "https://download.visualstudio.microsoft.com/download/pr/11687625/2cd2dba5748dc95950a5c42c2d2d78e4/VC_redist.x64.exe"
$TempDir = $env:TEMP
$dotnetPath = Join-Path $TempDir "dotnet-runtime-3.1.2-win-x64.exe"
$ASPNetCorePath = Join-Path $TempDir "aspnetcore-runtime-3.1.2-win-x64.exe"
$vcpp11redistPath = Join-Path $TempDir "vcredist_x64.exe"
$vcpp14redistPath = Join-Path $TempDir "VC_redist.x64.exe"


$DownloadStartTime = [DateTime]::UtcNow 
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($dotnetUrl, $dotnetPath)
$DownloadEndTime = [DateTime]::UtcNow 

if(Test-Path($dotnetPath))
{
    Write-Output "$($dotnetPath) file download Time: $(($DownloadEndTime).Subtract($DownloadStartTime).TotalSeconds) secs"

    Write-Output "Installing dotnetcore 3.1.2..."
    
    Start-Process "$dotnetPath" -ArgumentList "/install /quiet /norestart /log $(Join-Path $scriptDirectory log.txt)" -Wait

    Write-Output "Done."
}
else
{
    Write-Error "Download failed"
}

$DownloadStartTime = [DateTime]::UtcNow 
$webClient.DownloadFile($ASPNetCoreUrl, $ASPNetCorePath)
$DownloadEndTime = [DateTime]::UtcNow 

if(Test-Path($ASPNetCorePath))
{
    Write-Output "$($ASPNetCorePath) file download Time: $(($DownloadEndTime).Subtract($DownloadStartTime).TotalSeconds) secs"

    Write-Output "Installing asp net core 3.1.2..."
    
    Start-Process "$ASPNetCorePath" -ArgumentList "/install /quiet /norestart /log $(Join-Path $scriptDirectory asplog.txt)" -Wait

    Write-Output "Done."
}
else
{
    Write-Error "Download failed"
}


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