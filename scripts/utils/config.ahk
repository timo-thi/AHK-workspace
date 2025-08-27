#Requires AutoHotkey v2.0

; Get the configuration directory
GetConfigDir() {
    return A_AppData . "\AHKWorkspace"
}

; Get the full path to the configuration file
; cFile: The configuration file name
GetFullPath(cFile) {
    return GetConfigDir() . "\" . cFile
}

; Get a value from the configuration file
; cFile: The configuration file name
; section: The section in the INI file
; key: The key to retrieve the value for
; default: The default value to return if the key is not found
GetConfigValue(cFile, section, key, default := "") {
    configFile := GetFullPath(cFile)
    return IniRead(configFile, section, key, default)
}

; Set a value in the configuration file
; cFile: The configuration file name
; section: The section in the INI file
; key: The key to set the value for
; value: The value to set
SetConfigValue(cFile, section, key, value) {
    configFile := GetFullPath(cFile)
    IniWrite(value, configFile, section, key)
}

; Check if the configuration file exists
; cFile: The configuration file name
ConfigFileExists(cFile) {
    configFile := GetFullPath(cFile)
    return FileExist(configFile)
}

; Initialize the configuration file if it doesn't exist
; cFile: The configuration file name
; scriptName: The name of the script
InitConfigFile(cFile, scriptName) {
    if !ConfigFileExists(cFile) {
        DirCreate(GetConfigDir()) ; Ensure config directory exists
        FileAppend("; This is the configuration file for " scriptName, GetFullPath(cFile))
    }
}
