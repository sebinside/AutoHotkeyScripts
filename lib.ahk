; This file contains shared library files used both in my main scripts and HotkeylessAHK scripts.
#Requires AutoHotkey v2.0

isExplorerActive() {
    return WinActive("ahk_class CabinetWClass") != 0
}

isPremiereActive() {
    return WinActive("ahk_exe Adobe Premiere Pro.exe") != 0
}

isMinecraftActive() {
    return WinActive("Minecraft* 1.") != 0 || WinActive("Minecraft 1.") != 0
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
    if !WinExist("ahk_class CabinetWClass")
        Run("explorer.exe")
    GroupAdd("explorersgroup", "ahk_class CabinetWClass")
    if WinActive("ahk_exe explorer.exe")
        GroupActivate("explorersgroup", "r")
    else
        WinActivate("ahk_class CabinetWClass")
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
    BlockInput("MouseMove")
    MouseGetPos(&mouseX, &mouseY)
    MouseClick("left", 110, 190, , 0)
    MouseMove(mouseX, mouseY, 0)
    BlockInput("MouseMoveOff")
}
