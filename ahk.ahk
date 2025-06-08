; This file contains all overwrites and hotkeys I use on a daily basis.
#Requires AutoHotkey v2.0

SendMode("Input")
SetWorkingDir(A_ScriptDir)
TraySetIcon("shell32.dll", "16")
#SingleInstance force
#Include "vars.ahk"
#Include "lib.ahk"

SetCapsLockState("AlwaysOff") ; Disable Capslock
SetTitleMatchMode(2) ; Title matches anything that contains the specified string

; Overwrite windows+E
#E:: Run(varDefaultExplorerCall())

; Overwrites the apostrophe key to be actually useful without dumb extra key presses
SC00D:: Send("{Raw}" "`` ")

; CAPSLOCK Overwrites
#HotIf GetKeyState("Capslock", "P")
{
    L:: {
        Run(varHotkeylessAHKPath() . "reload.ahk")    
        Reload
    }

    E:: Send("[")
    R:: Send("]")
    D:: Send("{{}")
    F:: Send("{}}")
    T:: Send("\")
    SC00D:: Send("{Raw}" "´")
    Q::
    {
        Send("``")
        Send("``")
        Send("{Left}")
    }

    B:: Send("^!b")
    G:: Send("^!j")

    X:: callExplorer()
    W:: callChrome()
    C:: openTerminalInCurrentExplorerDirectory()
    V::
    {
        if (!WinExist("ahk_exe Code.exe")) {
            openVSCodeInCurrentExplorerDirectory()
        } else {
            callVSCode()
        }
    }
    S:: switchActiveStreamDeckConfig()

    1:: Send("[1]")
    2:: Send("[2]")
    3:: Send("[3]")
    4:: Send("[4]")
    5:: Send("[5]")
    6:: Send("[6]")
    7:: Send("[7]")
    8:: Send("[8]")
    9:: Send("[9]")
}
#HotIf

; Hijack the very special snowflake called Copilot Key :)
*<+<#f23:: {
    Send("{Blind}{LShift Up}{LWin Up}{F23 Up}")
    Sleep 10
    Send "^+!{Ö}"
}

; Mouse button shortcuts
^!F12::
{
    if (isPremiereActive()) {
        Send("N")
    } else if (isMinecraftActive()) {
        Send(9)
    } else {
        callExplorer()
    }
}

^!F11::
{
    if (isPremiereActive()) {
        Send("B")
    } else if (isMinecraftActive()) {
        Send(8)
    } else {
        callChrome()
    }
}

^!F10::
{
    if (isPremiereActive()) {
        premiereClickOnElementPositionProperty()
    } else if (isMinecraftActive()) {
        Send(7)
    } else {
        callVSCode()
    }
}
