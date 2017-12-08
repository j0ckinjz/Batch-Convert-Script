@echo on
set mediainfo="%~dp0MediaInfo.exe"
set result="%~dp0width.txt"
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
	set /P width=<%result%
	del %result%
	echo Width is: !width!
	if !width! %4 %5 (
	set fpath=%%~dpj
	set fpath=!fpath: =_!
	set trg=!fpath:%src%=%dest%!
	if not !trg:~-1!==\ (set trg="!trg:_= !\") else (set trg="!trg:_= !")
	set fnl="!trg:"=!%%~nj"
	if not exist !trg! mkdir !trg!
	%handbrake% -i "%%j" -o !fnl!.%7 -f %7 %~6) else (echo No need to transcode.)
)
cmd /k 