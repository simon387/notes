; #INDEX# =======================================================================================================================
; Title .........: removeEverythingButAu3
; AutoIt Version : 3.3.14.5
; Description ...: remove all files in current directory but Autoit scripts
; Author(s) .....: Simone Celia
; ===============================================================================================================================

#NoTrayIcon

#include <File.au3>
#include <FileConstants.au3>

#Region Global Variables and Constants

Global Const $AU3_EXTENSION = ".au3"

#EndRegion Global Variables and Constants

removeFilesButAutoitScript()

#Region Functions list

; #FUNCTION# ====================================================================================================================
; Author ........: Simone Celia
; Modified.......: Simone Celia
; ===============================================================================================================================
Func removeFilesButAutoitScript()
	Local $aFileList = _FileListToArray (@ScriptDir, Default, $FLTA_FILES, True)
	If IsArray($aFileList) Then
		For $i = 1 to $aFileList[0]
			If StringRight($aFileList[$i], StringLen($AU3_EXTENSION)) <> $AU3_EXTENSION Then
				FileDelete($aFileList[$i])
			EndIf
		Next
	EndIf
EndFunc

#EndRegion Functions list
