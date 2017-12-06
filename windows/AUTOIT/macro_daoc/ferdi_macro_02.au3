Global $bFlag = False
HotKeySet('q', 'trigger')

While True
	If $bFlag == True Then
		If $bFlag == True Then
			Send(1)
			Sleep(250)
		EndIf
		If $bFlag == True Then
			Send(2)
			Sleep(250)
		EndIf
		If $bFlag == True Then
			Send(3)
			Sleep(250)
		EndIf
		If $bFlag == True Then
			Send(4)
			Sleep(250)
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