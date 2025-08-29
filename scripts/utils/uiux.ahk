#Requires AutoHotkey v2.0

/**
 * Show a tooltip message for a specified duration
 * @param message The message to display in the tooltip
 * @param timeout The duration to display the tooltip for (in milliseconds)
 */
ShowToolTip(message, timeout := 1000) {
    ToolTip message
    SetTimer(() => ToolTip(), -timeout)
}

/**
 * Show a file dialog to select a file
 * @param title The title of the file dialog
 * @param defaultPath The default path to start the file selection
 * @param defaultFilter The default file filter
 */
AskFileDialog(title, defaultPath := "", defaultFilter := "All Files (*.*)|*.*") {
    selectedFile := FileSelect(3, defaultPath, title, defaultFilter)
    return selectedFile
}
