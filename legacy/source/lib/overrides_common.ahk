; Shift + Wheel scrolles left / right
#IfWinNotActive Minecraft
+WheelDown::WheelRight
+WheelUp::WheelLeft
#IfWinNotActive

; Overwrites the apostrophe key to be actually usefull without dumb extra key presses
SC00D::
 String := "`` "
 SendRaw %String%
return