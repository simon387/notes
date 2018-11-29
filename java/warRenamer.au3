;RENAME WAR FILE IN CURRENT DIRECTORY, ADDING 'A' TO THE END
#NoTrayIcon

#include <File.au3>
#include <FileConstants.au3>

$aFileList = _FileListToArray ( @ScriptDir, "*.war",  $FLTA_FILES, True)

;~ _ArrayDisplay($aFileList, "$aFileList")

If IsArray($aFileList) Then
   For $i = 1 to $aFileList[0]
;~ 	  ConsoleWrite($aFileList[$i] & @LF)
	  FileMove($aFileList[$i], $aFileList[$i] & "A", $FC_OVERWRITE + $FC_CREATEPATH)
   Next
EndIf
