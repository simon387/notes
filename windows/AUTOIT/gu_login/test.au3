#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
;ConsoleWrite($GUI_EVENT_CLOSE)

Send("{PRINTSCREEN}")
Sleep(999)
Run("mspaint.exe")
Sleep(999)
Send("^v")
Sleep(999)
Send("!f4")
Sleep(999)
Send("s")
Sleep(999)
Send("C:\Users\Simone\Dropbox\AUTOIT\gu_login\" & Random(0, 99999999))
Sleep(999)
Send("{enter}")