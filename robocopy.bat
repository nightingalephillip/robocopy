@echo off
set /p SOURCE=Please enter the FQDN for your source:
set /p DESTINATION=Please enter the FQDN for your destination:
set /P LOGFILENAME=Please enter the name for your log file:

#specifies the log file path and name with the current date and time appended to the user-provided log file name. 
#perform the file copy operation

if not exist "C:\temp\" mkdir C:\temp
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/: " %%a in ("%TIME%") do (set mytime=%%a%%b)
robocopy "%SOURCE%" "%DESTINATION%" /LOG+:c:\temp\%LOGFILENAME%_%mydate%_%mytime%.txt /TEE /E /FP /R:2 /W:1 /NP /V /COPY:DAT /DCOPY:DAT
pause
