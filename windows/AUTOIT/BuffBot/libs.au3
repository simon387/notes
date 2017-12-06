Global $sBusy	=	@scriptdir & '\busy.txt'
Global $sTitle	=	'Dark Age of Camelot © 2001-2012 Electronic Arts Inc. All Rights Reserved.'
Global $nTime	=	2800

Func TLred()
	IniWrite($sBusy, 'main', '1', 1)
EndFunc

Func TLgreen()
	IniWrite($sBusy, 'main', '1', 0)
EndFunc

Func clientCheck()
	If WinExists($sTitle) == 0 Then secureQuit()
	If WinActivate($sTitle) == 0 Then secureQuit()
	WinWaitActive($sTitle)
EndFunc

Func target($sName)
	Send('{ENTER}/target ' & $sName & '{ENTER}')
	Sleep(250)
EndFunc

Func secureQuit()
	TLgreen()
	Exit 0
EndFunc

Func setupBuffCall($sTarget)
	clientCheck()
	target($sTarget)
EndFunc

Func buff($nInt)
	Send($nInt)
	Sleep($nTime)
 EndFunc