#Requires AutoHotkey v2.0

; Include utils
#Include utils\uiux.ahk

;; This file setups the hot corner concept on windows. Keeping the mouse over more than X ms in a corner
;; will trigger an action.

;; General
/**
 * Configuration settings for hot corners
 * @property corner_size The size of the corner zone (in pixels)
 * @property checking_period The time between two mouse position checks (in milliseconds)
 */
global config := {
    corner_size: 5,
    checking_period: 100,
}

;; DO NOT EDIT
/**
 * Configuration settings for hot corners
 * @property mouse_in_corner_since The time (in ms) the mouse has been in the corner
 * @property action_was_triggered Indicates if an action was just triggered
 */
global state := {
    mouse_in_corner_since: -1,
    action_was_triggered: false
}

/**
 * Check if a point is within a specified zone
 * @param p The point to check (array with x and y coordinates)
 * @param z The zone to check against (array with x and y coordinates)
 * @param sz The size of the zone (in pixels)
 */
InZone(p, z, sz) {
    return (p[1] >= z[1] && p[1] <= z[1] + sz && p[2] >= z[2] && p[2] <= z[2] + sz)
}

/**
 * Get the current corner the mouse is in
 * @returns "tl"|"tr"|"bl"|"br" or false if not in a corner
 */
GetCurrentCorner() {
    global config

    ; Get Mouse position
    MouseGetPos &posx, &posy

    corner_coords := Map(
        "tl", [0, 0],
        "tr", [A_ScreenWidth - config.corner_size, 0],
        "bl", [0, A_ScreenHeight - config.corner_size],
        "br", [A_ScreenWidth - config.corner_size, A_ScreenHeight - config.corner_size],
    )

    for k, v in corner_coords
        if (InZone([posx, posy], v, config.corner_size))
            return k

    ; Not in one of the defined zones
    return false
}

/**
 * Action mapping for each corner
 * @type Map
 */
action_mapper := Map(
    ;; ========== Corner top left ==========
    "tl", Map(
        ; time in ms to wait before triggering the action while mouse stays in the defined zone.
        "wait_time", 300,
        ; action triggered when position and time are confirmed
        "action", TriggerTopLeftAction,
        ; indicates the retrigger_mode:
        ; - off => no retriggered, the mouse cursor need to get out and re-enter the corner to retriger
        ; - wait => action is retriggered after waiting the time again
        ; - immediate => action is retriggered without waiting (next iteration of the loop)
        "retrigger_mode", "wait"
    ),
    ;; ========== Corner top right ==========
    "tr", Map(
        "wait_time", 500,
        "action", TriggerTopRightAction,
        "retrigger_mode", "off"
    ),
    ;; ========== Corner bottom left ==========
    "bl", Map(
        "wait_time", 500,
        "action", TriggerBottomLeftAction,
        "retrigger_mode", "off"
    ),
    ;; ========== Corner bottom right ==========
    "br", Map(
        "wait_time", 500,
        "action", TriggerBottomRightAction,
        "retrigger_mode", "off"
    ),
)

TriggerTopLeftAction() {
    ShowToolTip("Aaah it's hot!")
    Send("#{Tab}")
}

TriggerTopRightAction() {
    ShowToolTip("Aaah it's hot!")
}

TriggerBottomLeftAction() {
    ShowToolTip("Aaah it's hot!")
    Run("taskmgr")
}

TriggerBottomRightAction() {
    ShowToolTip("Aaah it's hot!")
    Run("explorer.exe")
}

;; Main loop

/**
 * Check the mouse position and trigger actions if necessary
 */
CheckMouse() {
    ; Get states
    global state

    ; Get mapper
    global action_mapper

    ; Get mouse position
    current_corner := GetCurrentCorner()

    if (!current_corner) {  ; Not in a corner, reset states and finish
        state.mouse_in_corner_since := -1
        state.action_was_triggered := false
        return
    }

    if (state.mouse_in_corner_since = -1) {
        state.mouse_in_corner_since := A_TickCount  ; Store when mouse was detected inside the zone
        return  ; Can't start counting and trigger action in the same iteration
    }

    ; Checking the wait time and triggering action according to the current corner of the mouse cursor
    if (A_TickCount - state.mouse_in_corner_since > action_mapper[current_corner]["wait_time"] && !state.action_was_triggered
    ) {
        action_mapper[current_corner]["action"]()
        ; Act according to retrigger_mode
        switch action_mapper[current_corner]["retrigger_mode"] {
            case "off":
                state.action_was_triggered := true
                return
            case "wait":
                state.action_was_triggered := false
                state.mouse_in_corner_since := -1
                return
            case "immediate":
                state.action_was_triggered := false
                ; Do nothing. Action will retrigger on next loop iteration
                return
            default:
                state.action_was_triggered := true
                MsgBox(
                    "ERROR: the retrigger_mode is not specified or not recognized. Received: " . action_mapper[
                        current_corner]["retrigger_mode"] .
                    "`nDefaulting to 'off' mode." .
                    "`nCheck the corner_action.ahk file for debuging."
                )
        }
        return
    }
}

SetTimer(CheckMouse, config.checking_period)