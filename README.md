# UPDATE: GUI NOW HERE!!
For GUI version, see: https://github.com/j0ckinjz/ConvertFrog

# Batch-Convert-Script
Batch script that will convert video files based on an If statement. Requires Mediainfo &amp; Handbrake CLI.

Create a working folder.

Place .bat in working folder.

Place HandBrakeCLI.exe and MediaInfo.exe command line interface files in the working folder.

Run .bat.

Drag source folder into cmd prompt, hit enter.

Drag Destination folder into cmd prompt, hit enter.

Script will start scanning files and convert files if "If" statement is true.


How To Edit Script

Line 3,17,19,20 are not required to be changed, but you may change name based on what variable you'll be comparing in "If" statement.

Line 16 should be changed to whatever variable/parameter you would like to compare. See MediaInfo-Parameters.txt for parameters.

Line 20 "If" value should be changed to your desired value for comparison.

Line 27 should be changed based on the handbrake CLI settings you would like to apply to the output files.

Line 25 filename extension should match the set handbrake extention on line 27.
