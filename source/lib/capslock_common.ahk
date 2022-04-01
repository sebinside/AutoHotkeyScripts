#IF, GetKeyState("Capslock", "P")

Q::
	Send ``
	Send ``
	Send {Left}
	return

T::
	Send \
	return

V::
	callVSCode()
	return
X::
	callExplorer()
	return

E::
	Send, [
	return
R::
	Send, ]
	return

1:: 
	Send, [1]
	return
2:: 
	Send, [2]
	return
3:: 
	Send, [3]
	return
4:: 
	Send, [4]
	return
5:: 
	Send, [5]
	return
6:: 
	Send, [6]
	return
7:: 
	Send, [7]
	return

SC00D::
	String := "´"
 	SendRaw %String%
	return

#IF