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
    ;if !WinExist("ahk_exe Discord.exe") {
    ;    Run, C:\Users\Sebastian\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk
    ;    Sleep, 1000
    ;}
    ;if !WinExist("ahk_exe Timeular.exe") {
    ;    Run, C:\Users\Sebastian\AppData\Local\Programs\Timeular\Timeular.exe
    ;    Sleep, 1000
    ;}
    if !WinExist("ahk_exe Spotify.exe") {
        Run, C:\Users\Sebastian\AppData\Roaming\Spotify\Spotify.exe
        Sleep, 1000
    }
    if !WinExist("ahk_exe Scarlett MixControl.exe") {
        Run, C:\Program Files (x86)\Focusrite\Scarlett MixControl\Scarlett MixControl.exe
        Sleep, 1000
    }
    ; Move windows to their final position
    ;hWnd := WinExist("Timeular")
    ;WinMove,ahk_id %hwnd%,,-1200,850,1200,740

    hWnd := WinExist("ahk_exe Scarlett MixControl.exe")
    WinMove,ahk_id %hwnd%,,-1917,609,1025,622 ; 231
    
    hWnd := WinExist("ahk_exe Spotify.exe")
    WinMove,ahk_id %hwnd%,,-894,610,894,972

    hWnd := WinExist("ahk_exe Discord.exe")
    WinMove,ahk_id %hwnd%,,-1080,-336,1080,946

    ; Separate function to set window order
    LeftScreenActivate()

    ; Additional step for broken spotify
    Sleep, 1000
    WinClose, ahk_exe Spotify.exe
    Sleep, 1000
    Run, C:\Users\Sebastian\AppData\Roaming\Spotify\Spotify.exe
}

LeftScreenActivate() {
    WinActivate, Timeular
    WinActivate, ahk_exe Scarlett MixControl.exe
    WinActivate, ahk_exe Spotify.exe
    WinActivate, ahk_exe Discord.exe
}

ScarlettMuteUnmute() {
    if !WinExist("ahk_exe Scarlett MixControl.exe") {
        Run, C:\Program Files (x86)\Focusrite\Scarlett MixControl\Scarlett MixControl.exe
        ; End here, since the window is sometimes a little bit buggy
    } else {
        WinActivate, ahk_exe Scarlett MixControl.exe
        CoordMode, Mouse, Screen
        WinGetPos, scarlettX, scarlettY,,,ahk_exe Scarlett MixControl.exe
        BlockInput, MouseMove
        MouseGetPos, mouseX, mouseY
        ; Mute / Unmute speaker
        MouseClick, left, scarlettX + 897, scarlettY + 398
        MouseClick, left, scarlettX + 897, scarlettY + 421
        ; Mute / Unmute headphone
        MouseClick, left, scarlettX + 956, scarlettY + 398
        MouseClick, left, scarlettX + 956, scarlettY + 421
        MouseMove, mouseX, mouseY, 0
        BlockInput, MouseMoveOff

        ; Restore left screen layout (where the window is usually)
        LeftScreenActivate()
    }
}

ScarlettVolume(volume) {
    if !WinExist("ahk_exe Scarlett MixControl.exe") {
        Run, C:\Program Files (x86)\Focusrite\Scarlett MixControl\Scarlett MixControl.exe
        ; End here, since the window is sometimes a little bit buggy
    } else {
        if(volume > 0) {
            ScarlettVolume(0)
        }
        WinActivate, ahk_exe Scarlett MixControl.exe
        CoordMode, Mouse, Screen
        WinGetPos, scarlettX, scarlettY,,,ahk_exe Scarlett MixControl.exe
        BlockInput, MouseMove
        MouseGetPos, mouseX, mouseY
        if(volume = 0) {
            MouseClickDrag, left, scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 150
        } else if(volume = 10) {
            MouseClickDrag, left, scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 558
        } else if(volume = 20) {
            MouseClickDrag, left, scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 587
        } else if(volume = 30) {
            MouseClickDrag, left, scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 609
        }

        MouseMove, mouseX, mouseY, 0
        BlockInput, MouseMoveOff

        ; Restore left screen layout (where the window is usually)
        LeftScreenActivate()
    }
}

