#Requires AutoHotkey v2.0

; Show a tooltip message for a specified duration
ShowToolTip(message, timeout := 1000) {
    ToolTip message
    SetTimer(() => ToolTip(), -timeout)
}

; Show a file dialog to select a file
; title: The title of the file dialog
; defaultPath: The default path to start the file selection
; defaultFilter: The default file filter
AskFileDialog(title, defaultPath := "", defaultFilter := "All Files (*.*)|*.*") {
    selectedFile := FileSelect(3, defaultPath, title, defaultFilter)
    return selectedFile
}
