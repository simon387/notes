;HotKeySet('{esc}', 'quit')

Sleep(5000)
Local $c = 0

While True
	Send('{tab}')
	Sleep(100)
	Send('{F2}')
	Sleep(900)
	Send(1)
	Sleep(100)
	Send(2)
	Sleep(100)
	Send(3)
	Sleep(100)
	Send(4)
	Sleep(100)
	Send(5)
	Sleep(100)
	Send(6)
	Sleep(100)
	Send(7)
	$c += 1
	If $c == 500 Then
		$c = 0
		Send(1)
		Sleep(1000)
		Send(8)
		Sleep(3000)
		Send(9)
		Sleep(3000)
		Send(10)
		Sleep(3000)
	EndIf
WEnd

Func quit()
	Exit
EndFunc