# escape=`
FROM microsoft/windowsservercore
LABEL maintainer="hoaftq@gmail.com" discription="Oracle WebLogic Server 11gR1 (10.3.6) + Coherence + OEPE for windows container"

# Copy all installation files to C:\temp in the image
COPY .\ C:\temp

# Install java silently
RUN powershell Start-Process C:\temp\jre-8u161-windows-i586.exe -ArgumentList '/s /L C:/log.txt' -Wait -PassThru

# Test installation
RUN java -version

# Add enviroment variables for Java
RUN powershell [Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files (x86)\Java\jre1.8.0_161', [System.EnvironmentVariableTarget]::Machine)

# Install Weblogic
RUN C:\temp\install.bat

# Creat a domain for WebLogic
RUN C:\Oracle\Middleware_Home\oracle_common\common\bin\wlst.cmd C:\temp\create_domain.py

# Delete the temporary folder and its contents
RUN powershell Remove-Item C:\temp -Recurse

# Start WebLogic when deploying the image to a container
CMD C:\Oracle\Middleware_Home\user_projects\domains\testdomain\bin\startWebLogic.cmd
