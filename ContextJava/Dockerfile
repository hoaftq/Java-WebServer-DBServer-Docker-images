# escape=`
FROM microsoft/windowsservercore
LABEL maintainer="hoaftq@gmail.com" discription="Java8u161 image for windows container"

# Install java silently
COPY jre-8u161-windows-i586.exe C:\
RUN powershell Start-Process C:\jre-8u161-windows-i586.exe -ArgumentList '/s /L C:/log.txt' -Wait -PassThru
RUN powershell Remove-Item C:\jre-8u161-windows-i586.exe

# Test installation
RUN java -version

# Add enviroment variables for Java
RUN powershell [Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files (x86)\Java\jre1.8.0_161', [System.EnvironmentVariableTarget]::Machine)

# Print the installation log file
RUN powershell cat C:\log.txt