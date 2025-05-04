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

W::
	callEdge()
	return


#IF