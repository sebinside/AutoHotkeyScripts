#IF, GetKeyState("Capslock", "P")

A::
	if WinActive("ahk_exe Acrobat.exe") {
		acrobatHighlight()
	}
	return

S::
	if WinActive("ahk_exe Acrobat.exe") {
		acrobatStamp()
	}
	return

G::
	if WinActive("ahk_exe Acrobat.exe") {
		acrobatHighlightBlue()
	} else {
		Send, ^!j
	}
	return

H::
	if WinActive("ahk_exe Acrobat.exe") {
		acrobatHighlightRed()
	}
	return

B::
	Send, ^!b
	return

D::
	if WinActive("ahk_exe Acrobat.exe") {
		acrobatHighlightYellow()
	} else {
		Send, {{}
	}
	return
F::
	if WinActive("ahk_exe Acrobat.exe") {
		acrobatHighlightGreen()
	} else {
		Send, {}}
	}
	return

C::
	callEdge()
	return


#IF

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