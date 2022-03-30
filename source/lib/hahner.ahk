; WINDOWS BASICS - Simple functions which shall be present on every of my windows machines
; HAHNER version - optimized for work
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

+WheelDown::WheelRight
+WheelUp::WheelLeft

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

; Create windows N for One Note
#N::
	if WinExist(,"OneNote for Windows 10") {
		Process, Close, onenoteim.exe
    } else {
		Run, C:\Users\hahner\Documents\AutoHotkeyScripts\OneNoteApp.lnk
    }
	return

; Overwrite WIN+E for custom start folder
#E::
	Run, explorer.exe C:\hahner
	return

; Overwrite Win+E for custom window placement
#M::
	Send, #^{Right}
	Sleep, 50
	Send, #^{Right}
	Sleep, 50
	if WinExist("ahk_exe OUTLOOK.EXE") {
		hWnd := WinExist("ahk_exe OUTLOOK.EXE", "Tabellenansicht")
		WinMove,ahk_id %hwnd%,,0,0,1720,1400
		hWnd := WinExist("ahk_exe OUTLOOK.EXE", "Nachricht")
		WinMove,ahk_id %hwnd%,,0,0,1720,1400
		hWnd := WinExist("ahk_exe OUTLOOK.EXE", "Day View")
		WinMove,ahk_id %hwnd%,,1720,0,1720,1400
    } else {
		Run, "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
    }
	if WinExist("ahk_exe slack.exe") {
		hWnd := WinExist("ahk_exe slack.exe")
		WinMove,ahk_id %hwnd%,,3440,99,960,1160
    } else {
		Run, "C:\Users\hahner\AppData\Local\slack\app-4.9.0\slack.exe"
    }
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

A::
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(-350,0,-1,-1)
	}
	return

S::
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(45,0,-1,-1)
	}
	return

G::
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,320,90)
	} else {
		Send, ^!j
	}
	return

H::
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,200,120)
	}
	return

B::
	Send, ^!b
	return

E::
	Send, [
	return
R::
	Send, ]
	return
D::
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,200,90)
	} else {
		Send, {{}
	}
	return
F::
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,280,120)
	} else {
		Send, {}}
	}
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

#IF

; #############################################################################################################################################
; MOUSE BUTTONS
; #############################################################################################################################################

; Mouse button 1 (S in premiere, 9 in Minecraft, explorer else)
^!F12::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send, N
	} else {
		callExplorer()
	}
	Return

; Mouse button 2 (A in premiere, 8 in Minecraft, chrome else)
^!F11::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send, B
	} else {
		callEdge()
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
	} else {
		callVSCode()
	}
	Return

; Mouse 4 (goto acrobat)
^!F9::
	callAcrobat()
	Return

; Pen A
^!F7::
	if WinActive(,"OneNote for Windows 10") {
		Sleep, 250
		Send, {Alt}
		Sleep, 50
		Send, {Down}
		Sleep, 50
		Send, ^{Right}
		Sleep, 50
		Send, ^{Right}
		Sleep, 50
		Send, {Right}
		Sleep, 50
		Send, {Enter}
	}
	Return

; Pen B
^!F8::
	if WinActive(,"OneNote for Windows 10") {
		Sleep, 250
		Send, {Alt}
		Sleep, 50
		Send, {Down}
		Sleep, 50
		Send, ^{Right}
		Sleep, 50
		Send, {Right}
		Sleep, 50
		Send, {Enter}
	}
	Return

; #############################################################################################################################################
; FUNCTIONS
; #############################################################################################################################################

callExplorer() {
	IfWinNotExist, ahk_class CabinetWClass
			Run, explorer.exe C:\hahner
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

callEdge() {
	IfWinNotExist, ahk_exe msedge.exe
			Run, msedge.exe
		if WinActive("ahk_exe msedge.exe")
			Send ^{tab}
		else
			WinActivate ahk_exe msedge.exe
}

callVSCode() {
	IfWinNotExist, ahk_exe Code.exe
			Run, "C:\Users\hahner\AppData\Local\Programs\Microsoft VS Code\Code.exe"
		if WinActive("ahk_exe Code.exe")
			Send ^{PgDn}
		else

			WinActivate ahk_exe Code.exe
}

callAcrobat() {
	if !WinExist("ahk_exe Acrobat.exe") {
			Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Adobe Acrobat DC.lnk"
			Sleep, 200
			Send {Enter}
	} else {
		if WinActive("ahk_exe Acrobat.exe")
			Send ^{tab}
		else
			WinActivate ahk_exe Acrobat.exe
	}
}

sendAcrobatCenteredClick(deltaX,deltaY,secondDeltaX,secondDeltaY) {
	if WinExist("ahk_exe Acrobat.exe") {
		WinGetPos, X, Y, Width, Height
		CoordMode, Mouse , Screen
		BlockInput, MouseMove
        MouseGetPos, curmouseX, curmouseY
		MouseClick, left, X + Width / 2 + deltaX, Y + 160 + deltaY,, 0
		if (secondDeltaX <> -1) {
			sleep, 30
			MouseClick, left, X + Width / 2 + secondDeltaX, Y + 160 + secondDeltaY,, 0
			sleep, 10
			MouseClick, left, X + Width / 2 + deltaX, Y + 160 + deltaY,, 0
		}
		MouseMove, curmouseX, curmouseY, 0
        BlockInput, MouseMoveOff
	}
}