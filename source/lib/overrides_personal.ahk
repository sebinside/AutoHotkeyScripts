; Overwrite WIN+E for custom start folder
#E::
	Run, explorer.exe E:\
	return

; Fancy new windows 11 feature aka open old context menu lol
#IfWinActive ahk_exe explorer.exe
+RButton::
	Send {Click}
	Send +{F10}
return
#IfWinActive