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
    WinMove,ahk_id %hwnd%,,3433,247,974,1087
}

OpenAndMoveCamFolder() {
    Run, explorer.exe K:\cam
    Sleep, 1000
    hWnd := WinExist("K:\cam")
    WinMove,ahk_id %hwnd%,,4393,247,974,1087
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
        Run, C:\Program Files\Focusriteusb\smc\Scarlett MixControl.exe
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
    ;WinActivate, Timeular
    WinActivate, ahk_exe Scarlett MixControl.exe
    WinActivate, ahk_exe Spotify.exe
    WinActivate, ahk_exe Discord.exe
}

ScarlettMuteUnmute() {
    if !WinExist("ahk_exe Scarlett MixControl.exe") {
        Run, C:\Program Files\Focusriteusb\smc\Scarlett MixControl.exe
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
        Run, C:\Program Files\Focusriteusb\smc\Scarlett MixControl.exe
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

TargetPremiereTracks(videoTrack, audioTrack) {
    customURL = http://localhost:8081/targetTracks?videoTrack=%videoTrack%&audioTrack=%audioTrack%
    RunWait curl %customURL% ,,hide
    sleep 50
}

LoadPremiereClipboard(clipName) {

    WinActivate, Adobe Premiere Pro

    ; Load some text to... well premiere things.
    RunWait, %comspec% /c E:\code\PremiereClipboard\PremiereClipboard\PremiereClipboard\bin\Debug\PremiereClipboard.exe --fill

    ; After loading some text, tab out of premiere and tab back in. This trigger some weird reset action, nobody will ever understand
    sleep 500
    Send, !{Tab}
    sleep 500
    Send, !{Tab}
    sleep 500

    ; Load clipboard (don't forget to change paths)
    RunWait, %comspec% /c E:\code\PremiereClipboard\PremiereClipboard\PremiereClipboard\bin\Debug\PremiereClipboard.exe --load E:\cut\clipboards\%clipName%

    sleep 10
    Send, ^+a ; deselect everything
    sleep 10

    ; Ctrl + V, but the "save" taran way
	SendInput, {Shift Down}{Shift Up}{Ctrl Down}{v Down}
	sleep 5
	SendInput, {v Up}{Ctrl Up}
	sleep 10
	
	sleep 10
	Send, ^+a ; deselect everything
}

TargetDefaultTracks() {
    RunWait curl ""http://localhost:8081/targetDefaultTracks"" ,,hide
}

PremierePasteAd() {
    TargetPremiereTracks(6, 1000)
    LoadPremiereClipboard("ad.clp") 
    TargetDefaultTracks()
}

PremierePasteChapter() {
    TargetPremiereTracks(3, 1000)
    LoadPremiereClipboard("chapter.clp") 
    TargetDefaultTracks()
}

PremierePasteGlitch() {
    TargetPremiereTracks(5, 2)
    LoadPremiereClipboard("glitch.clp") 
    TargetDefaultTracks()
}

PremierePasteInfo() {
    TargetPremiereTracks(3, 1000)
    LoadPremiereClipboard("info.clp") 
    TargetDefaultTracks()
}

PremierePasteIntro() {
    TargetPremiereTracks(3, 2)
    LoadPremiereClipboard("intro.clp")
    TargetDefaultTracks()
    sleep 200
    Run https://fontawesome.com/icons?d=gallery&m=free
}

PremierePasteOutro() {
    TargetPremiereTracks(1, 1000)
    LoadPremiereClipboard("outro.clp") 
    TargetDefaultTracks()
}

PremierePasteRewind() {
    TargetPremiereTracks(4, 2)
    LoadPremiereClipboard("rewind.clp") 
    TargetDefaultTracks()
}

PremierePasteSignature() {
    TargetPremiereTracks(3, 2)
    LoadPremiereClipboard("signature.clp") 
    TargetDefaultTracks()
}

PremiereReloadCEP2AHK() {
    Send, {Alt}
    Sleep, 100
    Send, f
    Sleep, 100
    Send, {Down}
    Sleep, 100
    Send, {Down}
    Sleep, 100
    Send, {Right}
    Sleep, 100
    Send, {Enter}
    Sleep, 100
    Send, ^w
    Sleep, 200
    Send, {Alt}
    Sleep, 100
    Send, f
    Sleep, 100
    Send, {Down}
    Sleep, 100
    Send, {Down}
    Sleep, 100
    Send, {Right}
    Sleep, 100
    Send, {Enter}
}

PremiereSaveCopyAs() {
    if WinActive("ahk_exe Adobe Premiere Pro.exe") {
        Send, ^!s
        WinWaitActive,Projekt speichern, , 10
        if ErrorLevel {
            MsgBox, Waiting timeout...
        } else {
            Sleep, 1000
            Send, {Right}
            Sleep, 50
            Send, {BS}{BS}{BS}{BS}{BS}{BS}{BS}
            Sleep, 50
            FormatTime, TimeString,,  yy-MM-dd-HH-mm-ss
            Send, {Space}
            Send, %TimeString%
            Sleep, 300
            Send, {Enter}
        }
    }
    return
}

RunCompress() {
    WinGetTitle, Title, ahk_class CabinetWClass
    ;	msgbox,% Title
	Run, D:\Dokumente\WindowsMods\crf24_hevc.bat /E:ON "%Title%" /E:ON, "%Title%"
    return
}