ScarlettVolume0() {
    ScarlettVolume(0)
}

ScarlettVolume10() {
    ScarlettVolume(10)
}

ScarlettVolume20() {
    ScarlettVolume(20)
}

ScarlettVolume30() {
    ScarlettVolume(30)
}

OpenTwitchAndChat() {
    Run, chrome.exe https://www.twitch.tv/skate702/dashboard/live
    Sleep, 10000
    CoordMode, Mouse, Screen
    WinGetPos, chromeX, chromeY,,,ahk_exe chrome.exe

    BlockInput, MouseMove
    MouseGetPos, mouseX, mouseY
    MouseClick, left, chromeX + 1047, chromeY + 645
    MouseMove, mouseX, mouseY, 0
    BlockInput, MouseMoveOff
}

AddAndSelectMarker(markerColor) {
    customURL = http://localhost:8081/addCustomMarker?color=%markerColor%
    RunWait curl %customURL% ,,hide
    Send, {Right 3}
    Sleep, 300
    Send, ^+a
    Sleep, 300
    RunWait curl ""http://localhost:8081/selectCurrentMarker"" ,,hide
    Sleep, 300
    Send, ö
}

AddAndSelectMarkerRed() {
    AddAndSelectMarker(6)
}

AddAndSelectMarkerBlue() {
    AddAndSelectMarker(9)
}

AddAndSelectMarkerGreen() {
    AddAndSelectMarker(13)
}

RecallClipboard(int) {
    
    Send, ^+a ; deselect everything
    LoadFromFile("clipTEXT.clp") ;to create this file, just highlight some plain text, copy it, and use insideclipboard.exe to save it as clipTEXT.clp. The clipboard MUST have some text inside; it CANNOT be completely empty. This has the effect of DELETING all the aspects of the clipboard, EXCEPT for text.
	sleep 250
    clipboard = 
	;The clipboard is now completely empty.
	sleep 10
	
	;tooltip, now pasting NOTHING into premiere....
	WinActivate, Adobe Premiere Pro ;extremely important to ensure you are still active/focused on Premiere
	SendInput, {Shift Down}{Shift Up}
	sleep 10
	SendInput, {Ctrl Down}{v Down} ;this is a MUCH more robust way of using the keyboard shortcuts to PASTE, rather than just using "Send ^v"
	sleep 5
	SendInput, {v Up}{Ctrl Up}
	sleep 20
	
    sleep 100

	;It is necessary to PASTE this COMPLETELY BLANK clipboard into premiere, or Premiere won't "know" that the clipboard has been completely emptied.
	;If you don't do this, Premiere will just use whatever thing you had previously copied inside of Premiere.
	clipboard = 
	;the above line is another method for clearing the clipboard that must also be done to ensure a totally empty clipboard
	sleep 30
	;tooltip, "clip" . %int% . ".clp" ;this code doesn't work
	;tooltip, now preparing to paste %int%
	;msgbox, %int%
	WinActivate, Adobe Premiere Pro 
	LoadFromFile("clip" . int . ".clp") ;now we are loading the previously saved clipboard file!
	sleep 250
	WinActivate, Adobe Premiere Pro
	SendInput, {Shift Down}{Shift Up}{Ctrl Down}{v Down}
	sleep 5
	SendInput, {v Up}{Ctrl Up}
	sleep 10
	
	sleep 10
	Send, ^+a ; deselect everything
	
}

LoadFromFile(name) {
	; You'll need to change these paths too!
	RunWait, %comspec% /c C:\Users\Sebastian\InsideClipboard.exe /loadclp C:\Users\Sebastian\%name%
}

LoadA() {
    RecallClipboard("A")
}

LoadB() {
    RecallClipboard("B")
}