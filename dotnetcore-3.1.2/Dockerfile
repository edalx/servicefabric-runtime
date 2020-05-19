FROM mcr.microsoft.com/windows/servercore:1809
ADD InstallPreReqDotnetCore3.1.2.ps1 /
RUN powershell -File C:\InstallPreReqDotnetCore3.1.2.ps1
RUN setx PATH "%PATH%;c:\sffabricbin" /M