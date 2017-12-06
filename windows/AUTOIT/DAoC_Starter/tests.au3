#include <GUIConstants.au3>
#include <_ControlHover.au3>
Const $HTCAPTION = 2
Const $WM_NCLBUTTONDOWN = 0xA1
Opt("GUIOnEventMode",1)
$formtitle = ""
$Form1 = GUICreate($formtitle, 271, 154, 239, 132);, $WS_POPUPWINDOW)
GUISetBkColor (0x292929)
$Label1 = GUICtrlCreateLabel("Title", 8, 0, 17, 17)
GUICtrlSetColor(-1, 0xeedd82)
GUICtrlSetFont (-1,12, 800, 2, "Arial")
$Label2 = GUICtrlCreateLabel(" _", 235, 0, 17, 17)
GUICtrlSetColor(-1, 0xeedd82)
GUICtrlSetFont (-1,12, 800, Default, "Arial")
$Label3 = GUICtrlCreateLabel("X", 255, 0, 43, 17)
GUICtrlSetColor(-1, 0xeedd82)
GUICtrlSetFont (-1,12, 800, Default, "Arial")
GUISetOnEvent ($GUI_EVENT_CLOSE, "Quit" )
GUISetOnEvent ($GUI_EVENT_PRIMARYDOWN, "Drag" )
GUICtrlSetOnEvent($Label2, "_minimize")
GUICtrlSetOnEvent($Label3, "Quit")
GUISetState(@SW_SHOW)

_ControlHover(2, "", $Label2)
_ControlHover(2, "", $Label3)


While 1

    Sleep(10)
    $Over = _ControlHover(0, $Form1)
        If $Over = 1 Then

            If @extended = $Label2 Then
                GUICtrlSetBkColor($Label2, 0xF7F721)
            Else
                If @extended = $Label3 Then
                    GUICtrlSetBkColor($Label3, 0xFF0000)
                Else
                    GUICtrlSetBkColor($Label3, 0x000000)
                    GUICtrlSetBkColor($Label2, 0x000000)
                    EndIf
            EndIf


        EndIf

WEnd
func _minimize ()
    GUISetState(@SW_MINIMIZE)
EndFunc

Func Drag()
    dllcall("user32.dll","int","SendMessage","hWnd", $Form1,"int",$WM_NCLBUTTONDOWN,"int", $HTCAPTION,"int", 0)
EndFunc

Func Quit()
    Exit
EndFunc