#Requires AutoHotkey v2.0

; Include utils
#Include utils/config.ahk
#Include utils/uiux.ahk

;; DO NOT CHANGE
; Config file name
CONFIGFILE := "flameshot_config.ini"

; Init the config file. This will not overwrite existing values
InitConfigFile(CONFIGFILE, "Flameshot Shortcut")

; Get flameshot path
global flameshotPath := GetConfigValue(CONFIGFILE, "General", "flameshotpath", "")

; Check if the flameshot path is valid
if (flameshotPath = "" || FileExist(flameshotPath) = "") {
    MsgBox("Flameshot path is not set or invalid. Please select the Flameshot executable.", "Flameshot configuration")
    filePath := AskFileDialog("Select the Flameshot executable", "", "Executable Files (*.exe)|*.exe")

    if (filePath = "" || FileExist(filePath) = "") {
        MsgBox("Path is invalid or canceled. Program is stopping.")
        ExitApp()
    }

    SetConfigValue(CONFIGFILE, "General", "flameshotpath", filePath)
    flameshotPath := filePath
}

; Run Flameshot
RunFlameshot() {
    global flameshotPath

    Run flameshotPath " gui"
}

; Register hotkey
ssHotkey := GetConfigValue(CONFIGFILE, "General", "hotkey", "#PrintScreen")
Hotkey(ssHotkey, (*) => RunFlameshot())