^!F12::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send, N
	} else if WinActive("Minecraft* 1.18.1 - Multiplayer (3rd-party Server)") || WinActive("Minecraft 1.7.10")  {
		Send, 9
	} else {
		callExplorer()
	}
	Return

^!F11::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send, B
	} else if WinActive("Minecraft* 1.18.1 - Multiplayer (3rd-party Server)") || WinActive("Minecraft 1.7.10")  {
		Send, 8
	} else {
		callChrome()
	}
	Return

^!F10::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		BlockInput, MouseMove
        MouseGetPos, mouseX, mouseY
		MouseClick, left, 110, 190,, 0
		MouseMove, mouseX, mouseY, 0
        BlockInput, MouseMoveOff
	} else if WinActive("Minecraft* 1.18.1 - Multiplayer (3rd-party Server)") || WinActive("Minecraft 1.7.10")  {
		Send {Click}
		Sleep, 50
		Send {RButton}
	} else {
		callVSCode()
	}
	Return
