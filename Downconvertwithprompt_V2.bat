@echo off
set mediainfo="%~dp0MediaInfo.exe"
set result="%~dp0width.txt"
set handbrake="%~dp0HandBrakeCLI.exe"
SETLOCAL ENABLEDELAYEDEXPANSION
Set /P a=Enter source path:
set a1=%a: =_%
set src=%a1:"=%
if not %src:~-1%==\ set src=%src%\
Set /P b=Enter destination for converted files:
set b1=%b: =_%
set dest=%b1:"=%
if not %dest:~-1%==\ set dest=%dest%\
for /R %a% %%j in (*.*) do (
	Echo Filepath is: %%j
	%mediainfo% --Inform=Video;%%Width%% "%%j" > %result%
	set /P width=<%result%
	del %result%
	echo Width is: !width!
	if !width! GTR 1280 (
	set fpath=%%~dpj
	set fpath=!fpath: =_!
	set trg=!fpath:%src%=%dest%!
	if not !trg:~-1!==\ (set trg="!trg:_= !\") else (set trg="!trg:_= !")
	set fnl="!trg:"=!%%~nj.mkv"
	if not exist !trg! mkdir !trg!
	%handbrake% -i "%%j" -o !fnl! -f mkv -e x264 -q 20 --vfr -a 1,1 -E av_aac,ac3 -B 192 -w 1280 --keep-display-aspect -x level=4.1:vbv-bufsize=7000:vbv-maxrate=4500) else (echo No need to transcode.)
)
cmd /k 