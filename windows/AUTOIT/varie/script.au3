$folderName = FileSelectFolder("Seleziona la cartella", @ScriptDir)
If $folderName == "" Then Exit

$array = DirGetSize($folderName, 1)

Dim $array[$array[1]][2]
$counter = 0

ScanFolder($folderName)

Func ScanFolder($folderName)
	Local $Search = FileFindFirstFile($folderName & "\*.*")
	While 1
		If $search = -1 Then ExitLoop
		$fileHandle = FileFindNextFile($search)
		If @error Then ExitLoop
		$fullFilePath = $folderName & "\" & $fileHandle
		$fileAttributes = FileGetAttrib($fullFilePath)
		If StringInStr($fileAttributes, "D") Then
			ScanFolder($fullFilePath)
		Else
			LogFile($fullFilePath)
		EndIf
	WEnd
	FileClose($search)
EndFunc

Func LogFile($FileName)
	ToolTip($FileName, 0, 0)
	$array[$counter][0] = $FileName
	$array[$counter][1] = FileGetSize($FileName)
	$counter += 1
EndFunc

For $i = 0 To UBound($array) - 1
	Local $counter = 0
	for $c = 0 To UBound($array) - 1
		If $array[$i][1] == $array[$c][1] Then $counter += 1
	Next
	If $counter > 1 Then ConsoleWrite($array[$i][0] & " " & $array[$i][1] & @CRLF)
Next