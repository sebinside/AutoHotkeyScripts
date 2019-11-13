; skate's minecraft scripts
; Please visit: https://github.com/sebinside/AutoHotkeyScripts
; BEFORE USING THIS SCRIPT
; SET GUI SCALE TO 3
; WINDOW SIZE TO 1920x1080

; HEADER START
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 42 ; A treee!
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.
SetMouseDelay, -1
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
#Usehook On
; HEADER END

+F4::
Click, down, right
return

+F5::
Click, up, right
return

#ifwinactive Minecraft 1.14.4
~Tab::
  WinGetPos, windowX, windowY,,,Minecraft 1.14.4
  PixelGetColor, inventoryOpen, windowX + 720, windowY + 400
  if(inventoryOpen == 0xC6C6C6) {
    Send, {Esc}
  }
  return