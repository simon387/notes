;#NoTrayIcon
#include <Misc.au3>
;Global Const $sDaoc = 'Dark Age of Camelot © 2001'

Local $hDLL = DllOpen("user32.dll")

While True
    If _IsPressed("72", $hDLL) Then
        Send('u')
		Sleep(25)
        Send('y')
		Sleep(25)
        Send('5')
		Sleep(1450)
	EndIf
	Sleep(50)
WEnd

DllClose($hDLL)

Func quit()
	Exit
EndFunc