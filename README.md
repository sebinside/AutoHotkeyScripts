[![AHK Version](https://img.shields.io/badge/AHK%20Version-v2-green)](https://www.autohotkey.com/docs/v2/)
[![AHK Version](https://img.shields.io/badge/Extends-HotkeylessAHK-purple)](https://github.com/sebinside/HotkeylessAHK)
[![AHK Version](https://img.shields.io/badge/Extends-PremiereRemote-purple)](https://github.com/sebinside/PremiereRemote)
[![AHK Version](https://img.shields.io/badge/Extends-PremiereClipboard-purple)](https://github.com/sebinside/PremiereClipboard)


## sebinside's AutoHotkey Scripts

[AutoHotkey](https://www.autohotkey.com/) is a powerful scripting language for Windows. 
It enables one to define own shortcuts, simulate mouse and window movement and automate complete UI interactions.

This repository contains all the script that I currently use. 
It is not meant to be cloned and used directly but rather shall serve as an inspiration. 
I use AutoHotkey scripts in my everyday work to overwrite annoying windows functionality and to add handy custom shortcuts. 
In the following, I give a short overview of my scripts.

Feel free to use or modify any of the provided functionality; 
Just as I did with the scripts repository of [TaranVH](https://github.com/TaranVH/2nd-keyboard).

> [!NOTE] 
> Several shortcuts build on other open source projects, see my [GitHub profile page](https://github.com/sebinside).

## Project Structure

The central AutoHotkey files (*.ahk) of this repository are:

* `ahk.ahk` contains the main functionality such as shortcuts and overrides.
* `hkl.ahk` contains functions to be called via [HotkeylessAHK](https://github.com/sebinside/HotkeylessAHK), e.g., using an Elgato Stream Deck.
* `lib.ahk` contains shared functionality to be used by both AHK scripts mentioned before.
* `rightclickmod.ahk` is a Adobe Premiere Pro mod to speedup the workflow, based on this [original](https://github.com/TaranVH/2nd-keyboard/blob/master/Taran's_Premiere_Mods/PREMIERE_MOD_Right_click_timeline_to_move_playhead.ahk).
* `autostartrunner.ahk` is meant to be put into the Windows Autostart folder and launches the other AHK files.

## Scripts

In the following, I give an overview of some of the functions. 
Please refer to the AutoHotkey files for detailed information.

### Overrides

I override several Windows functions, e.g. opening another folder on pressing `Windows` + `E`. Have a look:

```AutoIt
; Overwrite windows+E
#E:: Run("explorer.exe E:\")
```

### Capslock Modifier

Let's be serious: Who does actually use the *Capslock* button? This one can be used way smarter: As an additional modifier key. More easy shortcuts, yey!

I added a ton of custom `Capslock` shortcuts: Enabling easy typing of symbols you often need while coding, quickly changing between windows, and inserting text snippets. 
Here is a short excerpt: 

```AutoIt
#HotIf GetKeyState("Capslock", "P")
{
	E:: Send("[")
    R:: Send("]")
    D:: Send("{{}")
    F:: Send("{}}")
    T:: Send("\")
	X:: callExplorer()
    W:: callChrome()
}
```

### Mouse Buttons

I want my side mouse buttons to have different functionality in different applications. 
Thus, I bound them to complex shortcuts and change the actual functionality depending on the focussed window. 
This looks as follows:

```AutoIt
^!F12::
{
    if (isPremiereActive()) {
        Send("N")
    } else if (isMinecraftActive()) {
        Send(9)
    } else {
        callExplorer()
    }
}
```

### Stream Deck Functions

I also use the [Elgato Stream Deck](https://702.gg/elgato) in conjunction with AutoHotkey. 
Based on my utility tool [HotkeylessAHK](https://github.com/sebinside/HotkeylessAHK), I define many custom Stream Deck functions. 

The following snippet is an example for a Stream Deck triggered function. 
It opens a custom explorer window and than moves it to a specified position on a second screen:

```AutoIt
OpenAndMoveCuttingFolder() {
        Run("explorer.exe E:\cutting")
        Sleep(1000)
        hWnd := WinExist("E:\cutting")
        WinMove(3433, 247, 974, 1087, "ahk_id " hwnd)
}
```