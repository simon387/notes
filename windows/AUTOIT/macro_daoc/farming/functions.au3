#cs ----------------------------------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Simone Celia

 Script Function:
	Farming plats with pbaoe + blockbot from different (virtual)PCs with CSR-check

 Instructions:
	In-game commands: MUST be setted in /keyboard: L - log file, F - replay, R - reset camera (optional)
	Game MUST run in 800x600 resolution, window mode, never minimized, only 1 client allowed
	Scriptdir MUST be shared via DropBox or other similar software
	p pause q quit

#ce ----------------------------------------------------------------------------------------------------

Global Const $sDAoCWindowTitle = 'Dark Age of Camelot © 2001-2012 Electronic Arts Inc. All Rights Reserved.'
Global Const $sGlobalLogFile = @ScriptDir & '\G_log.txt'
Global Const $sLocalLogFile = @DesktopDir & '\L_log.txt'
Global Const $sIniFile = @ScriptDir & '\buffer.ini'
Global Const $cLogKey = 'l'
Global Const $cReplayKey = 'f'
Global Const $sDAOClogFile = @MyDocumentsDir & '\Electronic Arts\Dark Age of Camelot\chat.log'
Global Const $sLocalIniFile = 'c:\trafficlight.ini'

;~ Global $bChat = False

Func DAOCanswer()
	Sleep(1000)
	If DAOCsend($cReplayKey) == 0 Then
		toLocalLogFile('impossible to replay')
		return 0
	Else
		toLocalLogFile('answering to sends')
		DAOCsend('ma cosa dici? sto quittando cmq')
		Sleep(199)
		DAOCsend('{ENTER}')
		DAOCkill()
		IniWrite($sIniFile, 'main', 'last', '')
		Return 1
	EndIf
EndFunc

Func DAOCkill()
;~
;~ 	Return
;~
	While ProcessExists("game.dll") + ProcessExists("login.dll") <> 0
		ProcessClose("game.dll")
		ProcessClose("login.dll")
	WEnd
	toLogFiles('DAOC''s client terminated')
	IniWrite($sIniFile, 'main', 'toQuit', 1)
	IniWrite($sLocalIniFile, 'main', 'key', 1)
EndFunc

Func chatLoggingStart()
	If DAOCsend($cLogKey) == 0 Then
		toLocalLogFile('impossible to start the chat logging')
		Return 0
	Else
		toLocalLogFile('chat logging enabled')
;~ 		$bChat = True
		Return 1
	EndIf
EndFunc

Func chatLoggingStop()
	If DAOCsend($cLogKey) == 0 Then
		toLocalLogFile('impossible to stop the chat logging')
		Return 0
	Else
		toLocalLogFile('chat logging disabled')
;~ 		$bChat = False
		Return 1
	EndIf
EndFunc

Func DAOCsend($sKey)
	If WinExists($sDAoCWindowTitle) == 0 Then
		toLocalLogFile('impossible to send the key "' & $sKey & '", DAOC''s window not found')
		Return 0
	Else
		WinActivate($sDAoCWindowTitle)
		WinWaitActive($sDAoCWindowTitle, '', 10)
		send($sKey)
;~ 		toLocalLogFile('the key "' & $sKey & '", has been sent to the DAOC''s window')
		Return 1
	EndIf
EndFunc

Func timestamp()
	Return @HOUR & ":" & @MIN & ":" & @SEC
EndFunc

Func elapsed($s)
	Local $i = TimerDiff($s) / 1000
	Return StringFormat("%02d:%02d:%02d", $i / 3600, Mod(($i / 60), 60), Mod($i, 60))
EndFunc

Func toGlobalLogFile($s)
	Local $hfile = FileOpen($sGlobalLogFile, 1)
	FileWriteLine($hfile, '[' & @ComputerName & '][' & @MDAY & '/' & @MON & '/' & @YEAR & '][' & timestamp() & '] : ' & $s)
	FileClose($hfile)
EndFunc

Func toLocalLogFile($s)
	Local $hfile = FileOpen($sLocalLogFile, 1)
	FileWriteLine($hfile, '[' & @ComputerName & '][' & @MDAY & '/' & @MON & '/' & @YEAR & '][' & timestamp() & '] : ' & $s)
	FileClose($hfile)
	ConsoleWrite(@CRLF & '[' & @ComputerName & '][' & @MDAY & '/' & @MON & '/' & @YEAR & '][' & timestamp() & '] : ' & $s)
EndFunc

Func toLogFiles($s)
	toGlobalLogFile($s)
	toLocalLogFile($s)
EndFunc