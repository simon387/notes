#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Simone\Dropbox\AUTOIT\jap\ktf\insert.kxf
$form_main = GUICreate("Form1", 373, 205, 367, 342)
GUICtrlCreateLabel("italiano", 32, 24, 37, 17)
GUICtrlCreateLabel("giapponese", 192, 24, 59, 17)
$Input_ita_t = GUICtrlCreateInput("", 32, 56, 121, 21)
$Input_gia_t = GUICtrlCreateInput("", 192, 56, 121, 21)
$Input_ita_m = GUICtrlCreateInput("", 32, 88, 121, 21)
$Input_gia_m = GUICtrlCreateInput("", 192, 88, 121, 21)
$Button_ins = GUICtrlCreateButton("insert", 32, 120, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Opt('GUIOnEventMode', 1)
GUISetOnEvent($GUI_EVENT_CLOSE, "close_clicked", $form_main)
GUICtrlSetOnEvent($Button_ins, "button_ins_clicked")
Local $aAccelKeys[1][2] = [["{enter}", $Button_ins]]
GUISetAccelerators($aAccelKeys)

While 1
	Sleep(4299)
WEnd

Func button_ins_clicked()
	$ita_t = GUICtrlRead($Input_ita_t)
	$ita_m = GUICtrlRead($Input_ita_m)
	$gia_t = GUICtrlRead($Input_gia_t)
	$gia_t = GUICtrlRead($Input_gia_m)
EndFunc

Func close_clicked()
	Exit
EndFunc