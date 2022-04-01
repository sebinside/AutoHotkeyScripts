callChrome() {
	IfWinNotExist, ahk_exe chrome.exe
			Run, chrome.exe
		if WinActive("ahk_exe chrome.exe")
			Send ^{tab}
		else
			WinActivate ahk_exe chrome.exe
}