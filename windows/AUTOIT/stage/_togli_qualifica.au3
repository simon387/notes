Global $hFile = FileOpen("text.txt", 0)

While True
	Local $sLine = FileReadLine($hFile)
	If @error == -1 Then ExitLoop
	Local $iPos = StringInStr($sLine, "Cat.", 1)
	If $iPos <> 0 Then $sLine = StringLeft($sLine, $iPos - 1)
	FileWriteLine(@ScriptDir & "\output.txt", $sLine & @CRLF)
WEnd

FileClose($hFile)