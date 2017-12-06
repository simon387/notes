HotKeySet("{esc}", "esc")

Global Const $title 	= "Dark Age of Camelot © 2001"
Sleep(1499)
WinActivate($title)
WinWaitActive($title)

For $i = 0 To 500
	Send(2)
	Sleep(8888)
Next

Shutdown(13)

Func esc()
	Exit
EndFunc