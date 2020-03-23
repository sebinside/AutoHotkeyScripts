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
; CAPSLOCK SHORTCUTS
; #############################################################################################################################################

#IF, GetKeyState("Capslock", "P")
F1::																								; Open my Autohotkey Script Folder
	autohotkeyfilepath := "C:\Users\" . A_UserName . "\Dropbox\autohotkey"
	Run, %autohotkeyfilepath%
	return

Q::
	Send ``
	Send ``
	Send {Left}
	return

V::
	IfWinNotExist, ahk_exe Code.exe
		Run, "C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe"
	if WinActive("ahk_exe Code.exe")
		WinMinimize ahk_exe Code.exe
	else
		WinActivate ahk_exe Code.exe
	return

E::
	Send, [
	return
R::
	Send, ]
	return
D::
	Send, {{}
	return
F::
	Send, {}}
	return

X::
	callExplorer()
	return
C::
	callChrome()
	return
1:: 
	Send, [1]
	return
2:: 
	Send, [2]
	return
3:: 
	Send, [3]
	return
4:: 
	Send, [4]
	return
5:: 
	Send, [5]
	return
6:: 
	Send, [6]
	return
7:: 
	Send, [7]
	return
#IF

; #############################################################################################################################################
; MOUSE BUTTONS
; #############################################################################################################################################

; Mouse button 1 (S in premiere, 9 in Minecraft, explorer else)
^!F12::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send, N
	} else if WinActive("Minecraft 1.14.4") || WinActive("Minecraft 1.7.10")  {
		Send, 9
	} else {
		callExplorer()
	}
	Return

; Mouse button 2 (A in premiere, 8 in Minecraft, chrome else)
^!F11::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send, B
	} else if WinActive("Minecraft 1.14.4") || WinActive("Minecraft 1.7.10")  {
		Send, 8
	} else {
		callChrome()
	}
	Return

; Mouse button 3 (mute ts, else move mouse to move in premiere)
^!F10::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		BlockInput, MouseMove
        MouseGetPos, mouseX, mouseY
		MouseClick, left, 110, 190,, 0
		MouseMove, mouseX, mouseY, 0
        BlockInput, MouseMoveOff
	} else {
		Send, ^{F10}
	}
	Return

; #############################################################################################################################################
; FUNCTIONS
; #############################################################################################################################################

callExplorer() {
	IfWinNotExist, ahk_class CabinetWClass
			Run, explorer.exe
		GroupAdd, taranexplorers, ahk_class CabinetWClass 
		if WinActive("ahk_exe explorer.exe")
			GroupActivate, taranexplorers, r
		else
			WinActivate ahk_class CabinetWClass 
}

callChrome() {
	IfWinNotExist, ahk_exe chrome.exe
			Run, chrome.exe
		if WinActive("ahk_exe chrome.exe")
			Send ^{tab}
		else
			WinActivate ahk_exe chrome.exe
}

/*

~Numpad0::
	Run curl ""http://localhost:42702/mode?key=Numpad0"",,hide
	return

~Numpad4::
	Run curl ""http://localhost:42702/mode?key=Numpad4"",,hide
	return

~Numpad1::
	Run curl ""http://localhost:42702/mode?key=Numpad1"",,hide
	return

~Numpad2::
	Run curl ""http://localhost:42702/mode?key=Numpad2"",,hide
	return

~Numpad3::
	Run curl ""http://localhost:42702/mode?key=Numpad3"",,hide
	return

~Numpad6::
	Run curl ""http://localhost:42702/mode?key=Numpad6"",,hide
	return

~Numpad7::
	Run curl ""http://localhost:42702/mode?key=Numpad7"",,hide
	return

~Numpad8::
	Run curl ""http://localhost:42702/highlight?key=Numpad8"",,hide
	return
	
~Numpad9::
	Run curl ""http://localhost:42702/mode?key=Numpad9"",,hide
	return

~NumpadEnter::
	Run curl ""http://localhost:42702/highlight?key=NumpadEnter"",,hide
	return

	*/
/*
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
*/



; #############################################################################################################################################
; WINDOW SWITCHES
; #############################################################################################################################################
/*
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
*/
/*
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
*/
; Bonus Scripts with Capslock Button
/*
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
*/
; #############################################################################################################################################
; OTHER SHORTCUTS 
; #############################################################################################################################################

/*
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
*/
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