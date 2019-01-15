; SKATES SCRIPTS
; Heavily based on: https://github.com/TaranVH/2nd-keyboard

; HEADER START
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 16 ;this changes the icon into a little laptop thingy. just useful for making it distinct from the others.
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.
SetCapsLockState, AlwaysOff ; Disable Capslock
; HEADER END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; #############################################################################################################################################
; CAPSLOCK SHORTCUTS (except Window Switch Buttons)
; #############################################################################################################################################

#IF, GetKeyState("Capslock", "P")
F1::																								; Open my Autohotkey Script Folder
	autohotkeyfilepath := "C:\Users\" . A_UserName . "\Dropbox\autohotkey"
	Run, %autohotkeyfilepath%
	return
O::
	cuttingpath := "E:\cutting"
	Run, %cuttingpath%
	return
NumpadSub::
	RunWait, %ComSpec% /k "cd "C:\Users\Sebastian\Documents\skate702 Legacy\letsplaytodolist\""		; Execute LetsPlayToDoList (set mode)
	return
F::
	Run, Photoshop.exe
	return
C::
	Send <
	Run curl ""http://localhost:8081/selectSelectedNamedVideoLayer?name=COLOR"",,hide
	return
W::		; Selects current layer
	Send ^+a
	Run curl ""http://localhost:8081/selectCurrentMarker"",,hide
	return
E::		; Adds a new layer, opens Rename
	RunWait curl ""http://localhost:8081/addCustomMarker"",,hide
	Send {Right}{Right}
	Sleep 100
	Send ^+a
	RunWait curl ""http://localhost:8081/selectCurrentMarker"",,hide
	Sleep 50
	Send ^!+u
	return
R::		; Adds new layer in a different color named TODO
	RunWait curl ""http://localhost:8081/addCustomMarker"",,hide
	Send {Right}{Right}
	Sleep 100
	Send ^+a
	RunWait curl ""http://localhost:8081/selectCurrentMarker"",,hide
	Sleep 50
	Send ^!+8
	RunWait curl ""http://localhost:8081/setCurrentMarkerName?name=TODO"",,hide
	return
Q:: ; Toggles the top layer
	RunWait curl ""http://localhost:8081/toggleLockCustomMarkerTrack"",,hide
	return
M::
	RunWait curl ""http://localhost:8081/saveCustomMarkers"",,hide
	return
T::
	RunWait curl ""http://localhost:8081/insertNamedRootItemIntoTrack?trackNumber=1&itemName=WHOSH&deltaInTicks=-38102400000&isVideoTrack=false"",,hide
	return
#IF


; #############################################################################################################################################
; WINDOW SWITCHES
; #############################################################################################################################################

#IfWinActive 

; F1 holds the "BACK" script.
^+!F12::																							; Back Button (Nyth Button 9)
if WinActive("ahk_class MozillaWindowClass")
	Send ^+{tab} ; CTRL SHIFT TAB is the shortcut for "go to previous tab"
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^+{tab}
if WinActive("ahk_class Notepad++")
	Send ^+{tab}
if WinActive("ahk_exe Adobe Premiere Pro.exe")
	Send {F12} ; F12 is my shortcut in premiere for "go back"(in bins)
if WinActive("ahk_exe explorer.exe")
	Send !{left} ; ALT LEFT is the explorer shortcut to go "back" or "down" one folder level.
Return


; Explorer shortcuts
^!F12::																								; Explorer SWITCH Button (Nyth Button 10)
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, taranexplorers, ahk_class CabinetWClass 
if WinActive("ahk_exe explorer.exe")
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class CabinetWClass 
Return

; Chrome Shortcuts
^+F12::																								; Chrome SWITCH Button (Nyth Button 11)
IfWinNotExist, ahk_exe chrome.exe
	Run, chrome.exe
if WinActive("ahk_exe chrome.exe")
	Send ^{tab}
else
	WinActivate ahk_exe chrome.exe
Return

; Premiere Shortcut
+!F12::																								; Premiere SWITCH Button (Nyth Button 12)
IfWinNotExist, ahk_class Premiere Pro
	Run, Adobe Premiere Pro.exe
WinActivate ahk_class Premiere Pro
Return

; Bonus Scripts with Capslock Button

#IF, GetKeyState("Capslock", "P")

^!F12::																								; Explorer RUN Button (Nyth Button 10)
	Run, explorer.exe
return
^+F12::																								; Chrome RUN Button (Nyth Button 11)
	Run, chrome.exe
return
+!F12::																								; Premiere RUN Button (Nyth Button 12)
	Run, Adobe Premiere Pro.exe
return

#IF

; #############################################################################################################################################
; OTHER SHORTCUTS 
; #############################################################################################################################################

+F4::
Click, down, right
return

+F5::
Click, up, right
return

^F4::
Click, down
return

^F5::
Click, up
return

#IfWinActive, Minecraft 1.13.2 
{
Q::
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
SetMouseDelay, -1
SetBatchLines, -1

	windowX := 0
	windowY := 0
	offsetX := 750
	offsetY := 600
	chestColor := 000000
	chestOffset := 0
	WinGetPos, windowX, windowY,,,Minecraft 1.13.2
	PixelGetColor, chestColor, windowX + 720, windowY + 280
	if (chestColor == 0xC6C6C6) {
		chestOffset = 80
	}
	Loop, 3 {
		Y_Index := A_Index
		Loop, 9 {
			MouseMove, windowX + offsetX + (A_Index - 1) * 55, windowY + offsetY + (Y_Index - 1) * 55 + chestOffset
			Send +{Click}
		}
	}	
	Send {Tab}

return
}
#IF
/* +55 */
/*Gui, Add, TreeView
P1 := TV_Add("First parent")
P1C1 := TV_Add("Parent 1's first child", P1)  ; Specify P1 to be this item's parent.
P2 := TV_Add("Second parent")
P2C1 := TV_Add("Parent 2's first child", P2)
P2C2 := TV_Add("Parent 2's second child", P2)
P2C2C1 := TV_Add("Child 2's first child", P2C2)

Gui, Add, Button, Hidden Default, OK

Gui, Show  ; Show the window and its TreeView.
return

ButtonOK:
MsgBox % "Enter was pressed. The selected item ID is " . TV_GetSelection()
Gui, Cancel
return
*/

;FileAppend, `n%StartTime%, C:\Users\Sebastian\Desktop\timestamps.txt
;return
