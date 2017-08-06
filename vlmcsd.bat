@echo off

goto %1

:install
sc create vlmcsd binPath= "%~dp0vlmcsd-Windows-x%PROCESSOR_ARCHITECTURE:~-2%.exe -i %~dp0vlmcsd.ini" start= auto
timeout 5
sc start vlmcsd
goto end

:windows
cscript c:\windows\system32\slmgr.vbs /skms 10.10.10.10
cscript c:\windows\system32\slmgr.vbs /ato
cscript c:\windows\system32\slmgr.vbs /dlv
goto end

:office
cscript "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /sethst:10.10.10.10
cscript "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /act
cscript "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" /dstatusall

:end