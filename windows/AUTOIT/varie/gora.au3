HotKeySet("a", "funzione1")

While True
	Sleep(1000)
WEnd

Func funzione1()
	Send("1")
	Sleep(500)
	Send("2")
EndFunc