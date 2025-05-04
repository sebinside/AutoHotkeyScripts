#Requires AutoHotkey v2.0
; Credits: Based on code from taran
; see: https://github.com/TaranVH/2nd-keyboard/blob/master/Taran's_Premiere_Mods/PREMIERE_MOD_Right_click_timeline_to_move_playhead.ahk
#SingleInstance force
InstallMouseHook()
InstallKeybdHook()

CoordMode("Mouse", "screen")
CoordMode("Pixel", "screen")

TraySetIcon("imageres.dll", "90")

timeline1 := "0x3f3f3f" ;timeline color inside the in/out points ON a targeted track
timeline2 := "0x303030" ;timeline color of the separating LINES between targeted AND non targeted tracks inside the in/out points
timeline3 := "0x3f3f3f" ;the timeline color inside in/out points on a NON targeted track
timeline4 := "0x202020" ;the color of the bare timeline NOT inside the in out points
timeline5 := "0x191919" ;the color of a SELECTED blank space on the timeline, NOT in the in/out points
timeline6 := "0x4a4a4a" ;the color of a SELECTED blank space on the timeline, IN the in/out points, on a TARGETED track
timeline7 := "0x1d1d1d" ;the color of a SELECTED blank space on the timeline, IN the in/out points, on an UNTARGETED track
timeline8 := "0xe2e2e2" ;the color of this stupid selected room between clips

#HotIf WinActive("ahk_exe Adobe Premiere Pro.exe",)
Rbutton::
{
    global
    MouseGetPos(&X, &Y)
    colorr := PixelGetColor(X, Y)
    if (colorr = timeline5 || colorr = timeline6 || colorr = timeline7 || colorr = timeline8)
        Send("^+a") ;set in premiere to DESELECT
    if (colorr = timeline1 || colorr = timeline2 || colorr = timeline3 || colorr = timeline4 || colorr = timeline5 ||
        colorr = timeline6 || colorr = timeline7) {

        Click("middle") ;sends the middle mouse button to BRING FOCUS TO the timeline, WITHOUT selecting any clips or empty spaces between clips. very noice.

        if GetKeyState("Rbutton", "P") = 1 {

            loop {
                Send("{#}") ;in premiere, this is set to "move playhead to cursor."
                Sleep(16) ;this loop will repeat every 16 milliseconds.
                ; if GetKeyState("$Rbutton") = U ; again, this does not work at all.
                if GetKeyState("Rbutton", "P") = 0 {
                    goto("theEnd")
                }
            }
        }
        Send("{escape}") ;in case you end up inside the "delete" right click menu from the timeline
    }
    else
        SendInput("{Rbutton}") ;this is to make up for the lack of a ~ in front of Rbutton. ... ~Rbutton. It allows the command to pass through, but only if the above conditions were NOT met.
theEnd:
    return
}
