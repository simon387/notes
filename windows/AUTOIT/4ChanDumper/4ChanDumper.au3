#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icon.ico
#AutoIt3Wrapper_Compression=4
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "HTTP_edited.au3"

Global Const $title = "4ChanDumper 1.0.0 by Rayvaughan - simon387@hotmail.it"
$Form1 = GUICreate($title, 442, 143, -1, -1)
$Group_1 = GUICtrlCreateGroup("Step 1: Choose destination folder", 7, 8, 427, 48, 0x300)
$Label_1 = GUICtrlCreateLabel(@ScriptDir, 100, 30, 328, 17)
$Button_select = GUICtrlCreateButton("Change", 15, 24, 75, 25)
$Group_2 = GUICtrlCreateGroup("Step 2: Choose section and pages range", 7, 65, 250, 48, 0x300)
$Combo_section = GUICtrlCreateCombo("", 56, 85, 42, 25, 67)
GUICtrlSetData(-1, "3|a|adv|an|b|c|cgl|ck|cm|co|d|e|fa|fit|g|gif|h|hr|int|jp|k|lit|m|mu|n|new|o|p|po|r|r9k|s|sci|sp|t|tg|toy|trv|tv|u|v|vp|w|wg|x|y", "b")
$Label_2 = GUICtrlCreateLabel("from", 104, 89, 24, 17)
$Combo_from = GUICtrlCreateCombo("", 129, 85, 42, 25, 67)
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15", "0")
$Label_3 = GUICtrlCreateLabel("to", 183, 89, 13, 17)
$Combo_to = GUICtrlCreateCombo("", 201, 85, 42, 25, 67)
GUICtrlSetData(-1, "15|14|13|12|11|10|9|8|7|6|5|4|3|2|1|0", "15")
$Label_4 = GUICtrlCreateLabel("section", 16, 89, 38, 17)
$Group_3 = GUICtrlCreateGroup("Step 3: Starting the process", 267, 65, 167, 48, 0x300)
$Button_start = GUICtrlCreateButton("Start", 275, 83, 75, 25)
$Label_5 = GUICtrlCreateLabel("Welcome to 4ChanDumper", 7, 120, 427, 21, 2177)
GUISetState(@SW_SHOW)
$Progress1 = GUICtrlCreateProgress(7, 25, 427, 17)
GUICtrlSetState(-1, 32)
$Progress2 = GUICtrlCreateProgress(7, 62, 427, 17)
GUICtrlSetState(-1, 32)
$Progress3 = GUICtrlCreateProgress(7, 98, 427, 17)
GUICtrlSetState(-1, 32)
$Label_6 = GUICtrlCreateLabel("", 8, 8, 430, 17, 0x1)
GUICtrlSetState(-1, 32)
$Label_7 = GUICtrlCreateLabel("", 8, 45, 430, 17, 0x1)
GUICtrlSetState(-1, 32)
$Label_8 = GUICtrlCreateLabel("", 8, 81, 430, 17, 0x1)
GUICtrlSetState(-1, 32)

Global Const $host = "boards.4chan.org"
Global Const $smd = 16
Global $range[2]
Global $stop = False
Global $c = 0
Opt("GUIOnEventMode", 1)
HotKeySet("!{ESC}", "Stop")
GUICtrlSetOnEvent($Button_select, "SelectPath")
GUICtrlSetOnEvent($Combo_section, "SelectSection")
GUICtrlSetOnEvent($Combo_from, "SelectFrom")
GUICtrlSetOnEvent($Combo_to, "SelectTo")
GUICtrlSetOnEvent($Button_start, "Start")
GUISetOnEvent(-3, "Close")

While 1
	Sleep(1000)
WEnd

Func ReturnMainView()
	GUICtrlSetData($Label_5, "Operation terminated")
	Switcher(16, 32)
EndFunc

Func Stop()
	If GUICtrlGetState($Progress1) == 96 Then Return
	$stop = True
	GUICtrlSetData($Label_6, "Aborting")
	GUICtrlSetData($Label_7, "Aborting")
	GUICtrlSetData($Label_8, "Aborting")
	For $c0 = $c To 0 Step -1
		GUICtrlSetData($Progress1, 100 - InetGetInfo() / $smd * 100)
		GUICtrlSetData($Progress2, 100 - InetGetInfo() / $smd * 100)
		GUICtrlSetData($Progress3, 100 - InetGetInfo() / $smd * 100)
		If InetGetInfo() == 0 Then ExitLoop
		InetClose($c0)
		GUICtrlSetData($Label_5, "Stopping, still closing " & InetGetInfo() & " files")
	Next
	ReturnMainView()
EndFunc

