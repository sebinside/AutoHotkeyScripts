@echo off
cd %~dp0

"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "source/personal.ahk" /out "../build/personal.exe"
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "source/rightclickmod.ahk" /out "../build/rightclickmod.exe"
"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "source/RunHotkeylessAHK.ahk" /out "../build/RunHotkeylessAHK.exe"