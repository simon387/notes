#include <Misc.au3>

Global $hDLL = DllOpen("user32.dll")

While True
    If _IsPressed("73", $hDLL) Then
        Send('7')
		Sleep(25)
        Send('6')
		Sleep(25)
        Send('5')
		Sleep(25)
	EndIf
WEnd

DllClose($hDLL)