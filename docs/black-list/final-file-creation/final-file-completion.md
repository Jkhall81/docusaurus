---
sidebar_position: 6
---

# Completing the Final File

Now in your Final File add the following column headers:

- All Clean
- FDNC
- DNC
- Invalid

Once your headers are added copy over the contents of each respective file to its column, excluding the no carrier file. Now all your columns of the final file should have values except for the DNC column.

## Getting DNC values

Take your Final File and run the Z-NumberCleaner3.pl script on it. This will give you an output2 file, you can delete the log file that this script outputs. Copy the DNC numbers from the output2 file to Final File, and add the No Carrier column to the Final File with values from the no carrier file. Your Final File is now complete.
