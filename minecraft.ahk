﻿; skate's minecraft scripts
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
#Include fastPixelGetColor.ahk
; HEADER END

#ifwinactive Minecraft 1.13.2

; Moves all the items in the inventory to a chest
+Q::
  BlockInput, MouseMove
  windowX := 0
  windowY := 0
  offsetX := 744 + 1 + 7
  offsetY := 567 + 31
  chestColor := 000000
  chestOffset := 0
  inventoryOpen := 0
  WinGetPos, windowX, windowY,,,Minecraft 1.13.2
  PixelGetColor, inventoryOpen, windowX + 720, windowY + 400
  if(inventoryOpen != 0xC6C6C6) {
    BlockInput, MouseMoveOff
    return
  }
  PixelGetColor, survInventory, windowX + 720 + 220, windowY + 400
  if (survInventory == 0xC6C6C6) {
    BlockInput, MouseMoveOff
    return
  }
  PixelGetColor, chestColor, windowX + 720, windowY + 280
  if (chestColor == 0xC6C6C6) {
    chestOffset = 81
  }
  Loop, 3 {
    Y_Index := A_Index
    Loop, 9 {
      MouseMove, windowX + offsetX + (A_Index - 1) * 54, windowY + offsetY + (Y_Index - 1) * 54 + chestOffset
      Send +{Click}
    }
  }  
  Send {Tab}
  BlockInput, MouseMoveOff
return

; Grabs up to 63 items of a sort from a chest and moves it to the inventory
Q::
  BlockInput, MouseMove
  inventoryColor := 9145227 ;0x8b8b8b
  shiftX := [0, -8, -5, -4, 12, 13, 15, 18, -10, 0]
  shiftY := [0, 12, 14, -3, -11, -14, 7, 12, 0, 17]
  windowX := 0
  windowY := 0
  offsetX := 744 + 1 + 7
  offsetY := 567 + 31
  chestColor := 000000
  chestOffset := 0
  WinGetPos, windowX, windowY,,,Minecraft 1.13.2
  PixelGetColor, inventoryOpen, windowX + 720, windowY + 400
  if(inventoryOpen != 0xC6C6C6) {
    BlockInput, MouseMoveOff
    Send, q
    return
  }
  PixelGetColor, survInventory, windowX + 720 + 220, windowY + 400
  if (survInventory == 0xC6C6C6) {
    BlockInput, MouseMoveOff
    return
  }
  PixelGetColor, chestColor, windowX + 720, windowY + 280
  if (chestColor == 0xC6C6C6) {
    chestOffset = 81
  }
  updateFastPixelGetColor() ; grab the screen into memory
  Loop, 3 {
    Y_Index := A_Index
    Loop, 9 {
      X_Index := A_Index
      found := 1
      for iX, eX in shiftX {
          posX := windowX + offsetX + (X_Index - 1) * 54 + eX
          posY := windowY + offsetY + (Y_Index - 1) * 54 + chestOffset + shiftY[iX]
          
          if(fastPixelGetColor(posX, posY) != inventoryColor) {
            found := 0
            break
          }
          
      }
      if (found == 1) {
        freeSlotX := A_Index - 1
        freeSlotY := Y_Index - 1
        mouseX := 0
        mouseY := 0
        MouseGetPos, mouseX, mouseY 
        Send {Click}
        Send {RButton}
        MouseMove, windowX + offsetX + freeSlotX * 54, windowY + offsetY + freeSlotY * 54 + chestOffset
        Send {Click}
        MouseMove, mouseX, mouseY
        ; Debug if an item is not detected correctly
        ;MsgBox, %freeSlotX% . " " . %freeSlotY%
        BlockInput, MouseMoveOff
        return
      }
    }
  }
BlockInput, MouseMoveOff
return

