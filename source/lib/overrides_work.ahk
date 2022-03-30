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