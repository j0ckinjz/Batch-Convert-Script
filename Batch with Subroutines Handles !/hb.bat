::create output folder structure
if not exist "%~dp1" mkdir "%~dp1"
::hanbrake cli
%handbrake% -i %2 -o "%~dpn1.mkv" -f mkv -e x264 -q 20 --vfr -a 1,1 -E av_aac,ac3 -B 192 -w 1280 --keep-display-aspect -x level=4.1:vbv-bufsize=7000:vbv-maxrate=4500
exit /b