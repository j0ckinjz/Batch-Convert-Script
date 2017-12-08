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

Line 16 should be changed to whatever variable/parameter you would like to compare. There is probably a table listing all available parameters for this, but I can't find it right now. Will update.

Line 20 "If" value should be changed to your desired value for comparison.

Line 27 should be changed based on the handrbake CLI settings you would like to apply to the output files.

Line 25 filename extension should match the set handbrake extention on line 27.

# UPDATE: GUI NOW HERE!!

I added a simple XML-Based GUI to the batch script using FroG (Frontend Generator). In the ZIP file is everything needed to run the GUI, including a copy of frog.exe.

To launch the GUI, start the "ConvertFroG" shortcut.

You'll be able to set Source and Destination folders via browse folder. Currently 2 MediaInfo parameters are available (BitRate & Width ; more to come). 3 comparison operators are available (Greater than, Lesser than, Equal ; more to come). You can manually set the value to compare. And lastly, most of the handbrake encode settings are available for manual edit. Refer to HandbrakeCLI FAQ to learn to edit this code.
