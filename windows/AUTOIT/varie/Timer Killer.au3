#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=..\ICO\HP-Monitor.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_LegalCopyright=Creato da Simone Celia, Simon387@hotmail.it
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Global $ore = 0
Global $minuti = 0
Global $secondi = 0
Global $flag = False
HotKeySet("{ESC}", "annulla")

#Region ### START Koda GUI section ### Form=D:\AUTOIT\perGora\Timer Killer.kxf
$Form_1 = GUICreate("Timer Killer", 276, 123, -1, -1, -1, BitOR($WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
$Button_1 = GUICtrlCreateButton("Chiudi il PC tra 0 ore 0 minuti e 0 secondi", 8, 32, 257, 25, 0)
$Progress_1 = GUICtrlCreateProgress(8, 64, 257, 25)
$Label_1 = GUICtrlCreateLabel("Ore", 12, 8, 21, 17)
$Label_2 = GUICtrlCreateLabel("Minuti", 98, 8, 32, 17)
$Label_3 = GUICtrlCreateLabel("Secondi", 184, 8, 43, 17)
$Input_ore = GUICtrlCreateInput("0", 40, 5, 33, 21, BitOR($ES_CENTER,$ES_AUTOHSCROLL,$ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$Input_minuti = GUICtrlCreateInput("0", 134, 5, 33, 21, BitOR($ES_CENTER,$ES_AUTOHSCROLL,$ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$Input_secondi = GUICtrlCreateInput("0", 230, 5, 33, 21, BitOR($ES_CENTER,$ES_AUTOHSCROLL,$ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$Checkbox_primo = GUICtrlCreateCheckbox("Sempre in primo piano", 8, 96, 153, 17)
$Checkbox_tipo = GUICtrlCreateCheckbox("Spegni alle...", 168, 96, 97, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

;MsgBox(0,"",$WS_EX_TOPMOST)
;~ GUISetStyle($Form_1, BitOR($WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Input_ore
			If GUICtrlRead($Input_ore) == "" Then GUICtrlSetData($Input_ore, 0)
			$ore = GUICtrlRead($Input_ore)
			refresh()
		Case $Input_minuti
			If GUICtrlRead($Input_minuti) > 60 Or GUICtrlRead($Input_minuti) == "" Then GUICtrlSetData($Input_minuti, 0)
			$minuti = GUICtrlRead($Input_minuti)
			refresh()
		Case $Input_secondi
			If GUICtrlRead($Input_secondi) > 60 Or GUICtrlRead($Input_secondi) == "" Then GUICtrlSetData($Input_secondi, 0)
			$secondi = GUICtrlRead($Input_secondi)
			refresh()
		Case $Button_1
			GUICtrlSetState($Input_ore, $GUI_DISABLE)
			GUICtrlSetState($Input_minuti, $GUI_DISABLE)
			GUICtrlSetState($Input_secondi, $GUI_DISABLE)
			GUICtrlSetState($Button_1, $GUI_DISABLE)
			timer()
			GUICtrlSetState($Input_ore, $GUI_ENABLE)
			GUICtrlSetState($Input_minuti, $GUI_ENABLE)
			GUICtrlSetState($Input_secondi, $GUI_ENABLE)
			GUICtrlSetState($Button_1, $GUI_ENABLE)
			refresh()
			refresh2()
			GUICtrlSetData($Progress_1, 0)
	EndSwitch
WEnd

Func refresh()
	GUICtrlSetData($Button_1, "Chiudi il PC tra "&$ore&" ore "&$minuti&" minuti e "&$secondi&" secondi")
EndFunc

Func refresh2()
	GUICtrlSetData($Input_ore, $ore)
	GUICtrlSetData($Input_minuti, $minuti)
	GUICtrlSetData($Input_secondi, $secondi)
EndFunc

Func Sec2Time($nr_sec)
   $ore = Int($nr_sec / 3600)
   $minuti = Int(($nr_sec - $ore * 3600) / 60)
   $secondi = $nr_sec - $ore * 3600 - $minuti * 60
   Return StringFormat('%02d:%02d:%02d', $ore, $minuti, $secondi)
EndFunc

Func annulla()
	$flag = true
EndFunc

Func timer()
	$sec = $secondi + $minuti * 60 + $ore * 3600
	$begin = TimerInit()
	$Count = 0
	While $sec > $Count And $flag == False
		$dif = TimerDiff($begin)
		$Count = int($dif / 1000)
		$rev = $sec - $Count
		GUICtrlSetData($Button_1, "ShutDown tra: "&Sec2Time($rev)&" <Esc> per annullare")
		GUICtrlSetData($Progress_1, Int($Count * 100 / $sec))
		refresh2()
		Sleep(100)
	WEnd
	If $flag == True Then
		$flag = False
	Else
		Shutdown(29)
	EndIf
EndFunc