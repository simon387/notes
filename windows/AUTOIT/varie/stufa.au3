HotKeySet("q", "quit")

While True
	Local $a = Random(-999999999, 99999999999999)
	Local $b = Random(-999999999, 99999999999999)
	$c = $a*$b
	ConsoleWrite($a*$b&@CRLF)
WEnd

Func quit()
	Exit
EndFunc