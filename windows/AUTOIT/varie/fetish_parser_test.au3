#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#NoTrayIcon

$dato = InputBox("trolololo", "inserisci il danno: ", 1337)

If $dato == "" Then Exit

$file = ""

$file = FileOpen(FileOpenDialog("Seleziona il file di log", @ScriptDir, "All files (*.*)|Text files (*.txt)|Log files (*.log)"))

If $file == -1 Then
    MsgBox(4096,"","No File chosen")
	Exit
EndIf

$c = 0

$string = ""

While 1
    $line = FileReadLine($file)

    If @error = -1 Then ExitLoop

	If StringInStr($line, $dato) <> 0 Then

		if $c == 1 Then
			$string = "primo colpo: " & $line
		EndIf

		If $c == 101 Then
			$string = $string & @CRLF & "101esimo colpo: " & $line
		EndIf

		$c += 1
	EndIf
Wend

MsgBox(0, "Fine programma", "hits totali: " & $c & @CRLF & $string)