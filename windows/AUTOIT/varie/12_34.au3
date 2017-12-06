Sleep(5000)
$counter = 0
While 1
	Send("1")
	Sleep(500)
	Send("2")
	Sleep(500)
	$counter += 1
	If $counter == 600 Then
		Sleep(3000)
		Send("3")
		Sleep(3000)
		Send("4")
		$counter = 0
	EndIf
WEnd
