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

