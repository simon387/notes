;HotKeySet('{esc}', 'quit')

Sleep(5000)
;~ Local $c = 0

While True
	Send('r')
	Sleep(100)
	Send('f')
	Sleep(1700)
WEnd

Func quit()
	Exit
EndFunc