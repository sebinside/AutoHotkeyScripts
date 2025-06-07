#Requires AutoHotkey v2.0
#Include "vars.ahk"

SendMode("Input")

SetWorkingDir(varHotkeylessAHKPath())
Run(varHotkeylessAHKPath() . "HotkeylessAHK.ahk")

SetWorkingDir(varAutoHotkeyScriptsPath())
Run(varAutoHotkeyScriptsPath() . "ahk.ahk")
Run(varAutoHotkeyScriptsPath() . "rightclickmod.ahk")
