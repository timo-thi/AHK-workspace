# Flameshot

## Script info

**Name**: Flameshot shortcut\
**Location**: `scripts/flameshot_shortcut.ahk`\
**Description**:
```txt
This script will add the `Win + PrintScreen` shortcut to trigger flameshot screenshot process.
```
**Pre-compiled version**: Available, this script will ask for configuration on first launch.

## Issues

This issue comes from how Flameshot itself is working actually. Flameshot normally opens and sets a little tray icon available. Clicking will open gui. The thing is that launching the gui by command line will no connect with the background service and some functionnalities like copy paste, or pin won't work properly. Saving will work though.
**Future fix**: depends on how flameshot will enhance their software.

## Additional information

### What is flameshot ?

Flameshot is a customizable screenshot manager that has a really nice in-app screenshot editing feature, and is really easy to use. It's a tool compatible with windows, linux and mac. More infos here : https://flameshot.org.

### How to setup flameshot shortcut

When launching the programm for the first time, you will have a popup to select the flameshot executable file.

You can also edit the config file located in `%AppData%\AHKWorkspace\flameshot_config.ini`.

## Config file

Here's the structure of the flameshot config file:

```ini
; Config file for Flameshot Shortcut
[General]
flameshotPath = "C:\Path\To\Flameshot.exe"
hotkey = "#PrintScreen"
```

**General section:**
- flameshotPath: the path used to launch flameshot
- hotkey: [Optional] The keyboard shortcut or event that triggers the script.
