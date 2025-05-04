#IF, GetKeyState("Capslock", "P")
F1::
	autohotkeyfilepath := "D:\Drive\autohotkey"
	Run, %autohotkeyfilepath%
	return

W::
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