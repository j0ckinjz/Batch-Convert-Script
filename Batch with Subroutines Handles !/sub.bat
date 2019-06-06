::Remove spaces from filepath; more prep for find/replace
Set _file=%filepath: =_%
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
if %width% GTR 1280 (call "%~dp0hb.bat" "%hbdest%" "%filepath%")
exit /b