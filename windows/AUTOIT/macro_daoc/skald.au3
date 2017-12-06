Global $flag = False
HotKeySet("ò", "trigger")

While True
	If $flag Then
		;daocSend("")
		daocSend("{NUMPAD4}")
		daocSend("{NUMPAD1}")
		daocSend("{NUMPAD2}")
		;daocSend("")
		daocSend("")
		daocSend("{NUMPAD6}")
		daocSend("{NUMPAD3}")
		daocSend("", 8111)
	EndIf
WEnd

Func trigger()
	$flag = Not $flag
EndFunc

Func daocSend($key = "", $deelay = 166)
	If $flag Then
		If $key <> "" Then Send($key)
		Sleep($deelay)
	EndIf
EndFunc