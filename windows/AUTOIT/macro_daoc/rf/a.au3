$bFlag = False; variabile booleana
HotKeySet("x", 'trigger')

While True
    If $bFlag == True Then
        If $bFlag == True Then
            Send("1")
            Sleep(50)
        EndIf
        If $bFlag == True Then
            Send("1")
            Sleep(50)
        EndIf
        If $bFlag == True Then
            Send("1")
            Sleep(50)
         EndIf
         If $bFlag == True Then
            Send("1")
            Sleep(50)
        EndIf
        If $bFlag == True Then
            Send("1")
            Sleep(7700)
        EndIf
    EndIf
    Sleep(50)
WEnd


Func trigger()
    If $bFlag == True Then
        $bFlag = False
    Else
        $bFlag = True
    EndIf
EndFunc