---
sidebar_position: 1
---

# Show Scan Results

There are a lot of different options to see scan results. If you are currently connected to or using the host machine where Vuls is installed then you can use a CLI tool that comes with Vuls to view the results. Note, anytime you run a scan a file will be generated and placed in the results folder of vulsctl.

## Vuls TUI

From the command line, within the vulsctl folder, you can execute the following command:

```bash
vuls tui
```

This will bring divide your terminla window into three sections. Navigate between panes using the tab key, and within a pane use the up and down arrows to move up and down.

## Creating a txt Document

If you need a txt file with all your results execute the following command from within the vulsctl folder;

```bash
vuls report -format-full-text > [name_of_your_file].txt
```
