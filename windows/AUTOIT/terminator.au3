Global $sArray[7] =	["HD-Agent.exe", _
					"HD-Adb.exe", _
					"____Dropbox.exe", _
					"____Skype.exe", _
					"conhost.exe", _
					"HD-Frontend.exe", _
					"HD-Service.exe"]

Global $sString = ""

For $i = 0 To UBound($sArray) - 1
	While ProcessExists($sArray[$i]) <> 0
		ToolTip("Killing " & $sArray[$i], 10, 10, "Terminator v0")
		If ProcessClose($sArray[$i]) <> 0 Then
			$sString &= " " & $sArray[$i]
			ExitLoop
		EndIf
	WEnd
Next

If StringLen($sString) < 1 Then
	$sString = ""
Else
	$sString = @CRLF & "Process Terminated: " & @CRLF & $sString
EndIf

ToolTip("Done" & $sString, 10, 10, "Terminator v0")
Sleep(3000)