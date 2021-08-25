#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Win+t: always on top
#t::  Winset, Alwaysontop, , A

; Win+m: open Line
#m::  Run, C:\Users\ricky\AppData\Local\LINE\bin\LineLauncher.exe

; Win+n: open Notion
#n::
IfWinNotExist, ahk_exe Notion.exe
{
	Run, C:\Users\ricky\AppData\Local\Programs\Notion\Notion.exe
	return
}
else
{
	winActivate, ahk_exe Notion.exe
	return
}

; Win+c: open Google calendar
#c::  Run, https://calendar.google.com/calendar/u/0/r
