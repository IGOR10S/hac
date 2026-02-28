@echo off
setlocal enabledelayedexpansion

:: Check if a file with IP addresses has been passed
if "%~1"=="" (
    echo Usage: .\%~nx0 .\file_name.txt
    echo The input txt file must contain one IP/Hostname per line
    exit /b
)

:: Check if the file exists
if not exist "%~1" (
    echo The file '%~1' does not exist
    exit /b
)

:: Create or empty the report file
> hac_report.txt echo Ping results:

set count=1

:: Read IP addresses from file and ping them one by one
for /f "usebackq tokens=*" %%I in ("%~1") do (
    echo [!count!] Pinging %%I ...
    ping "%%I" -n 1 -w 2000 > nul
    if errorlevel 1 (
        echo     UNREACHABLE
        echo UNREACHABLE - %%I>> hac_report.txt
    ) else (
        echo     REACHABLE
        echo REACHABLE - %%I>> hac_report.txt
    )
    echo(
    set /a count+=1
)

echo Report saved in hac_report.txt
