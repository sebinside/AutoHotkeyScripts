; Overwrite WIN+E for custom start folder
#E::
	Run, explorer.exe E:\
	return

; Fancy new windows 11 feature aka open old context menu lol
;#IfWinActive ahk_exe explorer.exe
;+RButton::
;	Send {Click}
;	Send +{F10}
;return
;#IfWinActive

; Minecraft fix
#ifwinactive Minecraft 1.19.4
~Tab::
  WinGetPos, windowX, windowY,,,Minecraft 1.19.4
  PixelGetColor, inventoryOpen, windowX + 690, windowY + 400
  if(inventoryOpen == 0xC6C6C6) {
    Send, {Esc}
  }
  return

+#f::
	Send, ^+!k
	return
