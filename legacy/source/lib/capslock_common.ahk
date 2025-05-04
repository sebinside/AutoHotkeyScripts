#IF, GetKeyState("Capslock", "P")

Q::
	Send ``
	Send ``
	Send {Left}
	return

T::
	Send \
	return

C::
	if WinActive("ahk_class CabinetWClass") {
		WinGetTitle, Title, ahk_class CabinetWClass
		StringTrimRight, TrimmedTitle, Title, 17 ; Remove "- Windows Explorer"
		;MsgBox, cmd /k "cd /d %TrimmedTitle%"
		;return
		Run, cmd /k "cd /d %TrimmedTitle%"
		return
	} else {
		Run, cmd
		return
	}

V::
	IfWinNotExist, ahk_exe Code.exe
		if WinActive("ahk_class CabinetWClass") {
			WinGetTitle, Title, ahk_class CabinetWClass
			; msgbox, %Title%
			StringTrimRight, TrimmedTitle, Title, 17 ; Remove "- Windows Explorer"
			Run, C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe %TrimmedTitle%
			return
		} else {
			Run, "C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe"
			return
		}

	if WinActive("ahk_exe Code.exe")
		Send ^{PgDn}
	else
		WinActivate ahk_exe Code.exe
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