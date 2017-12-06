#NoTrayIcon
#include <GuiConstantsEx.au3>
#include <Constants.au3>
#include <WindowsConstants.au3>

Opt("TrayOnEventMode",1)
Opt("TrayMenuMode",1)

TraySetOnEvent($TRAY_EVENT_PRIMARYUP,"SpecialEvent")
;TraySetState(2) ; hide --> not needed

GuiCreate("MyGUI", 392, 316,-1, -1 , BitOR($WS_OVERLAPPEDWINDOW, $WS_CLIPSIBLINGS))
GuiSetState()

While 1
    $msg = GuiGetMsg()

    Select
        Case $msg = $GUI_EVENT_MINIMIZE
            GuiSetState(@SW_HIDE)
            TraySetState(1) ; show
            TraySetToolTip ("My app - click here to restore")

        Case $msg = $GUI_EVENT_CLOSE
            ExitLoop
    EndSelect
WEnd

Func SpecialEvent()
    GuiSetState(@SW_Show)
    TraySetState(2) ; hide
EndFunc