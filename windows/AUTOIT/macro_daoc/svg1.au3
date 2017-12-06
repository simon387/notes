Global $bFlag = False
HotKeySet('{NUMPAD2}', 'trigger')

While True
	If $bFlag == True Then
		If $bFlag == True Then
			Send('{f5}')
			Sleep(9000)
		EndIf
		If $bFlag == True Then
			Send('{f6}')
			Sleep(9000)
		EndIf
		If $bFlag == True Then
			Send('{f7}')
			Sleep(9000)
		EndIf
	EndIf
WEnd

Func trigger()
	If $bFlag == True Then
		$bFlag = False
	Else
		$bFlag = True
	EndIf
EndFunc