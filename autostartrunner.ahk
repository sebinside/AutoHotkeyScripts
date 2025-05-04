#Requires AutoHotkey v2.0

SendMode("Input") 

SetWorkingDir("E:\code\HotkeylessAHK\")
Run("E:\code\HotkeylessAHK\HotkeylessAHK.ahk")

SetWorkingDir("E:\code\AutoHotkeyScripts")
Run("E:\code\AutoHotkeyScripts\ahk.ahk")
Run("E:\code\AutoHotkeyScripts\rightclickmod.ahk")