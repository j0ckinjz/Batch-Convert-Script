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
for /R %src% %%j in (*.*) do (ENDLOCAL & set "filepath=%%j" & call "%~dp0sub.bat" %_src% %_dest%)
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