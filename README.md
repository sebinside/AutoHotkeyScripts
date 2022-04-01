# sebinside's AutoHotkey Scripts

[AutoHotkey](https://www.autohotkey.com/) is a powerful scripting language for Windows. It enables one to define own shortcuts, simulate mouse and window movement and automate complete UI interactions.

This repository contains all the script that I currently use. It is not meant to be cloned and used directly but rather shall serve as an inspiration. I use AutoHotkey scripts in my everyday work to overwrite annoying windows functionality and to add handy custom shortcuts. In the following, I give a short overview of my scripts.

Feel free to use or modify any of the provided functionality. Just as I did with the scripts repository of [Taran](https://github.com/TaranVH/2nd-keyboard).

## Project Structure

This repository is structured as follows: The `source` folder all AutoHotkey script files. Here, the top level files like `work.ahk` and `personal.ahk` only reference the actual functionality that is located inside the `lib` folder. I distinguish between *common* functionality and functionality that is only required in my *personal* or *work* environment. The script files can be build using the `.cmd` file. Afterwards, I usually copy them directly into the Windows startup folder.

## Scripts

In the following, I give an overview of some of the functions. Please refer to the AutoHotkey files for detailed information.

### Overrides

I override several Windows functions, e.g. opening another folder on pressing `Windows` + `E`. Also, I enable opening up the old Windows 10 context menu in Windows 11 explorer when additionally pressing `Shift`. Have a look:

```AutoIt
#E::
	Run, explorer.exe E:\
	return

#IfWinActive ahk_exe explorer.exe
+RButton::
	Send {Click}
	Send +{F10}
return
#IfWinActive
```

### Capslock Modifier

Let's be serious: Who does actually and unironically use the *Capslock* button? This one can be used way smarter: As an additional modifier key. More easy shortcuts, yey!

I added a ton of custom `Capslock` shortcuts: Enabling easy typing of symbols you often need while coding, quickly changing between windows, and inserting text snippets. Here is a short excerpt: 

```AutoIt
#IF, GetKeyState("Capslock", "P")
E::
	Send, [
	return
R::
	Send, ]
	return
1:: 
	Send, [1]
	return
B::
	Send, ^!b
	return
#IF 
```

### Mouse Buttons

I want my side mouse buttons to have different functionality in different applications. Thus, I bound them to complex shortcuts and change the actual functionality depending on the focussed window. This looks as follows:

```AutoIt
^!F12::
	if WinActive("ahk_exe Adobe Premiere Pro.exe") {
		Send, N
	} else if WinActive("Minecraft") {
		Send, 9
	} else {
		callExplorer()
	}
	return
```

### Stream Deck Functions

I also use the [Elgato Stream Deck](https://702.yt/elgato) in conjunction with AutoHotkey. Based on my utility tool [HotkeylessAHK](https://github.com/sebinside/HotkeylessAHK), I define many custom Stream Deck functions. 

The following snippet is an example for a Stream Deck triggered function. It opens a custom explorer window and than moves it to a specified position on a second screen:

```AutoIt
OpenAndMoveCamFolder() {
    Run, explorer.exe K:\cam
    Sleep, 1000
    hWnd := WinExist("K:\cam")
    WinMove,ahk_id %hwnd%,,4393,247,974,1087
}
```