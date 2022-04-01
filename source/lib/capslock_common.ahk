#IF, GetKeyState("Capslock", "P")

Q::
	Send ``
	Send ``
	Send {Left}
	return

T::
	Send \
	return

V::
	callVSCode()
	return
X::
	callExplorer()
	return

E::
	Send, [
	return
R::
	Send, ]
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

SC00D::
	String := "´"
 	SendRaw %String%
	return

#IF

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