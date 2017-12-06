#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Simone\Dropbox\AUTOIT\DAoC_Starter\Form_reverse.kxf
$Form1 = GUICreate("Form1", 256, 340, -1, -1)
Dim $input[9] = [ _
GUICtrlCreateInput("", 8, 8, 233, 21), _
GUICtrlCreateInput("", 8, 40, 233, 21), _
GUICtrlCreateInput("", 8, 72, 233, 21), _
GUICtrlCreateInput("", 8, 104, 233, 21), _
GUICtrlCreateInput("", 8, 136, 233, 21), _
GUICtrlCreateInput("", 8, 168, 233, 21), _
GUICtrlCreateInput("", 8, 200, 233, 21), _
GUICtrlCreateInput("", 8, 232, 233, 21), _
GUICtrlCreateInput("", 8, 264, 233, 21)]
$Button1 = GUICtrlCreateButton("Button1", 8, 296, 97, 25)
;$Button2 = GUICtrlCreateButton("Button2", 120, 296, 97, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global Const $iniFile = @ScriptDir & '\reverse_i.ini'
Global $aData[9]
Global $bData[8]
init()
HotKeySet('{esc}', 'interrupt')
Opt('SendKeyDelay', 0)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $input[0]
			IniWrite($iniFile, 'data', 0, GUICtrlRead($input[0]))
		Case $input[1]
			IniWrite($iniFile, 'data', 1, GUICtrlRead($input[1]))
		Case $input[2]
			IniWrite($iniFile, 'data', 2, GUICtrlRead($input[2]))
		Case $input[3]
			IniWrite($iniFile, 'data', 3, GUICtrlRead($input[3]))
		Case $input[4]
			IniWrite($iniFile, 'data', 4, GUICtrlRead($input[4]))
		Case $input[5]
			IniWrite($iniFile, 'data', 5, GUICtrlRead($input[5]))
		Case $input[6]
			IniWrite($iniFile, 'data', 6, GUICtrlRead($input[6]))
		Case $input[7]
			IniWrite($iniFile, 'data', 7, GUICtrlRead($input[7]))
		Case $input[8]
			IniWrite($iniFile, 'data', 8, GUICtrlRead($input[8]))
		Case $Button1
			set()
			try()
		;Case $Button2
	EndSwitch
WEnd

Func try()
	$title = 'Amministratore: C:\Windows\System32\cmd.exe'
	ShellExecute('cmd')
	WinActivate($title)
	WinWaitActive($title, '', 3)
	While True
		Send('login.dll ' & miscelatore() & '{enter}')
	WEnd
	;Send('')
	;ShellExecute($aData[0], $aData[1]&' '&$aData[2]&' '&$aData[3]&' '&$aData[4]&' '&$aData[5]&' '&$aData[6]&' '&$aData[7]&' '&$aData[8]);,
EndFunc

Func miscelatore()
	Local $aR[8]
	For $i = 0 To 7
		$aR[$i] = Random(0, 7, 1)
	Next
	Return $bData[$aR[0]] & ' ' & $bData[$aR[1]] & ' ' & $bData[$aR[2]] & ' ' & $bData[$aR[3]] & ' ' & $bData[$aR[4]] & ' ' & $bData[$aR[5]] & ' ' & $bData[$aR[6]] & ' ' & $bData[$aR[7]]
EndFunc

Func set()
	For $i = 0 To 8
		$aData[$i] = GUICtrlRead($input[$i])
	Next
	$bData[0] = $aData[1]
	$bData[1] = $aData[2]
	$bData[2] = $aData[3]
	$bData[3] = $aData[4]
	$bData[4] = $aData[5]
	$bData[5] = $aData[6]
	$bData[6] = $aData[7]
	$bData[7] = $aData[8]
EndFunc

Func interrupt()
	Exit
EndFunc

Func init()
	Local $array = IniReadSection($iniFile, 'data')
	If IsArray($array) == 1 Then
		For $i = 0 To $array[0][0] - 1
			GUICtrlSetData($input[$i], $array[$i + 1][1], '')
		Next
	EndIf
EndFunc