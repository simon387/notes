;HotKeySet("{esc}", "quit")
Sleep(5000)
while 1

	selezionaFinestra("sb")
	Sleep(1000)

	Send(2)

	Sleep(1000)

	selezionaFinestra("mauler")

	;Sleep(10000)
	Sleep(60 * 10 * 1000)
wend

Func quit()
	Exit
EndFunc

Func selezionaFinestra($name)
   WinActivate($name)
   WinWaitActive($name)
EndFunc