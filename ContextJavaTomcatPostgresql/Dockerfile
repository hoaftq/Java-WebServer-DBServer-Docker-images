# escape=`
FROM microsoft/windowsservercore
LABEL maintainer="hoaftq@gmail.com" discription="Tomcat 8.5 and Postgre 10.3-1 for windows container"

# Install java silently
COPY jre-8u161-windows-i586.exe C:\
RUN powershell Start-Process C:\jre-8u161-windows-i586.exe -ArgumentList '/s /L C:/log.txt' -Wait -PassThru
RUN powershell Remove-Item C:\jre-8u161-windows-i586.exe

# Test installation
RUN java -version

# Add enviroment variables for Java
RUN powershell [Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files (x86)\Java\jre1.8.0_161', [System.EnvironmentVariableTarget]::Machine)

# Install tomcat
ADD apache-tomcat-8.5.28-windows-x64.zip C:\
RUN powershell Expand-Archive -Path C:\apache-tomcat-8.5.28-windows-x64.zip -DestinationPath C:\

# Add enviroment variables for Tomcat
RUN powershell [Environment]::SetEnvironmentVariable('CATALINA_HOME', 'C:\apache-tomcat-8.5.28', [System.EnvironmentVariableTarget]::Machine)

# Deploy webappsample project to Tomcat
COPY webappsample C:\apache-tomcat-8.5.28\webapps\webappsample

#Install Postgre in unattended mode
COPY postgresql-10.3-1-windows-x64.exe C:\
RUN powershell Start-Process 'C:\postgresql-10.3-1-windows-x64.exe' -ArgumentList '--unattendedmodeui none --mode unattended --servicename postgresql-10.3-1 --superaccount postgres --superpassword postgres' -Wait -PassThru
# This will allow us to connect to the container from a machine with an IP of 10.128.5.111/24
RUN powershell Add-Content -Path 'C:\Program Files\PostgreSQL\10\data\pg_hba.conf' -Value 'host    all             all             10.128.5.111/24            md5'

EXPOSE 8080
EXPOSE 5432

# Start Tomcat when the container is starting
CMD powershell Start-Process 'C:\apache-tomcat-8.5.28\bin\startup.bat' -Wait