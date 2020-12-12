# escape=`
FROM microsoft/windowsservercore
LABEL maintainer="hoaftq@gmail.com" discription="Tomcat 8.5 for windows container"

# Install java silently
COPY jre-8u161-windows-i586.exe C:\
RUN powershell Start-Process C:\jre-8u161-windows-i586.exe -ArgumentList '/s /L C:/log.txt' -Wait -PassThru
RUN ["powershell", "Remove-Item", "C:\\jre-8u161-windows-i586.exe"]

# Test installation
RUN java -version

# Add enviroment variables for Java
RUN powershell [Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files (x86)\Java\jre1.8.0_161', [System.EnvironmentVariableTarget]::Machine)

# Install tomcat
ADD apache-tomcat-8.5.28-windows-x64.zip C:\
RUN powershell Expand-Archive -Path C:\apache-tomcat-8.5.28-windows-x64.zip -DestinationPath C:\
RUN powershell Remove-Item C:\apache-tomcat-8.5.28-windows-x64.zip

# Add enviroment variables for Tomcat
RUN powershell [Environment]::SetEnvironmentVariable('CATALINA_HOME', 'C:\apache-tomcat-8.5.28', [System.EnvironmentVariableTarget]::Machine)

EXPOSE 8080

# Start Tomcat as the container is started
CMD powershell Start-Process C:\apache-tomcat-8.5.28\bin\startup.bat -Wait