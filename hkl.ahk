; This file contains all function I use with HotkeylessAHK.
Class CustomFunctions {

    KillOrOpenDiscord() {
        if WinExist("ahk_exe Discord.exe") {
            ProcessClose("Discord.exe")
            CoordMode("Mouse", "Screen")
            BlockInput("MouseMove")
            MouseGetPos(&mouseX, &mouseY)
            MouseMove(2630, 1415, 0)
            MouseMove(3350, 1415, 30)
            MouseMove(mouseX, mouseY, 0)
            BlockInput("MouseMoveOff")
        } else {
            Run("C:\Users\Sebastian\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk")
        }
    }

    OpenAndMoveCuttingFolder() {
        Run("explorer.exe E:\cutting")
        Sleep(1000)
        hWnd := WinExist("E:\cutting")
        WinMove(3433, 247, 974, 1087, "ahk_id " hwnd)
    }

    OpenAndMoveCamFolder() {
        Run("explorer.exe K:\cam")
        Sleep(1000)
        hWnd := WinExist("K:\cam")
        WinMove(4393, 247, 974, 1087, "ahk_id " hwnd)
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
            Run("C:\Users\Sebastian\AppData\Roaming\Spotify\Spotify.exe")
            Sleep(1000)
        }
        if !WinExist("ahk_exe Scarlett MixControl.exe") {
            Run("C:\Program Files\Focusriteusb\smc\Scarlett MixControl.exe")
            Sleep(1000)
        }
        ; Move windows to their final position
        ;hWnd := WinExist("Timeular")
        ;WinMove,ahk_id %hwnd%,,-1200,850,1200,740

        hWnd := WinExist("ahk_exe Scarlett MixControl.exe")
        WinMove(-1917, 609, 1025, 622, "ahk_id " hwnd) ; 231
        
        hWnd := WinExist("ahk_exe Spotify.exe")
        WinMove(-894, 610, 894, 972, "ahk_id " hwnd)

        hWnd := WinExist("ahk_exe Discord.exe")
        WinMove(-1080, -336, 1080, 946, "ahk_id " hwnd)

        ; Separate function to set window order
        this.LeftScreenActivate()

        ; Additional step for broken spotify
        Sleep(1000)
        WinClose("ahk_exe Spotify.exe")
        Sleep(1000)
        Run("C:\Users\Sebastian\AppData\Roaming\Spotify\Spotify.exe")
    }

    LeftScreenActivate() {
        ;WinActivate, Timeular
        WinActivate("ahk_exe Scarlett MixControl.exe")
        WinActivate("ahk_exe Spotify.exe")
        WinActivate("ahk_exe Discord.exe")
    }

    ScarlettMuteUnmute() {
        if !WinExist("ahk_exe Scarlett MixControl.exe") {
            Run("C:\Program Files\Focusriteusb\smc\Scarlett MixControl.exe")
            ; End here, since the window is sometimes a little bit buggy
        } else {
            WinActivate("ahk_exe Scarlett MixControl.exe")
            CoordMode("Mouse", "Screen")
            WinGetPos(&scarlettX, &scarlettY, , , "ahk_exe Scarlett MixControl.exe")
            BlockInput("MouseMove")
            MouseGetPos(&mouseX, &mouseY)
            ; Mute / Unmute speaker
            MouseClick("left", scarlettX + 897, scarlettY + 398)
            MouseClick("left", scarlettX + 897, scarlettY + 421)
            ; Mute / Unmute headphone
            MouseClick("left", scarlettX + 956, scarlettY + 398)
            MouseClick("left", scarlettX + 956, scarlettY + 421)
            MouseMove(mouseX, mouseY, 0)
            BlockInput("MouseMoveOff")

            ; Restore left screen layout (where the window is usually)
            this.LeftScreenActivate()
        }
    }

    ScarlettVolume(volume) {
        if !WinExist("ahk_exe Scarlett MixControl.exe") {
            Run("C:\Program Files\Focusriteusb\smc\Scarlett MixControl.exe")
            ; End here, since the window is sometimes a little bit buggy
        } else {
            if(volume > 0) {
                this.ScarlettVolume(0)
            }
            WinActivate("ahk_exe Scarlett MixControl.exe")
            CoordMode("Mouse", "Screen")
            WinGetPos(&scarlettX, &scarlettY, , , "ahk_exe Scarlett MixControl.exe")
            BlockInput("MouseMove")
            MouseGetPos(&mouseX, &mouseY)
            if(volume = 0) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 150)
            } else if(volume = 10) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 558)
            } else if(volume = 20) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 587)
            } else if(volume = 30) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 609)
            }

            MouseMove(mouseX, mouseY, 0)
            BlockInput("MouseMoveOff")

            ; Restore left screen layout (where the window is usually)
            this.LeftScreenActivate()
        }
    }

    ScarlettVolume0() {
        this.ScarlettVolume(0)
    }

    ScarlettVolume10() {
        this.ScarlettVolume(10)
    }

    ScarlettVolume20() {
        this.ScarlettVolume(20)
    }

    ScarlettVolume30() {
        this.ScarlettVolume(30)
    }

    OpenTwitchAndChat() {
        Run("chrome.exe https://www.twitch.tv/skate702/dashboard/live")
        Sleep(10000)
        CoordMode("Mouse", "Screen")
        WinGetPos(&chromeX, &chromeY, , , "ahk_exe chrome.exe")

        BlockInput("MouseMove")
        MouseGetPos(&mouseX, &mouseY)
        MouseClick("left", chromeX + 1047, chromeY + 645)
        MouseMove(mouseX, mouseY, 0)
        BlockInput("MouseMoveOff")
    }

    AddAndSelectMarker(markerColor) {
        customURL := "http://localhost:8081/addCustomMarker?color=" . markerColor
        RunWait("curl " customURL, , "hide")
        Send("{Right 3}")
        Sleep(300)
        Send("^+a")
        Sleep(300)
        RunWait("curl `"`"http://localhost:8081/selectCurrentMarker`"`" ,,hide")
        Sleep(300)
        Send("ö")
    }

    AddAndSelectMarkerRed() {
        this.AddAndSelectMarker(6)
    }

    AddAndSelectMarkerBlue() {
        this.AddAndSelectMarker(9)
    }

    AddAndSelectMarkerGreen() {
        this.AddAndSelectMarker(13)
    }

    TargetPremiereTracks(videoTrack, audioTrack) {
        customURL := "http://localhost:8081/targetTracks?videoTrack=" . videoTrack . "&audioTrack=" . audioTrack
        RunWait("curl " customURL, , "hide")
        Sleep(50)
    }

    LoadPremiereClipboard(clipName) {

        WinActivate("Adobe Premiere Pro")

        ; Load some text to... well premiere things.
        RunWait(A_ComSpec " /c E:\code\PremiereClipboard\PremiereClipboard\PremiereClipboard\bin\Debug\PremiereClipboard.exe --fill")

        ; After loading some text, tab out of premiere and tab back in. This trigger some weird reset action, nobody will ever understand
        Sleep(500)
        Send("!{Tab}")
        Sleep(500)
        Send("!{Tab}")
        Sleep(500)

        ; Load clipboard (don't forget to change paths)
        RunWait(A_ComSpec " /c E:\code\PremiereClipboard\PremiereClipboard\PremiereClipboard\bin\Debug\PremiereClipboard.exe --load E:\cut\clipboards\" clipName)

        Sleep(10)
        Send("^+a") ; deselect everything
        Sleep(10)

        ; Ctrl + V, but the "save" taran way
        SendInput("{Shift Down}{Shift Up}{Ctrl Down}{v Down}")
        Sleep(5)
        SendInput("{v Up}{Ctrl Up}")
        Sleep(10)
        
        Sleep(10)
        Send("^+a") ; deselect everything
    }

    TargetDefaultTracks() {
        RunWait("curl `"`"http://localhost:8081/targetDefaultTracks`"`" ,,hide")
    }

    PremierePasteAd() {
        this.TargetPremiereTracks(6, 1000)
        this.LoadPremiereClipboard("ad.clp") 
        this.TargetDefaultTracks()
    }

    PremierePasteChapter() {
        this.TargetPremiereTracks(3, 1000)
        this.LoadPremiereClipboard("chapter.clp") 
        this.TargetDefaultTracks()
    }

    PremierePasteGlitch() {
        this.TargetPremiereTracks(5, 2)
        this.LoadPremiereClipboard("glitch.clp") 
        this.TargetDefaultTracks()
    }

    PremierePasteInfo() {
        this.TargetPremiereTracks(3, 1000)
        this.LoadPremiereClipboard("info.clp") 
        this.TargetDefaultTracks()
    }

    PremierePasteIntro() {
        this.TargetPremiereTracks(3, 2)
        this.LoadPremiereClipboard("intro.clp")
        this.TargetDefaultTracks()
        Sleep(200)
        Run("https://fontawesome.com/icons?d=gallery&m=free")
    }

    PremierePasteOutro() {
        this.TargetPremiereTracks(1, 1000)
        this.LoadPremiereClipboard("outro.clp") 
        this.TargetDefaultTracks()
    }

    PremierePasteRewind() {
        this.TargetPremiereTracks(4, 2)
        this.LoadPremiereClipboard("rewind.clp") 
        this.TargetDefaultTracks()
    }

    PremierePasteSignature() {
        this.TargetPremiereTracks(3, 2)
        this.LoadPremiereClipboard("signature.clp") 
        this.TargetDefaultTracks()
    }

    PremiereReloadCEP2AHK() {
        Send("{Alt}")
        Sleep(100)
        Send("f")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Right}")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Enter}")
        Sleep(300)
        Send("^w")
        Sleep(200)
        Send("{Alt}")
        Sleep(100)
        Send("f")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Right}")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Down}")
        Sleep(100)
        Send("{Enter}")
    }

    PremiereSaveCopyAs() {
        if WinActive("ahk_exe Adobe Premiere Pro.exe") {
            Send("^!s")
            ErrorLevel := !WinWaitActive("Projekt speichern", , 10)
            if ErrorLevel {
                MsgBox("Waiting timeout...")
            } else {
                Sleep(1000)
                Send("{Right}")
                Sleep(50)
                Send("{BS}{BS}{BS}{BS}{BS}{BS}{BS}")
                Sleep(50)
                TimeString := FormatTime(, "yy-MM-dd-HH-mm-ss")
                Send("{Space}")
                Send(TimeString)
                Sleep(300)
                Send("{Enter}")
            }
        }
        return
    }

    RunCompress() {
        Title := WinGetTitle("ahk_class CabinetWClass")
        TrimmedTitle := SubStr(Title, 1, -1*(17)) ; Remove "- Windows Explorer"
        ;msgbox,% TrimmedTitle
        Run("D:\Dokumente\WindowsMods\crf24_hevc.bat /E:ON `"" TrimmedTitle "`" /E:ON", "`"" TrimmedTitle "`"")
        return
    }

    RunVSCodeInCurrentFolder() {
        if WinActive("ahk_class CabinetWClass") {
            Title := WinGetTitle("ahk_class CabinetWClass")
            ; msgbox, %Title%
            TrimmedTitle := SubStr(Title, 1, -1*(17)) ; Remove "- Windows Explorer"
            Run("C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe " TrimmedTitle)
        }
        return
    }

    ; Adapted from fucntions_work.ahk
    ; No more centered as of new acrobat version
    ; I really dont understand where these numbers (310,100) come from
    sendAcrobatCenteredClick(deltaX,deltaY,secondDeltaX,secondDeltaY) {
        if WinExist("ahk_exe Acrobat.exe") {
            WinGetPos(&X, &Y, &Width, &Height)
            CoordMode("Mouse", "Screen")
            BlockInput("MouseMove")
            MouseGetPos(&curmouseX, &curmouseY)
            MouseClick("left", X + deltaX - 310, Y + deltaY - 100, , 0)
            if (secondDeltaX != -1) {
                Sleep(250)
                MouseClick("left", X + secondDeltaX - 310, Y + secondDeltaY - 100, , 0)
            }
            MouseMove(curmouseX, curmouseY, 0)
            BlockInput("MouseMoveOff")
        }
    }

    ; Tax functions
    NetworkStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,480)
        }
    }

    Exp1Stamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,540)
        }
    }

    Exp2Stamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,600)
        }
    }

    Exp3Stamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,660)
        }
    }

    OtherStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,720)
        }
    }

    DonationStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,780)
        }
    }

    PrivateStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,840)
        }
    }

    ChangeStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,380,400,900)
        }
    }

    UseText() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatCenteredClick(330,410,-1,-1)
        }
    }

    Test() {
        MsgBox("`"Test`"")
    }

    HelloWorld() {
        MsgBox("Bye World")
    }

    SetupExalidrawLightMode() {
        hWnd := WinExist("Excalidraw")
        WinMove(1353, 39, 1389, 1054, "ahk_id " hwnd)
        Sleep(20)
        WinActivate("ahk_id " hwnd)
        CoordMode("Mouse", "Screen")
        WinGetPos(&excalidrawX, &excalidrawY, , , "ahk_id " hwnd)
        BlockInput("MouseMove")
        MouseGetPos(&mouseX, &mouseY)
        MouseClick("left", excalidrawX + 45, excalidrawY + 65)
        Sleep(10)
        MouseClick("left", excalidrawX + 184, excalidrawY + 474)
        Sleep(10)
        MouseClick("left", excalidrawX + 266, excalidrawY + 572)
        Sleep(10)
        MouseClick("left", excalidrawX + 45, excalidrawY + 65)
        MouseMove(mouseX, mouseY, 0)
        BlockInput("MouseMoveOff")
    }
    
    SetupExalidrawDarkMode() {
        hWnd := WinExist("Excalidraw")
        WinMove(1360, 186, 1368, 1015, "ahk_id " hwnd)
        Sleep(20)
        WinActivate("ahk_id " hwnd)
        CoordMode("Mouse", "Screen")
        WinGetPos(&excalidrawX, &excalidrawY, , , "ahk_id " hwnd)
        BlockInput("MouseMove")
        MouseGetPos(&mouseX, &mouseY)
        MouseClick("left", excalidrawX + 45, excalidrawY + 65)
        Sleep(10)
        MouseClick("left", excalidrawX + 184, excalidrawY + 474)
        Sleep(10)
        MouseClick("left", excalidrawX + 192, excalidrawY + 572)
        Sleep(10)
        MouseClick("left", excalidrawX + 45, excalidrawY + 65)
        MouseMove(mouseX, mouseY, 0)
        BlockInput("MouseMoveOff")
    }
}