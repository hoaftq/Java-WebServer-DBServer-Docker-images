rem Execute the installer in silent mode
@echo off
"C:\temp\Oracle WebLogic Server 11gR1 (10.3.6) + Coherence + OEPE - Package Installer.exe" -mode=silent -silent_xml=C:\temp\silent.xml -log=C:\temp\logs\weblogic_silent.log
@rem Return an exit code to indicate success or failure of installation
set exit_code=%ERRORLEVEL%

@echo.
@echo Exitcode=%exit_code%
@echo.
@echo Exit Code Key
@echo ---------------
@echo  0=Installation completed successfully
@echo -1=Installation failed due to a fatal error
@echo -2=Installation failed due to an internal XML parsing error
@echo.
