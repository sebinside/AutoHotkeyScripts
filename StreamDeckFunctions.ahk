KillOrOpenDiscord() {
    if WinExist("ahk_exe Discord.exe") {
        Process, Close, Discord.exe
        CoordMode, Mouse, Screen
        BlockInput, MouseMove
        MouseGetPos, mouseX, mouseY
        MouseMove, 2630, 1415, 0
        MouseMove, 3350, 1415, 30
        MouseMove, mouseX, mouseY, 0
        BlockInput, MouseMoveOff
    } else {
        Run, C:\Users\Sebastian\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk
    }
}

OpenAndMoveCuttingFolder() {
    Run, explorer.exe E:\cutting
    Sleep, 1000
    hWnd := WinExist("cutting")
    WinMove,ahk_id %hwnd%,,3433,203,974,1087
}