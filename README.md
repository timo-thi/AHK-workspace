# AHK-workspace

Being used to linux, I love to personnalise my environment to add some shortcuts and functionalities such as workspace scroll, hot corners, and more. Windows, on the other hand, doesn't natively allow such custom features. This repo is a set of scripts using AutoHotKkey (.ahk) to enhance your windows environment, introducing... the AHK Workspace!

## What is AutHotkey

AutoHotkey is a lightweight scripting language for Windows that lets you automate repetitive tasks, create custom keyboard shortcuts, and control applications with ease. It’s especially useful for boosting productivity, building macros, or quickly developing small tools without heavy setup.

More information at: https://www.autohotkey.com.

## Structure of this repo

```txt
AutoHotkey/
├── README.md
├── LICENSE
├── scripts/
│   ├── some_script.ahk
│   └── ...
├── build/
│   ├── some_file.exe
│   └── ...
└── docs/
    └── some_file.md
```

=> The `scripts` folder contains all the ahk scripts.\
=> The `build` folder contains some pre compiled executables usable directly on windows.\
=> The `docs` folder contains the documentation.

## How to use the scripts

I'm hoping to find time to create a little wizzard to help people setup the scripts. It would also let you personnalize the behavior without editing the scripts :')

For now, there are three ways to use the scripts:
1. The script happens to be available to use in the `build` folder (lucky you). You can just launc the script and it will work.
    - Good side: You don't have to do anything :) and no need to install the AutoHotkey software.
    - Down side: You can't customize it's behavior (yet). Oh but don't worry, the script of the build versions are still available in the scripts folder. You will need to use one of the two other ways.

> /!\ In the two next cases, you will have to install AutoHotkey on your machine. Find proper instructions on the official website. (See [What is AutoHotkey](#what-is-authotkey))

2. You can launch the scripts directly with AutoHotkey. Double click or select and press {Enter} and windows should find the correct programm to launch it.
    - Good side: You can edit the scripts localy, and reload them easily.
    - Down side: A little less efficient than the compiled versions. If you have only a few, it's okay to use this method. Otherwise, I would recommend to compile them (gaining several times a little power, is saving a big power in the end :)).
3. You can use an AutoHotkey compiler, probably included in the AutoHotkey software, to compile the script in an .exe file.
    - Good side: A bit more efficient than through the script.
    - Down side: Need to recompile each time you make a change in the script.

**Little tip**: You can ask windows to run automatically the scripts on startup by creating new windows services, or putting the files in the `C:\Users\AHKNinja\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup` folder (of course replace AHKNinja by your real user name).

## All the scripts :

| Script              | Doc path                                               | Script Path                                                        |
| ------------------- | ------------------------------------------------------ | ------------------------------------------------------------------ |
| Flameshot shortcut  | [docs/flameshot.md](docs/flameshot.md)                 | [scripts/flameshot_shortcut.ahk](scripts/flameshot_shortcut.ahk)   |
| Hot corners         | [docs/hot_corners.md](docs/hot_corners.md)             | [scripts/hot_corners.ahk](scripts/hot_corners.ahk)                 |
| Powershell shortcut | [docs/powershell.md](docs/powershell.md)               | [scripts/powershell_shortcut.ahk](scripts/powershell_shortcut.ahk) |
| Scroll workspaces   | [docs/scroll_workspaces.md](docs/scroll_workspaces.md) | [scripts/scroll_workspaces.ahk](scripts/scroll_workspaces.ahk)     |
