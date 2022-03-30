@echo off
cd %~dp0
if not exist build mkdir build

"C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "source/work.ahk" /out "../build/work.exe"