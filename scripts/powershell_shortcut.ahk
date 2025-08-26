#Requires AutoHotkey v2.0

#Enter::
{
    OPENFOLDER := "C:\Users\AHKNinja\"
    if (OPENFOLDER)
        Run 'powershell.exe -noexit -command cd "' OPENFOLDER '"'
    else
        Run 'powershell.exe -noexit'
}
