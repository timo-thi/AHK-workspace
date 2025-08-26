# Hot corners

## Script info

**Name**: Hot Corners\
**Location**: `scripts/hot_corners.ahk`\
**Description**:
```txt
This script implements the "Hot corners" feature available on some linux systems (mac too ?): when you keep your mouse cursor in one of the corners of your screen, the scripts triggers some action depending of configuration and the corner used.
```

## Issues

In the compiled version, windows tends to consider this program as a bearfoos virus (which is understandable since it's a loop running forever in the background.)\
**Fix**: Currently none, but the using the script without compiling works fine.

## Additional information

### Hot to customize hot corners ?

There are several configurations that can be customized:

**Generic actions:**
- The corner size: determines the size of the zone where the mouse cursor is considered as "in a corner".
    - A too big number might be anoying and trigger actions if you're a bit too close.
    - A too small number might lead to difficulty to trigger the corner action.
- The checking period: determines how often the loop runs in the background. The loop is responsible for checking if the mouse cursor is in the corner.
    - A too big number (low frequency) will lead to somehting unresponsive.
    - A too small number (high frequenct) will lead to more CPU usage.

**Per corner:** (each corner is individually customizable)
- The wait time: determines how much time the mouse cursor should stay in a corner to trigger an action.
    - A too short time will lead to unexpected/unwanted triggers
    - A too long time lead to using the wait time as an excuse to go drink another coffee (Please go easy on the coffee).
- The action: is basically what is launched when the cursor is detected in a corner for enough time.
    - The actions have to be coded for now, although you have some good examples.
    - Maybe in future updates, this param will be easier to customize.
- The retrigger mode: indicates how the script should behave if the cursor stays even after triggering the action.
    - off: wait for the cursor to exit the corner, before enabling to retrigger it.
    - wait: the timer is reset and the action may be retriggered if the cursor stays in the corener for the amount of time configured for this corner.
    - immediate: the script retriggers the action immediately while the cursor stays in the corner. Time is reset as soon as the cursor leaves the corner.
    - Note: immediate would retrigger the action at the frequency of the "checking period" param.

Default actions are:
- **Top left corner**: Open task view (Shortcut Windows + Tab)
- **Top right corner**: nothing
- **Bottom left corner**: open task manager
- **Bottom right corner**: open file explorer
