fastPixelGetColorBufferDC = 0
fastPixelGetColorReady = 0
fastPixelGetColorWait = 1

fastPixelGetColor(x, y) {
	global fastPixelGetColorBufferDC, fastPixelGetColorReady, fastPixelGetColorWait
	global fastPixelGetColorScreenLeft, fastPixelGetColorScreenTop
	; check if there is a valid data buffer
	if (!fastPixelGetColorReady) {
		if (fastPixelGetColorWait) {
			Start := A_TickCount 
			While !fastPixelGetColorReady {
				Sleep, 10
				if (A_TickCount - Start > 5000)
					return -3   ; time out if data is not ready after 5 seconds
			}
		}
		else
			return -2   ; return an invalid color if waiting is disabled
	}
	return DllCall("GetPixel", "Uint", fastPixelGetColorBufferDC, "int", x - fastPixelGetColorScreenLeft, "int", y - fastPixelGetColorScreenTop)
}

updateFastPixelGetColor() {
	global fastPixelGetColorReady, fastPixelGetColorBufferDC
	static oldObject = 0, hBuffer = 0
	static screenWOld = 0, screenHOld = 0
	; get screen dimensions
	global fastPixelGetColorScreenLeft, fastPixelGetColorScreenTop
	SysGet, fastPixelGetColorScreenLeft, 76
	SysGet, fastPixelGetColorScreenTop, 77
	SysGet, screenW, 78
	SysGet, screenH, 79
	fastPixelGetColorReady = 0
	; determine whether the old buffer can be reused
	bufferInvalid := screenW <> screenWOld OR screenH <> screenHOld OR fastPixelGetColorBufferDC = 0 OR hBuffer = 0
	screenWOld := screenW
	screenHOld := screenH
	if (bufferInvalid) {
		; cleanly discard the old buffer
		DllCall("SelectObject", "Uint", fastPixelGetColorBufferDC, "Uint", oldObject)
		DllCall("DeleteDC", "Uint", fastPixelGetColorBufferDC)
		DllCall("DeleteObject", "Uint", hBuffer)
		; create a new empty buffer
		fastPixelGetColorBufferDC := DllCall("CreateCompatibleDC", "Uint", 0)
		hBuffer := CreateDIBSection(fastPixelGetColorBufferDC, screenW, screenH)
		oldObject := DllCall("SelectObject", "Uint", fastPixelGetColorBufferDC, "Uint", hBuffer)
	}
	screenDC := DllCall("GetDC", "Uint", 0)
	; retrieve the whole screen into the newly created buffer
	DllCall("BitBlt", "Uint", fastPixelGetColorBufferDC, "int", 0, "int", 0, "int", screenW, "int", screenH, "Uint", screenDC, "int", fastPixelGetColorScreenLeft, "int", fastPixelGetColorScreenTop, "Uint", 0x40000000 | 0x00CC0020)
	; important: release the DC of the screen
	DllCall("ReleaseDC", "Uint", 0, "Uint", screenDC)
	fastPixelGetColorReady = 1
}

CreateDIBSection(hDC, nW, nH, bpp = 32, ByRef pBits = "") {
	NumPut(VarSetCapacity(bi, 40, 0), bi)
	NumPut(nW, bi, 4)
	NumPut(nH, bi, 8)
	NumPut(bpp, NumPut(1, bi, 12, "UShort"), 0, "Ushort")
	NumPut(0,  bi,16)
	Return DllCall("gdi32\CreateDIBSection", "Uint", hDC, "Uint", &bi, "Uint", 0, "UintP", pBits, "Uint", 0, "Uint", 0)
}