; skate's 24/7 AFK-Fishfarm
; Please visit: https://github.com/sebinside/AutoHotkeyScripts
; BEFORE USING THIS SCRIPT
; SET GUI SCALE TO 3
; AND MOVE FISHING ROD TO SLOT 1
; AND DEACTIVATE CHAT
; AND CHANGE TEXTURE PACK

; HEADER START
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 44 ; A star!
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.
SetMouseDelay, -1
SetBatchLines, -1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
#Usehook On
; HEADER END

; Global vars
isAlive := 0

; Hotkeys

+F4::
  toggleMining(true)
return

+F5::
  toggleMining(false)
return

+F1::
  testValidWindow()
  return

+F2::
  checkDamage()
  return

+F3::
  checkDisconnect()
  return

+F6::
  checkLamp()
  return

; Functions

testValidWindow() {
  if !WinExist("Minecraft 1.14.4") {
    MsgBox, Minecraft not found!
  } else {
    hWnd := WinExist("Minecraft 1.14.4")
    WinMove,ahk_id %hwnd%,,100,100,1280,720
    MsgBox, Minecraft window moved!
  }
}

toggleMining(mining) {
  global isAlive
  if(mining) {
    isAlive = 1
    Click, down, right
    checkAll()
  } else {
    isAlive = 0
    Click, up, right
  }
}

checkDamage() {
  WinGetPos, windowX, windowY,,,Minecraft 1.14.4
  PixelGetColor, damageBar, windowX + 470, windowY + 702,RGB
  damageBarStart := SubStr(damageBar, 3,1)
  if(damageBarStart == "D" or damageBarStart == "E" or damageBarStart == "F") {
    toggleMining(false)
    Send, {Esc}
    Sleep, 1000
    WinGetPos, windowX, windowY,,,Minecraft 1.14.4
    MouseClick, left, windowX + 500, windowY + 420
  }
}

checkDisconnect() {
  WinGetPos, windowX, windowY,,,Minecraft 1.14.4
  PixelGetColor, BackButton, windowX + 481, windowY + 484,RGB

  if(BackButton == 0x1F1D1C) {
    toggleMining(false)
    MouseClick, left, windowX + 481, windowY + 434
    Sleep, 40000 ; sleep 40 seconds
    MouseClick, left, windowX + 380, windowY + 120
    Sleep, 5000
    toggleMining(true)
  }
}

checkLamp() {
  ; TODO
}

checkAll() {
  global isAlive
  while(isAlive == 1) {
    checkDamage()
    checkDisconnect()
    checkLamp()
    Sleep, 5000
  }
}