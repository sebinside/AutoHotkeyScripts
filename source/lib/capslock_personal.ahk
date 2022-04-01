#IF, GetKeyState("Capslock", "P")
F1::
	autohotkeyfilepath := "D:\Drive\autohotkey"
	Run, %autohotkeyfilepath%
	return

C::
	callChrome()
	return

G::
	Send, ^!j
	return

D::
	Send, {{}
	return
F::
	Send, {}}
	return

#IF