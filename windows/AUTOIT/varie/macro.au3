HotKeySet("{esc}", "quit")
Dim $array[6] = [0, 0, TimerInit(), TimerInit(), "Dark Age of Camelot © 2001-2011 Electronic Arts Inc. All Rights Reserved.", "Macro iniziata alle: " & @HOUR & ":" & @MIN & ":" & @SEC]

While True
	ToolTip($array[5] & @CRLF & _
	"Ora attuale: " & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF & _
	"Tempo trascorso: " & elapsed($array[2]) & @CRLF & _
	"Comandi inviati: " & $array[1] & @CRLF & _
	"Tempo trascorso dall'ultimo comando: " & elapsed($array[3]) _
	,400, 400)
	Sleep(500)
	$array[0] += 1
	If $array[0] > Random(60, 120, 1) Then
		$array[0] = 0
		$array[1] += 1
		WinActivate($array[4])
		WinWaitActive($array[4], "", 10)
		;Send("1")
		$array[3] = TimerInit()
	EndIf
WEnd

Func quit()
	Exit
EndFunc

Func elapsed($x)
	Local $t = Int(TimerDiff($x) / 1000)
	Return (zadd(Int($t / 3600)) & ":" & zadd(Mod(Int($t / 60), 60)) & ":" & zadd(Mod($t, 60)))
EndFunc

Func zadd($n)
	If $n < 10 Then Return "0" & $n
	Return $n
EndFunc