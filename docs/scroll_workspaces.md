# Scroll Workspaces

## Script info

**Name**: Scroll workspaces\
**Location**: `scripts/scroll_workspaces.ahk`\
**Description**:
```txt
Allows you to switch between workspaces (aka desktops) by scrolling on the top side of your screen.
```
**Pre-compiled version**: Available.

## Issues

None.

## Additional information

The effect zone represent about 80% of your screen width, centered, and is about 5pixels high. This behavior is meant to avoid conflict with other potential zones.
```txt
┌===================================┐
|❌❌✅✅✅✅✅✅✅✅✅✅❌❌|
│  ^              ^              ^  |
|  |              |              |  |
|  |       Works fine here       |  |  <=== This is your screen :)
|  |                             |  |
|  Not here ----------Here neither  |
|                                   |
|                                   |
└===================================┘
```
