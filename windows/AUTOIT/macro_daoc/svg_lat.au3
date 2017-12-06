#include <Misc.au3>

Global $hDLL = DllOpen("user32.dll")

While True
    If _IsPressed("54", $hDLL) Then
        Send('y')
		Sleep(25)
        Send('{f8}')
		Sleep(25)
        Send('r')
		Sleep(1450)
	EndIf
WEnd

DllClose($hDLL)