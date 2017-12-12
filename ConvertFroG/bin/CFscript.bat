@echo off
set mediainfo="%~dp0MediaInfo.exe"
set result="%~dp0value.txt"
set handbrake="%~dp0HandBrakeCLI.exe"
SETLOCAL ENABLEDELAYEDEXPANSION
Set a=%1
set a1=%a: =_%
set src=%a1:"=%
if not %src:~-1%==\ set src=%src%\
Set b=%2
set b1=%b: =_%
set dest=%b1:"=%
if not %dest:~-1%==\ set dest=%dest%\
for /R %a% %%j in (*.*) do (
	Echo Filepath is: %%j
	%mediainfo% %3 "%%j" > %result%
	set /P value=<%result%
	del %result%
	echo Value is: !value!
	if !value! %~4 (
	set fpath=%%~dpj
	set fpath=!fpath: =_!
	set trg=!fpath:%src%=%dest%!
	if not !trg:~-1!==\ (set trg="!trg:_= !\") else (set trg="!trg:_= !")
	set fnl="!trg:"=!%%~nj"
	if not exist !trg! mkdir !trg!
	%handbrake% -i "%%j" -o !fnl!.%6 -f %6 %~5) else (echo No need to transcode.)
)
cmd /k 