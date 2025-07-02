; This file contains all functions I use with HotkeylessAHK.
; It relies on the shared library file "lib.ahk" to work properly.
#Include "lib.ahk"

; This class is just here for demonstration purposes
class CustomFunctions {
    HelloWorld() {
        MsgBox("Hello World!")
    }
}

; This class contains all functions for normal desktop use
class DesktopFunctions {

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

    RunCompress() {
        title := getTrimmedExplorerWindowTitle()
        Run("D:\Dokumente\WindowsMods\crf24_hevc.bat /E:ON `"" title "`" /E:ON", "`"" title "`"")
    }

    RunVSCodeInCurrentFolder() {
        openVSCodeInCurrentExplorerDirectory()
    }

    SwitchVSCodeWindowSize() {
        switchVSCodeWindowSize()
    }

    SwitchForegroundChatWindow() {
        switchForegroundChatWindow()
    }

    OpenNotionDashboard() {
        Run("notion://Dashboard-1731742e7e8380f4a2abd2ff29b5d9b8")
    }

    FancyZonesStandardLayout() {
        fancyZonesLayout("Standard")
    }

    FancyZonesStreamingLayout() {
        fancyZonesLayout("Streaming")
    }
    
}

; This class contains all functions for the Focusrite Scarlett MixControl
class ScarlettFunctions {

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
        }
    }

    ScarlettVolume(volume) {
        if !WinExist("ahk_exe Scarlett MixControl.exe") {
            Run("C:\Program Files\Focusriteusb\smc\Scarlett MixControl.exe")
            ; End here, since the window is sometimes a little bit buggy
        } else {
            if (volume > 0) {
                this.ScarlettVolume(0)
            }
            WinActivate("ahk_exe Scarlett MixControl.exe")
            CoordMode("Mouse", "Screen")
            WinGetPos(&scarlettX, &scarlettY, , , "ahk_exe Scarlett MixControl.exe")
            BlockInput("MouseMove")
            MouseGetPos(&mouseX, &mouseY)
            if (volume = 0) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 150)
            } else if (volume = 10) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 558)
            } else if (volume = 20) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 587)
            } else if (volume = 30) {
                MouseClickDrag("left", scarlettX + 926, scarlettY + 512, scarlettX + 926, scarlettY + 609)
            }

            MouseMove(mouseX, mouseY, 0)
            BlockInput("MouseMoveOff")
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
}

; This class contains all functions for Adobe Premiere Pro, to be use together with PremiereRemote and PremiereClipboard
; see: https://github.com/sebinside/PremiereRemote and https://github.com/sebinside/PremiereClipboard
class PremiereFunctions {

    PremiereReloadCEP2AHK() {
        if WinActive("ahk_exe Adobe Premiere Pro.exe") {
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

    TargetDefaultTracks() {
        RunWait("curl `"`"http://localhost:8081/targetDefaultTracks`"`" ,,hide")
    }

    PremiereTracksSetLocked(locked) {
        customURL := "http://localhost:8081/setLockedForAllTracks?locked=" . locked
        RunWait("curl " customURL, , "hide")
        Sleep(50)
    }

    PremiereUnlockTracks(videoTrack, audioTrack) {
        customURL := "http://localhost:8081/unlockTracks?videoTrack=" . videoTrack . "&audioTrack=" . audioTrack
        RunWait("curl " customURL, , "hide")
        Sleep(50)
    }

    LoadPremiereClipboard(clipName) {

        WinActivate("Adobe Premiere Pro")

        ; Load some text to... well premiere things.
        RunWait(A_ComSpec " /c E:\code\PremiereClipboard\PremiereClipboard\PremiereClipboard\bin\Debug\PremiereClipboard.exe --fill"
        )

        ; After loading some text, tab out of premiere and tab back in. This trigger some weird reset action, nobody will ever understand
        Sleep(500)
        Send("!{Tab}")
        Sleep(500)
        Send("!{Tab}")
        Sleep(500)

        ; Load clipboard (don't forget to change paths)
        RunWait(A_ComSpec " /c E:\code\PremiereClipboard\PremiereClipboard\PremiereClipboard\bin\Debug\PremiereClipboard.exe --load E:\cut\clipboards\" clipName
        )

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

    PremiereClipExample1() {
        this.TargetPremiereTracks(6, 1000)
        this.LoadPremiereClipboard("ad.clp")
        this.TargetDefaultTracks()
    }

    PremiereClipExample2() {
        this.TargetPremiereTracks(4, 2)
        this.LoadPremiereClipboard("rewind.clp")
        this.TargetDefaultTracks()
    }

    PremiereClipboardTest() {
        this.PremiereTracksSetLocked("true")
        this.PremiereUnlockTracks(3, 3)
        this.LoadPremiereClipboard("test2.clp")
        this.PremiereTracksSetLocked("false")
    }
}

; This class contains all functions for Adobe Acrobat
class AcrobatFunctions {

    sendAcrobatClick(deltaX, deltaY, secondDeltaX, secondDeltaY) {
        if WinExist("ahk_exe Acrobat.exe") {
            WinGetPos(&X, &Y, &Width, &Height)
            CoordMode("Mouse", "Screen")
            BlockInput("MouseMove")
            MouseGetPos(&mouseX, &mouseY)
            MouseClick("left", X + deltaX - 310, Y + deltaY - 100, , 0)
            if (secondDeltaX != -1) {
                Sleep(250)
                MouseClick("left", X + secondDeltaX - 310, Y + secondDeltaY - 100, , 0)
            }
            MouseMove(mouseX, mouseY, 0)
            BlockInput("MouseMoveOff")
        }
    }

    ; Tax functions
    NetworkStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 480)
        }
    }

    Exp1Stamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 540)
        }
    }

    Exp2Stamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 600)
        }
    }

    Exp3Stamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 660)
        }
    }

    OtherStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 720)
        }
    }

    DonationStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 780)
        }
    }

    PrivateStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 840)
        }
    }

    ChangeStamp() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 380, 400, 900)
        }
    }

    UseText() {
        if WinActive("ahk_exe Acrobat.exe") {
            this.sendAcrobatClick(330, 410, -1, -1)
        }
    }
}
