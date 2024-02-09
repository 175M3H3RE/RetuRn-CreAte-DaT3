@echo off
set /a realtoken=0
set writedate=
if not exist %1 goto :eof
set /a counter=0
for /f %%i in ('dir /a-d /b %1') do set /a counter+=1
if %counter% NEQ 1 goto :eof
:loop
set /a realtoken+=1
for /f "tokens=%realtoken%" %%i in ('dir /a-d /tw %1 2^>NUL^|findstr /r "^[0-9]"') do echo %%i|findstr /r "^[0-9-/]*$" >NUL&&set writedate=%%i
if defined writedate goto end
goto :loop
:end
echo %writedate%