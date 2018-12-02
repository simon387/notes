; #INDEX# =======================================================================================================================
; Title .........: warRenamer
; AutoIt Version : 3.3.14.5
; Description ...: rename .war files on current directory
; Author(s) .....: Simone Celia
; ===============================================================================================================================

#NoTrayIcon

#include <File.au3>
#include <FileConstants.au3>

#Region Global Variables and Constants

Global Const $WAR_EXTENSION = "*.war"
Global Const $APPEND_STRING = "A"

#EndRegion Global Variables and Constants

renameWarFiles()

#Region Functions list

; #FUNCTION# ====================================================================================================================
; Author ........: Simone Celia
; Modified.......: Simone Celia
; ===============================================================================================================================
Func renameWarFiles()
	Local $aFileList = _FileListToArray (@ScriptDir, $WAR_EXTENSION, $FLTA_FILES, True)

;~ _ArrayDisplay($aFileList, "$aFileList")

	If IsArray($aFileList) Then
		For $i = 1 to $aFileList[0]
;~ 	  ConsoleWrite($aFileList[$i] & @LF)
			FileMove($aFileList[$i], $aFileList[$i] & $APPEND_STRING, $FC_NOOVERWRITE  + $FC_CREATEPATH)
		Next
	EndIf
EndFunc

#EndRegion Functions list
