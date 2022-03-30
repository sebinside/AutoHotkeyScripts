#IF, GetKeyState("Capslock", "P")
F1::
	autohotkeyfilepath := "D:\Drive\autohotkey"
	Run, %autohotkeyfilepath%
	return

C::
	callChrome()
	return

G::
	Send, ^!j
	return

#IF

callChrome() {
	IfWinNotExist, ahk_exe chrome.exe
			Run, chrome.exe
		if WinActive("ahk_exe chrome.exe")
			Send ^{tab}
		else
			WinActivate ahk_exe chrome.exe
}