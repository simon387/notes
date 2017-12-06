#NoTrayIcon;(0.9 * Abilità * Motivazione / 100) + (Esperienza / 8);8321=BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER));10369=BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_READONLY,$ES_NUMBER));#include <EditConstants.au3>;#include <GUIConstantsEx.au3>;#include <WindowsConstants.au3>
Local $a[9] = [GUICreate("Staff", 259, 83, -1, -1), GUICtrlCreateInput('', 200, 16, 49, 21, 10369), GUICtrlCreateInput('', 8, 16, 49, 21, 8321), GUICtrlCreateInput('', 72, 16, 49, 21, 8321), GUICtrlCreateInput('', 136, 16, 49, 21, 8321), GUICtrlCreateInput('', 200, 48, 49, 21, 10369), GUICtrlCreateInput('', 8, 48, 49, 21, 8321), GUICtrlCreateInput('', 72, 48, 49, 21, 8321), GUICtrlCreateInput('', 136, 48, 49, 21, 8321)]
GUISetState(@SW_SHOW)
While True;$nMsg = GUIGetMsg()
	Switch GUIGetMsg();$nMsg
		Case -3;$GUI_EVENT_CLOSE
			Exit
		Case Else
			GUICtrlSetData($a[1], (0.9 * GUICtrlRead($a[2]) * GUICtrlRead($a[3]) / 100) + (GUICtrlRead($a[4]) / 8))
			GUICtrlSetData($a[5], (0.9 * GUICtrlRead($a[6]) * GUICtrlRead($a[7]) / 100) + (GUICtrlRead($a[8]) / 8))
	EndSwitch
WEnd