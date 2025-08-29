#Requires AutoHotkey v2.0

; Get the configuration directory
GetConfigDir() {
    return A_AppData . "\AHKWorkspace"
}

/**
 * Get the full path to the configuration file
 * @param cFile The configuration file name
 */
GetFullPath(cFile) {
    return GetConfigDir() . "\" . cFile
}

/**
 * Get a value from the configuration file
 * @param cFile The configuration file name
 * @param section The section in the INI file
 * @param key The key to retrieve the value for
 * @param default The default value to return if the key is not found
 */
GetConfigValue(cFile, section, key, default := "") {
    configFile := GetFullPath(cFile)
    return IniRead(configFile, section, key, default)
}

/**
 * Set a value in the configuration file
 * @param cFile The configuration file name
 * @param section The section in the INI file
 * @param key The key to set the value for
 * @param value The value to set
 */
SetConfigValue(cFile, section, key, value) {
    configFile := GetFullPath(cFile)
    IniWrite(value, configFile, section, key)
}

/**
 * Check if the configuration file exists
 * @param cFile The configuration file name
 */
ConfigFileExists(cFile) {
    configFile := GetFullPath(cFile)
    return FileExist(configFile)
}

/**
 * Initialize the configuration file if it doesn't exist
 * @param cFile The configuration file name
 * @param scriptName The name of the script
 */
InitConfigFile(cFile, scriptName) {
    if !ConfigFileExists(cFile) {
        DirCreate(GetConfigDir()) ; Ensure config directory exists
        FileAppend("; This is the configuration file for " scriptName, GetFullPath(cFile))
    }
}
