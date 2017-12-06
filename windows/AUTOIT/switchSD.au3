#RequireAdmin
;~ _Singleton()

Global Const $x = 1109
Global Const $y = 339
Global Const $key = '{MEDIA_STOP}'
HotKeySet($key, 'switchFunction')

While True
	Sleep(99999)
WEnd

Func switchFunction()
	Send("{SHIFTDOWN}")
	MouseClick("right", $x, $y, 1, 0)
	Send("{SHIFTUP}")
EndFunc

Func _Singleton()
	Local $aHandle = DllCall('kernel32.dll', 'handle', 'CreateMutexW', 'struct*', 0, 'bool', 1, 'wstr', @ScriptName)
	If @error Then Return SetError(@error, @extended, 0)
	Local $aLastError = DllCall('kernel32.dll', 'dword', 'GetLastError')
	If @error Then Return SetError(@error, @extended, 0)
	If $aLastError[0] = 183 Then Exit -1
	Return $aHandle[0]
EndFunc