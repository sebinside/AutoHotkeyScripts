callExplorer() {
	IfWinNotExist, ahk_class CabinetWClass
			Run, explorer.exe
		GroupAdd, taranexplorers, ahk_class CabinetWClass 
		if WinActive("ahk_exe explorer.exe")
			GroupActivate, taranexplorers, r
		else
			WinActivate ahk_class CabinetWClass 
}

callVSCode() {
	IfWinNotExist, ahk_exe Code.exe
			Run, "C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe"
		if WinActive("ahk_exe Code.exe")
			Send ^{PgDn}
		else
			WinActivate ahk_exe Code.exe
}