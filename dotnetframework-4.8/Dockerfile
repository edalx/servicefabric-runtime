FROM mcr.microsoft.com/dotnet/framework/runtime:4.8-windowsservercore-ltsc2019
ADD InstallPreReqDotnetFramework4.8.ps1 /
RUN Powershell.exe -ExecutionPolicy Unrestricted -File C:\InstallPreReqDotnetFramework4.8.ps1
RUN setx PATH "%PATH%;c:\sffabricbin" /M