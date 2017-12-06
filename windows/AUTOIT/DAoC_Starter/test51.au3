#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

;WinSetOnTop('1157:413 - Building a Simple User Interface | Android Developers - Opera', '', -1)

;ConsoleWrite(BitOR($GUI_SS_DEFAULT_INPUT,$ES_WANTRETURN))

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\simone\dropbox\autoit\daoc_starter\chars_form.kxf
$Form2 = GUICreate("Characters Database Editor", 499, 202, 248, 176)
$List_account = GUICtrlCreateList("", 8, 5, 139, 188)
$Label1 = GUICtrlCreateLabel("Name", 168, 7, 32, 17)
$Label2 = GUICtrlCreateLabel("Server", 168, 48, 35, 17)
$Label3 = GUICtrlCreateLabel("Server IP", 312, 48, 48, 17)
$Label4 = GUICtrlCreateLabel("Port", 408, 48, 23, 17)
$Label5 = GUICtrlCreateLabel("ID", 456, 48, 15, 17)
$Label6 = GUICtrlCreateLabel("Realm", 240, 48, 34, 17)
$Label7 = GUICtrlCreateLabel("Account", 312, 7, 44, 17)
$name = GUICtrlCreateInput("", 168, 24, 137, 21)
$account = GUICtrlCreateCombo("", 312, 24, 169, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
$server = GUICtrlCreateCombo("", 168, 65, 65, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL,$CBS_SORT))
GUICtrlSetData(-1, "Custom|Ywain1|Ywain10|Ywain2|Ywain3|Ywain4|Ywain5|Ywain6|Ywain7|Ywain8|Ywain9", "Ywain1")
$realm = GUICtrlCreateCombo("", 240, 65, 65, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL,$CBS_SORT))
GUICtrlSetData(-1, "Albion|Hibernia|Midgard", "Albion")
$ipppp = GUICtrlCreateInput("", 312, 65, 89, 21)
$porta = GUICtrlCreateInput("", 408, 65, 41, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
$idddd = GUICtrlCreateInput("", 456, 66, 25, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
$Button_remove = GUICtrlCreateButton("Delete", 160, 168, 99, 25)
$Button_edit = GUICtrlCreateButton("Save data", 271, 168, 99, 25)
$Button_add = GUICtrlCreateButton("Add new", 382, 168, 99, 25)
$Group1 = GUICtrlCreateGroup("Optional", 160, 96, 321, 65)
$Resolution = GUICtrlCreateLabel("Resolution", 314, 110, 54, 17)
$Class = GUICtrlCreateLabel("Class", 278, 110, 29, 17)
$Combo2class = GUICtrlCreateCombo("", 168, 127, 137, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
$Combo1res = GUICtrlCreateCombo("", 314, 127, 81, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
$Fullscreen = GUICtrlCreateCheckbox("Fullscreen", 400, 129, 73, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Fullscreen
			MsgBox('', '', GUICtrlRead($Fullscreen))
	EndSwitch
WEnd
