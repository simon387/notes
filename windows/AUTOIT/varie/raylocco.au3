#NoTrayIcon
$testFlag = True
$testString = 'TEST MODE - '
If $testFlag == False Then $testString = ''

Dim $var[7] = [toLogFile('script started'), TimerInit(), TimerInit(), timestamp(), 0, 0, 0]
HotKeySet("{esc}", "quit")

$logTimer = TimerInit()
$chatlog = @MyDocumentsDir & "\Electronic Arts\Dark Age of Camelot\chat.log"
$chatFlag = False
MsgBox(0, "", "hai 3 secondi per dare il focus alla finestra del locco", 3)
FileDelete($chatlog)
Sleep(3000)
;~ logTrigger()

While True
	;checkClients()
	Sleep(899)
	ToolTip("Ora locale:" & @TAB & timestamp()	& @CRLF & _
			"Ora avvio:"  & @TAB & $var[3] & @CRLF & _
			"Trascorso:"  & @TAB & elapsed($var[1]), 0, 0, $testString & "Macro Activated", 5, 4)
	If Mod($var[0], 2) == 0 Then
		Send(1)
	Else
		Send(2)
	EndIf
	$var[0] += 1
	If TimerDiff($var[2]) > 1200000 Then
		Sleep(1500)
		Send(3)
		Sleep(1500)
		Send(4)
		$var[2] = TimerInit()
	EndIf

;~ 	If TimerDiff($logTimer) > 60000 Then
;~ 		ConsoleWrite("passati 10 sec")
;~ 		toLogFile('è passato un minuto')
;~ 		Sleep(500)
;~ 		logTrigger()
;~ 		Sleep(3000)
;~ 		FileDelete($chatlog)
;~ 		logTrigger()
;~ 		Sleep(500)
;~ 		$logTimer = TimerInit()
;~ 	EndIf

WEnd

Func elapsed($string)
	Local $c = TimerDiff($string) / 1000
	Return StringFormat("%02d:%02d:%02d", $c / 3600, Mod(($c / 60), 60), Mod($c, 60))
EndFunc

Func timestamp()
	Return @HOUR & ":" & @MIN & ":" & @SEC
EndFunc

Func quit()
	toLogFile('script terminated by user')
	If $chatFlag == True Then logTrigger()
	Exit
EndFunc

Func toLogFile($string)
	If $testFlag == True Then $string = "Script in Test mode! - " & $string
	FileWriteLine(@ScriptDir & '\filelog.txt', '[' & @ComputerName & '][' & @MDAY & '/' & @MON & '/' & @YEAR & '][' & timestamp() & '] : ' & $string)
	Return 0
EndFunc

Func logTrigger()
	Send(0)
	$chatFlag = Not $chatFlag
EndFunc

Func checkClients()
	For $c = 1 To 3
		$array = WinGetClientSize('Camelot' & $c)
		If IsArray($array) == 1 Then
			If $array[0] <> 800 Then
				If $var[$c + 3] == 0 Then
					$var[$c + 3] = 1
					toLogFile('the client Camelot' & $c & ' has gone Link Death!')
 					terminator('connession issues')
				EndIf
			EndIf
		Else
			If $var[$c + 3] <> 2 Then
				$var[$c + 3] = 2
				toLogFile('the client Camelot' & $c & ' is not running!')
 				terminator('a client error')
			EndIf
		EndIf
	Next
EndFunc

Func checkCSR()
	toLogFile(' sent to client')
	terminator('a send from ')
EndFunc

Func checkDeath()
	toLogFile('')
	terminator('')
EndFunc

Func terminator($string)
	toLogFile('auto-terminating script due to ' & $string)
	toLogFile('starting computer shutdown')
	If $testFlag == False Then
		Shutdown(9)
	Else
		MsgBox(16, "Test message", 'Il computer ora si dovrebbe spegnere!' & @CRLF & 'Script terminato!')
		Exit
	EndIf
EndFunc