; WINDOWS BASICS - Simple functions which shall be present on every of my windows machines
; Partly based on: https://github.com/TaranVH/2nd-keyboard

; HEADER START
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 85 ;this changes the icon into a little laptop thingy. just useful for making it distinct from the others.
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.
SetCapsLockState, AlwaysOff ; Disable Capslock
; HEADER END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; #############################################################################################################################################
; OVERWRITES
; #############################################################################################################################################

; Overwrites the apostrophe key to be actually usefull without dumb extra key presses
SC00D::
 String := "`` "
 SendRaw %String%
 return

; Deactivate page up & down (dumb key placement)
PgUp::
	return
PgDn::
	return

; #############################################################################################################################################
; CAPSLOCK SHORTCUTS
; #############################################################################################################################################

#IF, GetKeyState("Capslock", "P")
T::
	Send \
	return

V::
	callVSCode()
	return

G::
	Send, ^!j
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

; Overwrite custom apostrophe functionality
SC00D::
	String := "´"
 	SendRaw %String%
	return

; For english keyboards
Q::
	Send, <
	return

W::
	Send, >
	return

#::
	String := "'"
 	SendRaw %String%
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

; Mouse button 3 (mute ts in minecraft, else move mouse to move in premiere, focus code)
^!F10::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		BlockInput, MouseMove
        MouseGetPos, mouseX, mouseY
		MouseClick, left, 110, 190,, 0
		MouseMove, mouseX, mouseY, 0
        BlockInput, MouseMoveOff
	} else if WinActive("Minecraft 1.14.4") || WinActive("Minecraft 1.7.10")  {
		Send, ^{F10}
	} else {
		callVSCode()
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

callVSCode() {
	IfWinNotExist, ahk_exe Code.exe
			Run, "C:\Users\seb\AppData\Local\Programs\Microsoft VS Code\Code.exe"
		if WinActive("ahk_exe Code.exe")
			Send ^{PgDn}
		else
			WinActivate ahk_exe Code.exe
}