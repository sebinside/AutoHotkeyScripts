callEdge() {
	IfWinNotExist, ahk_exe msedge.exe
			Run, msedge.exe
		if WinActive("ahk_exe msedge.exe")
			Send ^{tab}
		else
			WinActivate ahk_exe msedge.exe
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

acrobatHighlight() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(-350,0,-1,-1)
	}
}

acrobatHighlightYellow() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,200,90)
	}
}

acrobatHighlightGreen() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,160,90)
	}
}

acrobatHighlightBlue() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,120,120)
	}
}

acrobatHighlightRed() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,280,90)
	}
}

acrobatStamp() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(45,0,-1,-1)
	}
}