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

; Stream deck shortcuts to use acrobat
^!F1::
	acrobatHighlight()
	return

^!F2::
	acrobatStamp()
	return

^!F6::
	acrobatHighlightYellow()
	return

^!F5::
	acrobatHighlightGreen()
	return

^!F4::
	acrobatHighlightBlue()
	return

^!F3::
	acrobatHighlightRed()
	return

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
		sendAcrobatCenteredClick(300,0,280,120)
	}
}

acrobatHighlightBlue() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,320,90)
	}
}

acrobatHighlightRed() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(300,0,200,120)
	}
}

acrobatStamp() {
	if WinActive("ahk_exe Acrobat.exe") {
		sendAcrobatCenteredClick(45,0,-1,-1)
	}
}