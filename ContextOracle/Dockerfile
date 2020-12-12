# escape=`
FROM microsoft/windowsservercore
LABEL maintainer="hoaftq@gmail.com" discription="Oracle DB" purpose="Playing around"

# Create a temporary folder in the image
RUN powershell New-Item -ItemType directory C:\temp

# Copy Oracle installer zip file to the image and extract it
ADD winx64_12201_database.zip C:\temp
RUN powershell Expand-Archive -LiteralPath C:\temp\winx64_12201_database.zip -DestinationPath C:\temp

# This is a large file so we delete it as soon as posible to reduce the using space
RUN del C:\temp\winx64_12201_database.zip

# Copy response file to the image
COPY install_db.rsp C:\temp

# Install Oracle in silent mode using a response file
RUN powershell Start-Process -FilePath 'C:\temp\database\setup.exe' -ArgumentList '-silent -responseFile C:\temp\install_db.rsp' -Wait -PassThru

# Delete temporary file and its contents
#RUN powershell Remove-Item -r C:\temp

EXPOSE 1521
