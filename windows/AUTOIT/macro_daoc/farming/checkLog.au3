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

; Script Start - Add your code below here
;~ #NoTrayIcon
#include <functions.au3>

;~ MsgBox(0,0,0)
Sleep(2000)
;~ While ProcessExists('main.exe') <> 0

While IniRead($sLocalIniFile, 'main', 'key', 0) == 1
	;$aProcess = ProcessList('autoit3.exe')	If $aProcess[0][0] <> 2 Then ExitLoop
	chatLoggingStart()
	Sleep(30000)
	chatLoggingStop()

	Local $hFile = FileOpen($sDAOClogFile, 0)

	While 1
		Local $line = FileReadLine($hFile)
		If @error = -1 Then ExitLoop

		; controllo su death
		If StringInStr($line, '',) Then

		EndIf

		; controllo sui send
		if StringInStr($line, '@@') <> 0 Then
			Local $array
			If ($array[3] == 'sends,' Or $array[3] == 'says,') Then
				$line = StringReplace($array[2], '@@', '')
				ConsoleWrite(@CRLF & $line)
				IniWrite($sIniFile, 'main', 'last', $line)
			EndIf
		EndIf
	WEnd

	FileClose($hFile)
	$hFile = FileOpen($sDAOClogFile, 2)
	FileWrite($hFile, @CRLF)
	FileClose($hFile)
WEnd