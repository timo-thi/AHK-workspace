; Script AutoHotkey v2
#Requires AutoHotkey v2.0

#SingleInstance Force

CoordMode("Mouse", "Screen")

IsCursorPositionValid() {
    MouseGetPos &xpos, &ypos

    leftMargin := Round(A_ScreenWidth * 0.1)
    rightMargin := Round(A_ScreenWidth * 0.9)

    if ((ypos < 5) && (xpos > leftMargin) && (xpos < rightMargin))
        return true
    return false
}

WheelUp::
{
    if (IsCursorPositionValid()) {
        Send("^#{Left}")   ; Bureau précédent
    } else {
        Send("{WheelUp}") ; Comportement normal
    }
}

WheelDown::
{
    if (IsCursorPositionValid()) {
        Send("^#{Right}")   ; Bureau suivant
    } else {
        ; MsgBox(leftMargin . " " . rightMargin . " " . xpos)
        Send("{WheelDown}") ; Comportement normal
    }
}
