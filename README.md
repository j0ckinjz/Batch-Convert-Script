# UPDATE: GUI NOW HERE!!
I added a simple XML-Based GUI to the batch script using FroG (Frontend Generator). In the folder is everything needed to run the GUI, including a copy of frog.exe. Download entire "ConvertFrog" folder to use.

To launch the GUI, start the "ConvertFroG" shortcut.

You'll be able to set Source and Destination folders via browse folder. Currently *5* MediaInfo parameters are available (BitRate, Width, Height, Framerate, Filesize; more to come). 6 comparison operators are available. You can manually set the value to compare. And lastly, most of the handbrake encode settings are available for manual edit. I plan on GUI'ing this secton but there are a lot of options for handbrake. Refer to HandbrakeCLI FAQ to learn to edit this code. I'll attach printouts of handbrake/mediainfo parameters/help.

Latest version of HandbrakeCLI.exe is too big to upload. Download the CLI from their website and replace version in /bin folder.

## Update 2:
Script is as done as it's going to be. The interface (frog) doesn't have enough power to make a proper GUI for the handbrake settings. I feel leaving it as CLI would provide more flexibility. Updated icon & banner and officially named the GUI "ConvertFroG".

## Screenshots of Interface
![Page 1](https://github.com/j0ckinjz/Batch-Convert-Script/raw/master/imgs/CFtab1.PNG)
![Page 2](https://github.com/j0ckinjz/Batch-Convert-Script/raw/master/imgs/CFtab2.PNG)

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
