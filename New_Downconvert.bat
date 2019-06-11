@echo off
::Set variables to exe & temp txt for width value. Exe's should be in root of batch folder.
set mediainfo="%~dp0MediaInfo.exe"
set result="%~dp0width.txt"
set handbrake="%~dp0HandBrakeCLI.exe"
::Enable Delayed Expansiopn to allow FOR statement to update parameter with each file.
SETLOCAL EnableDelayedExpansion
::Set In and Out paths
Set /P src=Enter source path:
Set /P dest=Enter destination for converted files:
::Remove space & quotes for find/replace later on
Set _srcfix=%src: =_%
Set _destfix=%dest: =_%
Call :dequote %_srcfix% %_destfix%
if not !_src:~-1!==\ set _src=!_src!\
if not !_dest:~-1!==\ set _dest=!_dest!\
::Begin For loop
for /R %src% %%j in (*.*) do (ENDLOCAL & set "filepath=%%j" & call :sub %_src% %_dest%)
Pause
cmd /k
exit /b

:dequote
::remove quotes from source & destination paths
SETLOCAL
Set _src_=%~1
Set _dest_=%~2
ENDLOCAL & set "_src=%_src_%" & set "_dest=%_dest_%"
exit /b

:sub
::Remove spaces from filepath; more prep for find/replace
Set "_file=%filepath: =_%"
::Find/Replace; Replace the IN path with the OUT path to create full out path
call set "newpath=%%_file:%1=%2%%"
::Add spaces back to full OUT path
Set "hbdest=%newpath:_= %"
::Run mediainfo, write result to temp txt
%mediainfo% --Inform=Video;%%Width%% "%filepath%" > %result%
::set result to a variable we can compare
set /P width=<%result%
del %result%
echo File is: "%filepath%"
echo Width is: %width%
::Compare variable to set value; pass onto handbrake if comparison passes.
if %width% GTR 1280 (call :hb "%hbdest%" "%filepath%")
exit /b

:hb
::create output folder structure
if not exist "%~dp1" mkdir "%~dp1"
::hanbrake cli
%handbrake% -i %2 -o "%~dpn1.mkv" -f mkv -e x264 -q 20 --vfr -a 1,1 -E av_aac,ac3 -B 192 -w 1280 --keep-display-aspect -x level=4.1:vbv-bufsize=7000:vbv-maxrate=4500
exit /b
