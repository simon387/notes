$bFlag = False; variabile booleana
HotKeySet("<", 'trigger')

While True
	If $bFlag == True Then
		If $bFlag == True Then
			Send("o")
			Sleep(9900)
		EndIf
		If $bFlag == True Then
			Send("p")
			Sleep(9900)
		EndIf
		If $bFlag == True Then
			Send("j")
			Sleep(9900)
		EndIf
	EndIf
	Sleep(50)
WEnd

Func trigger()
	If $bFlag == True Then
		$bFlag = False
	Else
		$bFlag = True
	EndIf
EndFunc