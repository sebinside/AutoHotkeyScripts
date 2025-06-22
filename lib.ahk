; This file contains shared library files used both in my main scripts and HotkeylessAHK scripts.
#Requires AutoHotkey v2.0

isExplorerActive() {
    return !!WinActive("ahk_class CabinetWClass")
}

isPremiereActive() {
    return !!WinActive("ahk_exe Adobe Premiere Pro.exe")
}

isMinecraftActive() {
    return !!WinActive("Minecraft* 1.") || !!WinActive("Minecraft 1.") || !!WinActive("FTB")
}

getTrimmedExplorerWindowTitle() {
    if (isExplorerActive()) {
        title := WinGetTitle("ahk_class CabinetWClass")
        if (InStr(title, "weitere Registerkarten")) {
            return SubStr(title, 1, -1 * (40)) ; Remove "und n weitere Registerkarten"
        } else if (InStr(title, "weitere Registerkarte")) {
            return SubStr(title, 1, -1 * (39)) ; Remove "und 1 weitere Registerkarte"
        } else if (InStr(title, "Datei-Explorer")) {
            return SubStr(title, 1, -1 * (17)) ; Remove "- Datei-Explorer"
        } else {
            return title
        }
    } else {
        return ""
    }
}

openTerminalInCurrentExplorerDirectory() {
    if (isExplorerActive()) {
        windowTitle := getTrimmedExplorerWindowTitle()
        Run("wt --startingDirectory `"" windowTitle "`"")
    } else {
        Run("wt")
    }
}

openVSCodeInCurrentExplorerDirectory() {
    if (isExplorerActive()) {
        windowTitle := getTrimmedExplorerWindowTitle()
        Run("`"C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe`" " windowTitle)
    } else {
        Run("`"C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe`"")
    }
}

callExplorer() {
    if !WinExist("ahk_class CabinetWClass") {
        Run("explorer.exe")
    }

    GroupAdd("explorersgroup", "ahk_class CabinetWClass")
    try {
        if WinActive("ahk_exe explorer.exe")
            GroupActivate("explorersgroup", "r")
        else
            WinActivate("ahk_class CabinetWClass")
    }
    catch {
        ; ignore error
    }

}

callVSCode() {
    if !WinExist("ahk_exe Code.exe")
        Run("`"C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe`"")
    if WinActive("ahk_exe Code.exe")
        Send("^{PgDn}")
    else
        WinActivate("ahk_exe Code.exe")
}

callChrome() {
    if !WinExist("ahk_exe chrome.exe")
        Run("chrome.exe")
    if WinActive("ahk_exe chrome.exe")
        Send("^{tab}")
    else
        WinActivate("ahk_exe chrome.exe")
}

premiereClickOnElementPositionProperty() {
    coordX := 85
    coordY := 135

    ; Handle MOGRTs that add another first property field
    if (PixelGetColor(46, 133) = "0x616161") {
        coordX := 91
        coordY := 154
    }

    BlockInput("MouseMove")
    MouseGetPos(&mouseX, &mouseY)
    MouseClick("left", coordX, coordY, , 0)
    MouseMove(mouseX, mouseY, 0)
    BlockInput("MouseMoveOff")
}

switchActiveStreamDeckConfig() {
    if (!WinActive("ahk_exe StreamDeck.exe")) {
        return
    }

    ; Color of the "XL" in the Stream Deck name
    coordX := 179
    coordY := 43
    color := PixelGetColor(coordX, coordY)

    BlockInput("MouseMove")
    MouseGetPos(&mouseX, &mouseY)

    MouseClick("left", coordX, coordY, , 0)
    Sleep(100)

    if (color = "0xE6E6E6") {
        ; Switch from XL to +
        MouseClick("left", coordX, coordY + 40, , 0)
    } else {
        ; Switch from + to XL
        MouseClick("left", coordX, coordY + 60, , 0)
    }

    MouseMove(mouseX, mouseY, 0)
    BlockInput("MouseMoveOff")
}

switchVSCodeWindowSize() {
    smallX := 1264
    smallY := 135
    smallWidth := 1537
    smallHeight := 1133
    largeX := 860
    largeY := 135
    largeWidth := 1941
    largeHeight := 1133

    WinGetPos(&x, &y, &width, &height, "ahk_exe Code.exe")
    if (x = smallX && y = smallY) {
        WinMove(largeX, largeY, largeWidth, largeHeight, "ahk_exe Code.exe")
    } else {
        WinMove(smallX, smallY, smallWidth, smallHeight, "ahk_exe Code.exe")
    }
}
