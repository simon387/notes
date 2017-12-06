HotKeySet('{esc}', 'quit')
Func quit()
	Exit
EndFunc
Sleep(6000)
While True
	Send('^v')
	Sleep(20)
	Send('{enter}')
	Sleep(20)
	Send('{enter}')
	Sleep(100)
WEnd