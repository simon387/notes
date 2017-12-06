;#NoTrayIcon
#include <Misc.au3>
;Global Const $sDaoc = 'Dark Age of Camelot © 2001'

Local $hDLL = DllOpen("user32.dll")

While True
    If _IsPressed("74", $hDLL) Then
        Send('9')
		Sleep(25)
        Send('8')
		Sleep(1450)
	EndIf
	Sleep(50)
WEnd

DllClose($hDLL)

Func quit()
	Exit
EndFunc