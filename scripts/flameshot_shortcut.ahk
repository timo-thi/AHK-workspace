#Requires AutoHotkey v2.0

#PrintScreen::
{
    ;; Edit you flameshot path here if needed
    FLAMESHOTPATH :=
        "C:\Users\AHKNinja\Flameshot\flameshot-13.1.0-win64\flameshot-13.1.0-win64\bin\flameshot.exe"
    Run "%FLAMESHOTPATH% gui"
}
