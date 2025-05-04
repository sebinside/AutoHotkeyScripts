#Requires AutoHotkey v2.0

SendMode("Input")
SetWorkingDir(A_ScriptDir)
TraySetIcon("shell32.dll","16")
#SingleInstance force

SetCapsLockState("AlwaysOff") ; Disable Capslock
SetTitleMatchMode(2) ; Title matches anything that contains the specified string

; Overwrite windows+E
#E::Run("explorer.exe E:\")

; Overwrites the apostrophe key to be actually useful without dumb extra key presses
SC00D::
{
 String := "`` "
 Send("{Raw}" String)
return
}


#HotIf GetKeyState("Capslock", "P")

B::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("^!b")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

Q::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("``")
	Send("``")
	Send("{Left}")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

T::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("\")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

C::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	if WinActive("ahk_class CabinetWClass") {
		Title := WinGetTitle("ahk_class CabinetWClass")
		TrimmedTitle := SubStr(Title, 1, -1*(17)) ; Remove "- Windows Explorer"
		;MsgBox, cmd /k "cd /d %TrimmedTitle%"
		;return
		Run("cmd /k `"cd /d " TrimmedTitle "`"")
		return
	} else {
		Run("cmd")
		return
	}
} ; V1toV2: Added Bracket before hotkey or Hotstring

V::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	if !WinExist("ahk_exe Code.exe")
		if WinActive("ahk_class CabinetWClass") {
			Title := WinGetTitle("ahk_class CabinetWClass")
			; msgbox, %Title%
			TrimmedTitle := SubStr(Title, 1, -1*(17)) ; Remove "- Windows Explorer"
			Run("C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe " TrimmedTitle)
			return
		} else {
			Run("`"C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe`"")
			return
		}

	if WinActive("ahk_exe Code.exe")
		Send("^{PgDn}")
	else
		WinActivate("ahk_exe Code.exe")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
X::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	callExplorer()
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

E::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
R::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("]")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

1:: 
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[1]")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
2:: 
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[2]")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
3:: 
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[3]")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
4:: 
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[4]")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
5:: 
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[5]")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
6:: 
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[6]")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
7:: 
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("[7]")
	return
}
	
SC00D::
{
	String := "Â´"
 	Send("{Raw}" String)
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

W::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	callChrome()
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

G::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("^!j")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

D::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("{{}")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring
F::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	Send("{}}")
	return
} ; V1toV2: Added bracket in the end


#HotIf

^!F12::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send("N")
	} else if WinActive("Minecraft* 1.21.1 - Multiplayer (3rd-party Server)") || WinActive("Minecraft 1.7.10")  {
		Send(9)
	} else {
		callExplorer()
	}
	Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

^!F11::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send("B")
	} else if WinActive("Minecraft* 1.21.1 - Multiplayer (3rd-party Server)") || WinActive("Minecraft 1.7.10")  {
		Send(8)
	} else {
		callChrome()
	}
	Return
} ; V1toV2: Added Bracket before hotkey or Hotstring

^!F10::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		BlockInput("MouseMove")
        MouseGetPos(&mouseX, &mouseY)
		MouseClick("left", 110, 190, , 0)
		MouseMove(mouseX, mouseY, 0)
        BlockInput("MouseMoveOff")
	} else if WinActive("Minecraft* 1.21.1 - Multiplayer (3rd-party Server)") || WinActive("Minecraft 1.7.10")  {
		Send("{Click}")
		Sleep(50)
		Send("{RButton}")
	} else {
		callVSCode()
	}
	Return
} ; V1toV2: Added bracket before function


callExplorer() {
	if !WinExist("ahk_class CabinetWClass")
			Run("explorer.exe")
		GroupAdd("taranexplorers", "ahk_class CabinetWClass")
		if WinActive("ahk_exe explorer.exe")
			GroupActivate("taranexplorers", "r")
		else
			WinActivate("ahk_class CabinetWClass")
}

callVSCode() {
	if !WinExist("ahk_exe Code.exe")
			Run("`"C:\Users\Sebastian\AppData\Local\Programs\Microsoft VS Code\Code.exe`"")
		if WinActive("ahk_exe Code.exe")
			Send("^{PgDn}")
		else
			WinActivate("ahk_exe Code.exe")
}

callChrome() {
	if !WinExist("ahk_exe chrome.exe")
			Run("chrome.exe")
		if WinActive("ahk_exe chrome.exe")
			Send("^{tab}")
		else
			WinActivate("ahk_exe chrome.exe")
}