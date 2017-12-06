#NoTrayIcon

Dim $array[10] = ["Macro Activated", 0, TimerInit(), TimerInit(), "Dark Age of Camelot © 2001-2011 Electronic Arts Inc. All Rights Reserved.", _
	"Macro iniziata alle: " & @HOUR & ":" & @MIN & ":" & @SEC, 0, 0, False, 0]

;~ If WinExists($array[4]) == 0 Then ; 0
;~ 	MsgBox(16, "Error", "No daoc's client/s found!", 7)
;~ 	Exit
;~ EndIf

HotKeySet("{esc}", "quit")
HotKeySet("p", "pause")
WinActivate($array[4])
WinWaitActive($array[4], "", 1)

While True
	Sleep(799)
	$array[6] = MouseGetPos(0)
	$array[7] = MouseGetPos(1)
	ToolTip($array[5] & @CRLF & _
	"Ora attuale: " & @HOUR & ":" & @MIN & ":" & @SEC & @CRLF & _
	"Tempo trascorso: " & elapsed($array[2]) & @CRLF & _
	"Switch effettuati: " & $array[1] & @CRLF & _
	"Tempo trascorso dall'ultimo switch: " & elapsed($array[3]), $array[6], $array[7], $array[0], 2, 5)
	If $array[8] == False Then
		#region ------------------------------- TASTI DA PREMERE SEMPRE
		If Mod($array[9], 2) == 0 Then
			Send("1") ; ----------------------- powerless del warlock
		Else
			Send("2") ; ----------------------- pbaoe del warlock
		EndIf
		#endregion ---------------------------- TASTI DA PREMERE SEMPRE
		$array[9] += 1
		If elapsed($array[3]) == "00:19:59" Then
			$array[1] += 1
			#Region --------------------------- TASTI DA PREMERE OGNI TOT TEMPO
			altTab()
			Send("1") ; ----------------------- tasto 1 dello shamano
			Sleep(100)
			altTab()
			Send("3") ; ----------------------- self-AF  del warlock
			Sleep(1500)
			Send("4") ; ----------------------- self-ABS del warlock
			#endregion ------------------------ TASTI DA PREMERE OGNI TOT TEMPO
			$array[3] = TimerInit()
			$array[9] = 0
		EndIf
	EndIf
WEnd

Func altTab()
	Send("{alt down}")
	Send("{tab}")
	Send("{alt up}")
	Sleep(999)
EndFunc

Func quit()
	Exit
EndFunc

Func pause()
	If $array[8] == False Then
		$array[8] = True
		$array[0] = "Macro Paused"
	Else
		$array[8] = False
		$array[0] = "Macro Activated"
	EndIf

EndFunc

Func elapsed($x)
	Local $t = Int(TimerDiff($x) / 1000)
	Return ((Int($t / 3600)) & ":" & zadd(Mod(Int($t / 60), 60)) & ":" & zadd(Mod($t, 60)))
EndFunc

Func zadd($n)
	If $n < 10 Then Return "0" & $n
	Return $n
EndFunc