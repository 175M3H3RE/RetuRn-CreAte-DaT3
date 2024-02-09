@echo off
set /a realtoken=0
set createdate=
if not exist %1 goto :eof
set /a counter=0
for /f %%i in ('dir /a-d /b %1') do set /a counter+=1
if %counter% NEQ 1 goto :eof
:loop
set /a realtoken+=1
for /f "tokens=%realtoken%" %%i in ('dir /a-d /tC %1 2^>NUL^|findstr /r "^[0-9]"') do echo %%i|findstr /r "^[0-9-/]*$" >NUL&&set createdate=%%i
if defined createdate goto end
goto :loop
:end
echo %createdate%