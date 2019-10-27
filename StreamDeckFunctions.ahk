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
    hWnd := WinExist("E:\cutting")
    WinMove,ahk_id %hwnd%,,3433,203,974,1087
}

OpenAndMoveCamFolder() {
    Run, explorer.exe E:\cam
    Sleep, 1000
    hWnd := WinExist("E:\cam")
    WinMove,ahk_id %hwnd%,,4393,203,974,1087
}

CreateAndOrderLeftScreen() {
    ; Test window existance first
    if !WinExist("ahk_exe Discord.exe") {
        Run, C:\Users\Sebastian\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk
        Sleep, 1000
    }
    if !WinExist("ahk_exe Timeular.exe") {
        Run, C:\Users\Sebastian\AppData\Local\Programs\Timeular\Timeular.exe
        Sleep, 1000
    }
    if !WinExist("ahk_exe Spotify.exe") {
        Run, C:\Users\Sebastian\AppData\Roaming\Spotify\Spotify.exe
        Sleep, 1000
    }
    if !WinExist("ahk_exe Scarlett MixControl.exe") {
        Run, C:\Program Files (x86)\Focusrite\Scarlett MixControl\Scarlett MixControl.exe
        Sleep, 1000
    }
    ; Move windows to their final position
    hWnd := WinExist("Timeular")
    WinMove,ahk_id %hwnd%,,-1193,850,1200,740
    WinActivate, Timeular

    hWnd := WinExist("ahk_exe Scarlett MixControl.exe")
    WinMove,ahk_id %hwnd%,,-1917,231,1025,622
    WinActivate, ahk_exe Scarlett MixControl.exe
    
    hWnd := WinExist("ahk_exe Spotify.exe")
    WinMove,ahk_id %hwnd%,,-894,610,894,972
    WinActivate, ahk_exe Spotify.exe

    hWnd := WinExist("ahk_exe Discord.exe")
    WinMove,ahk_id %hwnd%,,-1080,-336,1080,946
    WinActivate, ahk_exe Discord.exe

    ; Additional step for broken spotify
    Sleep, 1000
    WinClose, ahk_exe Spotify.exe
    Sleep, 1000
    Run, C:\Users\Sebastian\AppData\Roaming\Spotify\Spotify.exe
}