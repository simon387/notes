#cs ----------------------------------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Simone Celia

 Script Function:
	Farming plats with pbaoe + blockbot from different (virtual)PCs with CSR-check

 Instructions:
	In-game commands: MUST be setted in /keyboard: L - log file, F - replay, R - reset camera (optional)
	Game MUST run in 800x600 resolution, window mode, never minimized, only 1 client allowed
	Scriptdir MUST be shared via DropBox or other similar software
	p pause esc quit

#ce ----------------------------------------------------------------------------------------------------

;~ #NoTrayIcon
#include <functions.au3>

Global Const $hStartTime = TimerInit()
Global Const $sStartTime = timestamp()

Global $sTitle = 'Macro Activated'
Global $hTimedHandler = TimerInit()
Global $bPause = False
Global $iVar = 0
Global $iTimedCounter = 0
;~ Global $hLastLog = TimerInit()

HotKeySet('{esc}', 'preQuit')
HotKeySet('p', 'pause')

toLogFiles('script started')
IniWrite($sIniFile, 'main', 'toQuit', 0)
IniWrite($sIniFile, 'main', 'last', '')
IniWrite($sLocalIniFile, 'main', 'key', 0)

ShellExecute('checkLog.au3')

While True
	checkLog()
	checkClient()

	Sleep(300)
	ToolTip('Ora locale:' & @TAB & timestamp() & @CRLF & _
			'Ora avvio:' & @TAB & $sStartTime & @CRLF & _
			'Trascorso:' & @TAB & elapsed($hStartTime) & @CRLF & _
			'Timed effettuati: ' & @TAB & $iTimedCounter & @CRLF & _
			'Ultimi timed: ' & @TAB & elapsed($hTimedHandler), 800, 620, $sTitle, 5, 4)
	If $bPause == False Then
		#region ---------------------------------------------------------------------- TASTI DA PREMERE SEMPRE
		If Mod($iVar, 2) == 0 Then
			DAOCsend('1') ; ---------------------------------------------------------- powerless del warlock
		Else
			DAOCsend('2') ; ---------------------------------------------------------- pbaoe del warlock
		EndIf
		#endregion ------------------------------------------------------------------- TASTI DA PREMERE SEMPRE
		$iVar += 1
;~ 		ConsoleWrite(@CRLF & TimerDiff($hTimedHandler))
		If TimerDiff($hTimedHandler) > 6001000 Then;10 minuti
			$iTimedCounter += 1
			#Region ------------------------------------------------------------------ TASTI DA PREMERE OGNI 20 MINUTI
			DAOCsend('3') ; ---------------------------------------------------------- self-AF  del warlock
			Sleep(1500)
			DAOCsend('4') ; ---------------------------------------------------------- self-ABS del warlock
			#endregion --------------------------------------------------------------- TASTI DA PREMERE OGNI 20 MINUTI
			$hTimedHandler = TimerInit()
			$iVar = 0
		EndIf
	EndIf
WEnd

Func checkLog()
	Local $sTemp = IniRead($sIniFile, 'main', 'last', '')
	If  $sTemp <> '' Then
		DAOCanswer()
	EndIf
EndFunc

Func checkClient()
	If IniRead($sIniFile, 'main', 'toQuit', 1) == 1 Then
		DAOCkill()
		quit('other client is down, quitting this client too')
	EndIf
	WinActivate($sDAoCWindowTitle)
	WinWaitActive($sDAoCWindowTitle, '', 10)
	Local $array = WinGetClientSize($sDAoCWindowTitle)
	If IsArray($array) == 1 Then
		If ($array[0] == 800 And $array[1] == 600) Then
;~ 			toLogFiles('va tutto bene')
		Else
			toLogFiles('the DAOC''s client has gone Link Death')
			DAOCkill()
			quit('Link Death')
		EndIf
	Else
		toLogFiles('can''t find an active DAOC''s client')
		quit('General Client Error')
	EndIf

EndFunc

Func preQuit()
	quit('user')
EndFunc

Func quit($sMessage = '')
	toLogFiles('script terminated due to: ' & $sMessage)
;~ 	If $bChat Then chatLoggingStop()
	IniWrite($sLocalIniFile, 'main', 'key', 1)
	Exit
EndFunc

Func pause()
	If $bPause == False Then
		$bPause = True
		$sTitle = "Macro Paused"
		toLogFiles('script paused')
	Else
		$bPause = False
		$sTitle = "Macro Activated"
		toLogFiles('script resumed')
	EndIf
EndFunc