; Sorts the inventory, NEEDS custom texture pack
^X::
  BlockInput, MouseMove
  colorElytra := 16776192
  colorArrow := 9868950
  colorFire := 00
  colorAxe := 255
  colorShovel := 29439
  colorPickaxe := 65322
  colorBow := 12189951
  colorChest := 16733184
  windowX := 0
  windowY := 0
  offsetX := 744 + 1 + 7
  offsetY := 567 + 31
  WinGetPos, windowX, windowY,,,Minecraft 1.13.2
  PixelGetColor, inventoryOpen, windowX + 720, windowY + 400
  if(inventoryOpen != 0xC6C6C6) {
    BlockInput, MouseMoveOff
    return
  }
  PixelGetColor, survInventory, windowX + 720 + 220, windowY + 400
  if (survInventory != 0xC6C6C6) {
    BlockInput, MouseMoveOff
    return
  }
  updateFastPixelGetColor() ; grab the screen into memory
  Loop, 4 {
    Y_Index := A_Index
    Loop, 9 {
      X_Index := A_Index
      found := 0
      posX := windowX + offsetX + (X_Index - 1) * 54 - 13
      posY := windowY + offsetY + (Y_Index - 1) * 54 + 13
      
      if(Y_Index == 4) {
          posY := posY + 12
      }
      
      pixelColor := fastPixelGetColor(posX, posY)
      ; Debug for getting color of magic pixel
      ;Msgbox, %pixelColor%
      
      foundSlotX := A_Index - 1
      foundSlotY := Y_Index - 1
      
      targetSlotX := 0
      targetSlotY := 0
      
      if(pixelColor == colorElytra) {
        targetSlotX := 0
        targetSlotY := 0
        found := 1
      } else if(pixelColor == colorArrow) {
        targetSlotX := 0
        targetSlotY := 1
        found := 1
      } else if(pixelColor == colorFire) {
        targetSlotX := 1
        targetSlotY := 0
        found := 1
      } else if(pixelColor == colorAxe) {
        targetSlotX := 0
        targetSlotY := 2
        found := 1
      } else if(pixelColor == colorShovel) {
        targetSlotX := 1
        targetSlotY := 2
        found := 1
      } else if(pixelColor == colorPickaxe) {
        targetSlotX := 2
        targetSlotY := 2
        found := 1
      } else if(pixelColor == colorBow) {
        targetSlotX := 1
        targetSlotY := 1
        found := 1
      } else if(pixelColor == colorChest) {
        targetSlotX := 0
        targetSlotY := 0
        found := 1
      } else if(pixelColor == 16777215) { ; Fix for large number of item - stacks
        posX := windowX + offsetX + (X_Index - 1) * 54 - 1
        posY := windowY + offsetY + (Y_Index - 1) * 54 - 1
        
        if(Y_Index == 4) {
          posY := posY + 12
        }
        
        pixelColor := fastPixelGetColor(posX, posY)
        
        if(pixelColor == 0) {
          targetSlotX := 0
          targetSlotY := 1
          found := 1
        } else if(pixelColor == 255) {
          targetSlotX := 1
          targetSlotY := 0
          found := 1
        }
      }
      
      if(found == 1) {
        mouseX := 0
        mouseY := 0
        MouseGetPos, mouseX, mouseY
        MouseMove, windowX + offsetX + foundSlotX * 54, windowY + offsetY + foundSlotY * 54
        Send {Click}
        MouseMove, windowX + offsetX + targetSlotX * 54, windowY + offsetY + targetSlotY * 54
        Send {Click}
        MouseMove, windowX + offsetX + foundSlotX * 54, windowY + offsetY + foundSlotY * 54
        Send {Click}
        MouseMove, mouseX, mouseY
        updateFastPixelGetColor() ; grab the screen into memory
      }
    }
  }
  BlockInput, MouseMoveOff
return 

; Elytra hotswapping, inventory needs to be sorted first
X::
BlockInput, MouseMove
windowX := 0
windowY := 0
offsetX := 744 + 1 + 7
offsetY := 567 + 31
WinGetPos, windowX, windowY,,,Minecraft 1.13.2
PixelGetColor, inventoryOpen, windowX + 720, windowY + 400
if(inventoryOpen == 0xC6C6C6) {
  Send {Tab}
}
Sleep, 10
Send {Tab}
Sleep, 100
PixelGetColor, inventoryOpen, windowX + 720, windowY + 400
if(inventoryOpen != 0xC6C6C6) {
  BlockInput, MouseMoveOff
  return
}
; Elytra Hotswap
MouseMove, windowX + offsetX, windowY + offsetY
Send {Click}
MouseMove, windowX + offsetX, windowY + offsetY - 170
Send {Click}
MouseMove, windowX + offsetX, windowY + offsetY
Send {Click}
Sleep, 20
; Rocket Hotswap
MouseMove, windowX + offsetX + 54, windowY + offsetY
Send {Click}
MouseMove, windowX + offsetX + 54 * 4, windowY + offsetY - 60
Send {Click}
MouseMove, windowX + offsetX + 54, windowY + offsetY
Send {Click}
Sleep, 20
Send {Tab}
BlockInput, MouseMoveOff
return

isAutocrafting := 0

; Autocrafting for Kelp Compression
; Ensure the following: Recipe book inventory mode, Showing craftable activated
^Y::
windowX := 0
windowY := 0
WinGetPos, windowX, windowY,,,Minecraft 1.13.2
mouseX := 0
mouseY := 0
MouseGetPos, mouseX, mouseY 
isAutocrafting := 1
while isAutocrafting == 1 {

; Over intput chest
Send {RButton}
Sleep, 500
MouseMove, windowX + 750, windowY + 400
Send +{Click}
Sleep, 50
Send {Tab}

Send, {S down}
Sleep, 1000
Send, {S up}
Sleep, 500

; Over crafting table
Send {RButton}
Sleep, 500
MouseMove, windowX + 555, windowY + 444 ; Click on recipe
Send +{Click}
Sleep, 250
MouseMove, windowX + 1323, windowY + 450 ; Click on output
Loop, 8 {
  Send {Click}
  Sleep, 50
}
Sleep, 50
MouseMove, windowX + 1350, windowY + 767 ; Click on inventory slot
Send {Click}
Sleep, 50
Send {Tab}

Send, {D down}
Sleep, 1000
Send, {D up}
Sleep, 500

; Over output chest
Send {RButton}
Sleep, 500
MouseMove, windowX + 1130, windowY + 777 ; Click on inventory slot
Send +{Click}
Sleep, 50
Send {Tab}

Send, {A down}
Sleep, 1000
Send, {A up}
Sleep, 500
Send, {W down}
Sleep, 500
Send, {W up}
Sleep, 1000
}
return

+^Y::
isAutocrafting := 0
return

; Farm fast
Y::
Send {Click}
Sleep, 50
Send {RButton}
return



B::
timerRuns := 0
windowX := 0
windowY := 0
posX := 1200
posY := 1070
WinGetPos, windowX, windowY,,,Minecraft 1.13.2
Send {9}
MouseMove, 0, 1000
SetTimer, EmergencyTimer, 1
return

EmergencyTimer:
timerRuns := timerRuns + 1
if(timerRuns == 200) {
  SetTimer, EmergencyTimer, Off
  return
}
Send {RButton}
return