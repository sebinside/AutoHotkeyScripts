; Several little windows enhancements and shortcuts for my work computer
; Partly based on: https://github.com/TaranVH/2nd-keyboard

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 85 ; this changes the icon.
#singleinstance force ; so you can only run 1 script at a time and it doens't bother you about it.
SetCapsLockState, AlwaysOff ; Disable Capslock.
SetTitleMatchMode, 2 ; Title matches anything that contains the specified string

#Include lib/functions_common.ahk
#Include lib/functions_work.ahk

#Include lib/overrides_common.ahk
#Include lib/overrides_work.ahk

#Include lib/capslock_common.ahk
#Include lib/capslock_work.ahk

#Include lib/mouse_work.ahk