; Shift + Wheel scrolles left / right
+WheelDown::WheelRight
+WheelUp::WheelLeft

; Overwrites the apostrophe key to be actually usefull without dumb extra key presses
SC00D::
 String := "`` "
 SendRaw %String%
return