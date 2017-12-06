#NoTrayIcon
HotKeySet("{esc}", "esc")

Global Const $oraSveglia = "07"
Global Const $minSveglia = "14"
Global Const $secSveglia = "15"
Global Const $path = @WindowsDir & "\media\tada.wav"
Global Const $textSveglia = @CRLF & "sveglia settata per le : " & $oraSveglia & ":" & $minSveglia & ":" & $secSveglia

;~  suona()
;~ Exit

While True
	ToolTip("Ora attuale:                  " & @HOUR & ":" & @MIN & ":" & @SEC & $textSveglia)
	If @HOUR == $oraSveglia And @MIN == $minSveglia Then ;And @SEC == $secSveglia Then
		suona()
	EndIf
	Sleep(999)
WEnd

Func esc()
	exit 0
EndFunc

Func suona()
	While 1
		ConsoleWrite("sveglia!" & @CRLF)
		SoundPlay($path, 1)
	WEnd
EndFunc
