;#NoTrayIcon
#include <Misc.au3>
;Global Const $sDaoc = 'Dark Age of Camelot © 2001'

Local $hDLL = DllOpen("user32.dll")

While True
    If _IsPressed("73", $hDLL) Then
  Send('7')
  Sleep(25)
  Send('6')
  Sleep(25)
        Send('5')
  If _IsPressed("73", $hDLL) Then Sleep(1450)
 EndIf
WEnd

DllClose($hDLL)

Func quit()
 Exit
EndFunc