Func Start()
	GUICtrlSetData($Label_5, "Downloading - HIT ALT+ESC TO ABORT")
	GUICtrlSetData($Label_6, "?")
	GUICtrlSetData($Label_7, "?")
	GUICtrlSetData($Label_8, "?")
	Switcher(32, 16)
	$c = 0
	$stop = False;$section = GUICtrlRead($Combo_section)
	$page = "/" & GUICtrlRead($Combo_section) & "/"
	$dld = GUICtrlRead($Label_1) & "\Download\"
	DirCreate($dld)
	$range[0] = GUICtrlRead($Combo_from)
	$range[1] = GUICtrlRead($Combo_to)
	For $c0 = $range[0] To $range[1]
		If $stop == True Then ExitLoop
		If $c0 == 0 Then
			$string = ""
		Else
			$string = $c0
		EndIf
		GUICtrlSetData($Label_6, "Connecting to " & $host)
		GUICtrlSetData($Progress1, 100 * $c0 / ($range[1] - $range[0]))
		$socket = TCPConnect(TCPNameToIP($host), 80)
		If $socket == -1 Then
			GUICtrlSetData($Label_5, "Unable to connect to " & $host)
			ExitLoop
		EndIf
		GUICtrlSetData($Label_6, "Downloading from page " & $host & $page & $string & " (" & $c0 & "/" & $range[1] - $range[0] & ")")
		TCPSend($socket, "GET " & $page & $string & " HTTP/1.1" & @CRLF & "Host: " & $host & @CRLF & "User-Agent: n/a" & @CRLF & "Connection: close" & @CRLF & "" & @CRLF)
		$body = _HTTPRead($socket)
		TCPCloseSocket($socket)
		If @error == 0 Then
			$a0 = StringRegExp($body, '<a href="res/(\d*?)">', 3)
			$u1 = UBound($a0) - 1
			for $c1 = 0 To $u1
				If $stop == True Then ExitLoop 2
				GUICtrlSetData($Label_7, "Connecting to " & $host)
				GUICtrlSetData($Progress2, 100 * $c1 / $u1)
				$socket = TCPConnect(TCPNameToIP($host), 80)
				If $socket == -1 Then
					GUICtrlSetData($Label_5, "Unable to connect to " & $host)
					ExitLoop
				EndIf
				GUICtrlSetData($Label_7, "Downloading from thread " & $host & $page & "res/" & $a0[$c1] & " (" & $c1 & "/" & $u1 & ")")
				TCPSend($socket, "GET " & $page & "res/" & $a0[$c1] & " HTTP/1.1" & @CRLF & "Host: " & $host & @CRLF & "User-Agent: n/a" & @CRLF & "Connection: close" & @CRLF & "" & @CRLF)
				$body = _HTTPRead($socket)
				TCPCloseSocket($socket)
				If @error == 0 Then
					$a1 = StringRegExp($body, '<a href="http://images.4chan.org' & $page & 'src/(\d*?.\w*)" target=_blank><img', 3)
					$u2 = UBound($a1) - 1
					For $c2 = 0 To $u2
						If $stop == True Then ExitLoop 3
						GUICtrlSetData($Progress3, 100 * $c2 / $u2)
						GUICtrlSetData($Label_8, "Downloading http://images.4chan.org" & $page & "src/" & $a1[$c2] & " (" & $c2 & "/" & $u2 & ")")
						InetGet("http://images.4chan.org" & $page & "src/" & $a1[$c2], $dld & $a1[$c2], 0, 1);0get from cache, 1 //
						$c += 1
						While InetGetInfo() >= $smd
							If $stop == True Then ExitLoop 4
							Sleep(1000);GUICtrlSetData($Label_8, "Pausing, simultaneous downloads: " & InetGetInfo())
						WEnd
					Next
				Else
					GUICtrlSetData($Label_5, "HTTPread failed")
					ExitLoop
				EndIf
			Next
		Else
			GUICtrlSetData($Label_5, "HTTPread failed")
			ExitLoop
		EndIf
	Next
	ReturnMainView()
EndFunc

Func SelectPath()
	$path = FileSelectFolder("Select destination folder", Default, 7, @ScriptDir, $Form1)
	If $path <> "" Then
		GUICtrlSetData($Label_1, $path)
		GUICtrlSetData($Label_5, "New destination folder: " & $path)
	EndIf
EndFunc

Func SelectSection()
	GUICtrlSetData($Label_5, "Selected the section: " & GUICtrlRead($Combo_section))
EndFunc

Func SelectFrom()
	If Int(GUICtrlRead($Combo_from)) > Int(GUICtrlRead($Combo_to)) Then GUICtrlSetData($Combo_from, GUICtrlRead($Combo_to), GUICtrlRead($Combo_to))
	GUICtrlSetData($Label_5, "Page range setted from " & GUICtrlRead($Combo_from) & "  to " & GUICtrlRead($Combo_to))
EndFunc

Func SelectTo()
	If Int(GUICtrlRead($Combo_to)) < Int(GUICtrlRead($Combo_from)) Then	GUICtrlSetData($Combo_to, GUICtrlRead($Combo_from), GUICtrlRead($Combo_from))
	GUICtrlSetData($Label_5, "Page range setted from " & GUICtrlRead($Combo_from) & "  to " & GUICtrlRead($Combo_to))
EndFunc

Func Close()
	Exit
EndFunc

Func Switcher($c0, $c1)
	GUICtrlSetState($Group_1, $c0)
	GUICtrlSetState($Label_1, $c0)
	GUICtrlSetState($Button_select, $c0)
	GUICtrlSetState($Group_2, $c0)
	GUICtrlSetState($Combo_section, $c0)
	GUICtrlSetState($Label_2, $c0)
	GUICtrlSetState($Combo_from, $c0)
	GUICtrlSetState($Label_3, $c0)
	GUICtrlSetState($Combo_to, $c0)
	GUICtrlSetState($Label_4, $c0)
	GUICtrlSetState($Group_3, $c0)
	GUICtrlSetState($Button_start, $c0)
	GUICtrlSetState($Progress1, $c1)
	GUICtrlSetState($Label_6, $c1)
	GUICtrlSetState($Progress2, $c1)
	GUICtrlSetState($Label_7, $c1)
	GUICtrlSetState($Progress3, $c1)
	GUICtrlSetState($Label_8, $c1)
	GUICtrlSetData($Progress1, 0)
	GUICtrlSetData($Progress2, 0)
	GUICtrlSetData($Progress3, 0)
EndFunc