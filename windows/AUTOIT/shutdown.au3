While 1
   If @HOUR = 23 Or @HOUR < 5 Then
	  Shutdown(13)
   EndIf
   Sleep(1000 * 60)
WEnd