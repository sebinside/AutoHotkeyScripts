; skate's minecraft scripts
; Please visit: https://github.com/sebinside/AutoHotkeyScripts

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

/*
~+T:: ;suspenden alles sobald du T drückst
~t::
Suspend, On
Hotkey, Enter, On
Hotkey, NumPadEnter, On
Hotkey, Escape, On
Hotkey, t, Off
Hotkey, +T, Off
return

~NumpadEnter:: ;aktivieren alles sobald du den Chat schließt oder nachricht abschickst
~Enter::
~Escape::
Suspend, Permit
Suspend, Off
Hotkey, t, On
Hotkey, +T, On
Hotkey, Enter, Off
Hotkey, NumPadEnter, Off
Hotkey, Escape, Off
return
*/
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

Q::
	BlockInput, MouseMove
	inventoryColor := 9145227 ;0x8b8b8b
	shiftX := [0, -8, -5, -4, 12, 13, 15, 18]
	shiftY := [0, 12, 14, -3, -11, -14, 7, 12]
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



#IF