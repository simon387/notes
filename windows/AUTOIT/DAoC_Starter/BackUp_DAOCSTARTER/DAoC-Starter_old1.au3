#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=i.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <libs.au3>; 1 cripta; 0 decripta

_Singleton("DAoC-Starter.au3")
Global Const $title = "DAoC Starter 3.1.1"
Global $path = @AppDataDir & "\Electronic Arts\Dark Age of Camelot\LotM"
Global $userdotdat = $path & "\user.dat"
Global $array = ""
Global $mega
Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 1)
Opt("GUIOnEventMode", 1)

#Region ### START Koda GUI section ### Form=d:\AUTOIT\daoc_starter\form1.kxf
$Form1 = GUICreate($title, 332, 115, IniRead($userdotdat, "zmain", "coo1", -1), IniRead($userdotdat, "zmain", "coo2", -1))
$MenuItem_settings = GUICtrlCreateMenu("&Settings")
$MenuItem_servermode = GUICtrlCreateMenu("Server mode", $MenuItem_settings)
$MenuItem_official = GUICtrlCreateMenuItem("Official", $MenuItem_servermode, -1 , 1)
GUICtrlSetState(-1, $GUI_CHECKED)
$MenuItem_shard = GUICtrlCreateMenuItem("Shard", $MenuItem_servermode, -1 , 1)
$MenuItem_optionofficial = GUICtrlCreateMenu("Official server options", $MenuItem_settings)
$MenuItem_editofficialpath = GUICtrlCreateMenuItem("Edit client path", $MenuItem_optionofficial)
$MenuItem_patch = GUICtrlCreateMenuItem("Patch client", $MenuItem_optionofficial)
$MenuItem_optionsshard = GUICtrlCreateMenu("Shard server options", $MenuItem_settings)
$MenuItem_editshardpath = GUICtrlCreateMenuItem("Edit path", $MenuItem_optionsshard)
$MenuItem_manage = GUICtrlCreateMenuItem("Manage accounts", $MenuItem_settings)
$MenuItem_adv = GUICtrlCreateMenuItem("Advanced options", $MenuItem_settings)
$MenuItem_delete = GUICtrlCreateMenuItem("Delete entry", $MenuItem_settings)
$MenuItem_change = GUICtrlCreateMenuItem("Change user.dat path", $MenuItem_settings)
$MenuItem_quiton = GUICtrlCreateMenuItem("Quit on client start", $MenuItem_settings)
$MenuItem_view = GUICtrlCreateMenu("&View")
$MenuItem_f5 = GUICtrlCreateMenuItem("Update", $MenuItem_view)
$MenuItem_opacity = GUICtrlCreateMenu("Set opacity", $MenuItem_view)
$MenuItem_10 = GUICtrlCreateMenuItem("10%", $MenuItem_opacity, -1 , 1)
$MenuItem_20 = GUICtrlCreateMenuItem("20%", $MenuItem_opacity, -1 , 1)
$MenuItem_30 = GUICtrlCreateMenuItem("30%", $MenuItem_opacity, -1 , 1)
$MenuItem_40 = GUICtrlCreateMenuItem("40%", $MenuItem_opacity, -1 , 1)
$MenuItem_50 = GUICtrlCreateMenuItem("50%", $MenuItem_opacity, -1 , 1)
$MenuItem_60 = GUICtrlCreateMenuItem("60%", $MenuItem_opacity, -1 , 1)
$MenuItem_70 = GUICtrlCreateMenuItem("70%", $MenuItem_opacity, -1 , 1)
$MenuItem_80 = GUICtrlCreateMenuItem("80%", $MenuItem_opacity, -1 , 1)
$MenuItem_90 = GUICtrlCreateMenuItem("90%", $MenuItem_opacity, -1 , 1)
$MenuItem_100 = GUICtrlCreateMenuItem("100%", $MenuItem_opacity, -1 , 1)
GUICtrlSetState(-1, $GUI_CHECKED)
$MenuItem_ontop = GUICtrlCreateMenuItem("Always on top", $MenuItem_view)
$MenuItem_tools = GUICtrlCreateMenu("&Tools")
$MenuItem_screen = GUICtrlCreateMenuItem("Show screenshots directory", $MenuItem_tools)
$MenuItem_user = GUICtrlCreateMenuItem("Open user settings directory", $MenuItem_tools)
$MenuItem_userdotdat = GUICtrlCreateMenuItem("Edit user.dat", $MenuItem_tools)
$MenuItem_backup = GUICtrlCreateMenuItem("Back up settings and screenshots", $MenuItem_tools)
$MenuItem_loki = GUICtrlCreateMenuItem("Fix Loki2 consult limit", $MenuItem_tools)
$MenuItem_limiter = GUICtrlCreateMenuItem("Remove clients limiter", $MenuItem_tools)
$MenuItem_free = GUICtrlCreateMenuItem("Kill all clients, death processes and free up memory", $MenuItem_tools)
$MenuItem_vent = GUICtrlCreateMenu("V&entrilo")
$MenuItem_ventstart = GUICtrlCreateMenuItem("Start", $MenuItem_vent)
$MenuItem_ventpath = GUICtrlCreateMenuItem("Edit path", $MenuItem_vent)
$MenuItem_ventbackup = GUICtrlCreateMenuItem("Back up", $MenuItem_vent)
$MenuItem_irc = GUICtrlCreateMenu("I&RC")
$MenuItem_ircclient = GUICtrlCreateMenuItem("IRC client", $MenuItem_irc)
$MenuItem_irchelp = GUICtrlCreateMenuItem("IRC help", $MenuItem_irc)
$MenuItem_info = GUICtrlCreateMenu("&Info")
$MenuItem_update = GUICtrlCreateMenuItem("Get latest version", $MenuItem_info)
$MenuItem_about1 = GUICtrlCreateMenuItem("About security", $MenuItem_info)
$MenuItem_about2 = GUICtrlCreateMenuItem("About DAoC Starter", $MenuItem_info)
$Group1 = GUICtrlCreateGroup("", 4, 0, 323, 72)
$Button_start = GUICtrlCreateButton("Start", 10, 12, 68, 21)
GUICtrlSetTip(-1, "Start a DAoC's client")
$Combo_res = GUICtrlCreateCombo("", 84, 12, 84, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetTip(-1, "Select game's resolution")
$Checkbox_winmode = GUICtrlCreateCheckbox("Fullscreen", 177, 14, 71, 17)
GUICtrlSetTip(-1, "Check to play fullscreen")
$Combo_account = GUICtrlCreateCombo("", 10, 42, 158, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetTip(-1, "Select an account")
$Combo_char = GUICtrlCreateCombo("", 176, 42, 143, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetTip(-1, "Select a quick-login")
$Button_kill = GUICtrlCreateButton("Kill client", 251, 12, 68, 21)
GUICtrlSetTip(-1, "Kill a DAoC's client")
$IPAddress_ = _GUICtrlIpAddress_Create($Form1, 176, 42, 103, 21)
_GUICtrlIpAddress_Set($IPAddress_, "0.0.0.0")
_GUICtrlIpAddress_ShowHide($IPAddress_, @SW_HIDE)
$Input_port = GUICtrlCreateInput("0", 285, 42, 34, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER,$ES_NUMBER))
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetTip(-1, "This is the shard's port")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label_ = GUICtrlCreateLabel("Welcome to DAoC Starter", 4, 74, 322, 17, $SS_CENTER)
update_gui()
GUISetState(@SW_SHOW, $Form1)
#EndRegion ### END Koda GUI section ###
#Region ### START Koda GUI section ### Form=D:\AUTOIT\DAoC_Starter\Form2.kxf
$Form2 = GUICreate("Accounts Database Editor", 308, 181, -1, -1)
$List_account = GUICtrlCreateList("", 8, 10, 139, 162)
$Button_add = GUICtrlCreateButton("Add new account", 158, 10, 139, 25)
$Button_edit = GUICtrlCreateButton("Edit selected account", 158, 44, 139, 25)
$Button_remove = GUICtrlCreateButton("Delete selected account", 158, 79, 139, 25)
$Button_show = GUICtrlCreateButton("Show passwords!", 158, 113, 139, 25)
$Button_back = GUICtrlCreateButton("Back", 158, 147, 139, 25)
#EndRegion ### END Koda GUI section ###
#Region ### START Koda GUI section ### Form=D:\AUTOIT\DAoC_Starter\Form3.kxf
$Form3 = GUICreate("Advanced Options", 570, 269, -1, -1)
$Group2 = GUICtrlCreateGroup("Advanced Options", 12, 11, 547, 247)
GUICtrlCreateLabel("general audio", 68, 38, 68, 17)
GUICtrlCreateLabel("ambient music volume", 28, 69, 108, 17)
GUICtrlCreateLabel("ambient sound volume", 26, 100, 110, 17)
GUICtrlCreateLabel("music volume", 68, 131, 68, 17)
GUICtrlCreateLabel("sound volume", 66, 161, 70, 17)
GUICtrlCreateLabel("sleep mode", 78, 192, 58, 17)
GUICtrlCreateLabel("shadow figures", 61, 223, 75, 17)
GUICtrlCreateLabel("dynamic shadows", 303, 38, 88, 17)
GUICtrlCreateLabel("water", 361, 69, 30, 17)
GUICtrlCreateLabel("reflection quality", 311, 100, 80, 17)
GUICtrlCreateLabel("reflection update", 308, 131, 83, 17)
GUICtrlCreateLabel("atlantis terrain", 322, 161, 69, 17)
GUICtrlCreateLabel("atlantis tree", 333, 192, 58, 17)
GUICtrlCreateLabel("characters version", 300, 223, 91, 17)
$Combo_general = GUICtrlCreateCombo("", 145, 36, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "on|off")
$Combo_ambient_m = GUICtrlCreateCombo("", 145, 67, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "full|9|8|7|6|5|4|3|2|1|off")
$Combo_ambient_s = GUICtrlCreateCombo("", 145, 98, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "full|9|8|7|6|5|4|3|2|1|off")
$Combo_music = GUICtrlCreateCombo("", 145, 129, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "full|9|8|7|6|5|4|3|2|1|off")
$Combo_sound = GUICtrlCreateCombo("", 145, 159, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "full|9|8|7|6|5|4|3|2|1|off")
$Combo_sleep = GUICtrlCreateCombo("", 145, 190, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "background|never|minimized")
$Combo_shadow = GUICtrlCreateCombo("", 145, 221, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "none|all figures|self only|near 5 figures|near 10 figures")
$Combo_dynamic = GUICtrlCreateCombo("", 401, 36, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "on|low|high")
$Combo_water = GUICtrlCreateCombo("", 401, 67, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "classic|SI|reflective")
$Combo_reflection_q = GUICtrlCreateCombo("", 401, 98, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "low|medium|high")
$Combo_reflection_u = GUICtrlCreateCombo("", 401, 129, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "often|occasional|seldom")
$Combo_atlantis_t = GUICtrlCreateCombo("", 401, 159, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "on|off")
$Combo_atlantis_te = GUICtrlCreateCombo("", 401, 190, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "on|off")
$Combo_characters = GUICtrlCreateCombo("", 401, 221, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "classic|catacombs")
GUICtrlCreateGroup("", -99, -99, 1, 1)
#EndRegion ### END Koda GUI section ###
#Region ### START Koda GUI section ### Form=
$Form4 = GUICreate("Select client to kill", 202, 72, -1, -1)
$List1 = GUICtrlCreateList("", 2, 5, 106, 58)
$Button1 = GUICtrlCreateButton("Kill", 118, 5, 75, 25, 0)
$Button2 = GUICtrlCreateButton("Back", 118, 38, 75, 25, 0)
#EndRegion ### END Koda GUI section ###


GUISwitch($Form1)
TraySetOnEvent($TRAY_EVENT_PRIMARYUP, "maximize")
GUISetOnEvent($GUI_EVENT_CLOSE, "CLOSEClicked")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "minimize")
GUICtrlSetOnEvent($MenuItem_update, 'f1')
GUICtrlSetOnEvent($MenuItem_about1, 'f2')
GUICtrlSetOnEvent($MenuItem_about2, 'f3')
GUICtrlSetOnEvent($MenuItem_irchelp, 'f4')
GUICtrlSetOnEvent($MenuItem_ircclient, 'f5')
GUICtrlSetOnEvent($MenuItem_ventstart, 'f6')
GUICtrlSetOnEvent($MenuItem_ventpath, 'f7')
GUICtrlSetOnEvent($MenuItem_ventbackup, 'f8')
GUICtrlSetOnEvent($MenuItem_screen, 'f9')
GUICtrlSetOnEvent($MenuItem_user, 'f10')
GUICtrlSetOnEvent($MenuItem_userdotdat, 'f11')
GUICtrlSetOnEvent($MenuItem_backup, 'f12')
GUICtrlSetOnEvent($MenuItem_loki, 'f13')
GUICtrlSetOnEvent($MenuItem_ontop, 'f14')
GUICtrlSetOnEvent($MenuItem_10, 'f15')
GUICtrlSetOnEvent($MenuItem_20, 'f16')
GUICtrlSetOnEvent($MenuItem_30, 'f17')
GUICtrlSetOnEvent($MenuItem_40, 'f18')
GUICtrlSetOnEvent($MenuItem_50, 'f19')
GUICtrlSetOnEvent($MenuItem_60, 'f20')
GUICtrlSetOnEvent($MenuItem_70, 'f21')
GUICtrlSetOnEvent($MenuItem_80, 'f22')
GUICtrlSetOnEvent($MenuItem_90, 'f23')
GUICtrlSetOnEvent($MenuItem_100, 'f24')
GUICtrlSetOnEvent($MenuItem_quiton, 'f25')
GUICtrlSetOnEvent($MenuItem_official, 'f26')
GUICtrlSetOnEvent($MenuItem_shard, 'f27')
GUICtrlSetOnEvent($MenuItem_editofficialpath, 'f28')
GUICtrlSetOnEvent($MenuItem_editshardpath, 'f29')
GUICtrlSetOnEvent($MenuItem_patch, 'f30')
GUICtrlSetOnEvent($Checkbox_winmode, 'f31')
GUICtrlSetOnEvent($Combo_res, 'f32')
GUICtrlSetOnEvent($Combo_char, 'f33')
GUICtrlSetOnEvent($Button_start, 'f34')
GUICtrlSetOnEvent($Button_kill, 'f35')
GUICtrlSetOnEvent($MenuItem_delete, 'f36')
GUICtrlSetOnEvent($MenuItem_manage, 'f37')
GUICtrlSetOnEvent($MenuItem_adv, 'f43')
GUICtrlSetOnEvent($Input_port, 'f59')
GUICtrlSetOnEvent($MenuItem_limiter, 'mutex_killer')
GUICtrlSetOnEvent($MenuItem_free, 'f61')
GUICtrlSetOnEvent($MenuItem_change, 'f62')
GUICtrlSetOnEvent($MenuItem_f5, 'update_gui')

While 1
	Sleep(1000)
WEnd

Func f62()
	$temp = FileOpenDialog("Select the user.dat", @HomeDrive, "", Default, "user.dat")
	If $temp <> 0 Then
		$userdotdat = $temp
		$path = StringReplace($temp, "/user.dat", "")
		GUICtrlSetData($Label_, "Done")
	Else
		GUICtrlSetData($Label_, "Aborted")
	EndIf
EndFunc
Func f61()
	While ProcessExists("game.dll") <> 0
		ProcessClose("game.dll")
	WEnd
	While ProcessExists("login.dll") <> 0
		ProcessClose("login.dll")
	WEnd
	GUICtrlSetData($Label_, "Done")
EndFunc
Func f59()
	IniWrite($userdotdat, "zmain", "port", GUICtrlRead($Input_port))
EndFunc
Func f43()
	GUICtrlSetData($Label_, "Showing more options")
	GUISetState(@SW_DISABLE, $Form1)
	If IniRead($userdotdat, "character_version", "9-0", "0") == 0 Then
		GUICtrlSetData($Combo_characters, "classic", "classic")
	Else
		GUICtrlSetData($Combo_characters, "catacombs", "catacombs")
	EndIf
	If IniRead($userdotdat, "atlantis_internal", "item1", 0) == 0 Then
		GUICtrlSetData($Combo_atlantis_te, "on", "on")
	Else
		GUICtrlSetData($Combo_atlantis_te, "off", "off")
	EndIf
	If IniRead($userdotdat, "atlantis_internal", "item2", 0) == 0 Then
		GUICtrlSetData($Combo_atlantis_t, "on", "on")
	Else
		GUICtrlSetData($Combo_atlantis_t, "off", "off")
	EndIf
	Switch IniRead($userdotdat, "water", "item2", 0)
		Case 0
			GUICtrlSetData($Combo_reflection_u, "often", "often")
		Case 1
			GUICtrlSetData($Combo_reflection_u, "occasional", "occasional")
		Case 2
			GUICtrlSetData($Combo_reflection_u, "seldom", "seldom")
	EndSwitch
	Switch IniRead($userdotdat, "water", "item3", 0)
		Case 2
			GUICtrlSetData($Combo_reflection_q, "low", "low")
		Case 1
			GUICtrlSetData($Combo_reflection_q, "medium", "medium")
		Case 0
			GUICtrlSetData($Combo_reflection_q, "high", "high")
	EndSwitch
	Switch IniRead($userdotdat, "water", "item1", 0)
		Case 2
			GUICtrlSetData($Combo_water, "SI", "SI")
		Case 1
			GUICtrlSetData($Combo_water, "classic", "classic")
		Case 0
			GUICtrlSetData($Combo_water, "reflective", "reflective")
	EndSwitch
	Switch IniRead($userdotdat, "shadows", "item1", 0)
		Case 0
			GUICtrlSetData($Combo_dynamic, "on", "on")
		Case 2
			GUICtrlSetData($Combo_dynamic, "low", "low")
		Case 1
			GUICtrlSetData($Combo_dynamic, "high", "high")
	EndSwitch
	Switch IniRead($userdotdat, "shadows", "item2", 0)
		Case 4
			GUICtrlSetData($Combo_shadow, "none", "none")
		Case 0
			GUICtrlSetData($Combo_shadow, "all figures", "all figures")
		Case 1
			GUICtrlSetData($Combo_shadow, "self only", "self only")
		Case 2
			GUICtrlSetData($Combo_shadow, "near 5 figures", "near 5 figures")
		Case 3
			GUICtrlSetData($Combo_shadow, "near 10 figures", "near 10 figures")
	EndSwitch
	Switch IniRead($userdotdat, "performance", "item7", 0)
		Case 1
			GUICtrlSetData($Combo_sleep, "background", "background")
		Case 2
			GUICtrlSetData($Combo_sleep, "never", "never")
		Case 0
			GUICtrlSetData($Combo_sleep, "minimized", "minimized")
	EndSwitch
	refresh_combo_sounds()
	If IniRead($userdotdat, "zsound", "volume", "on") == "on" Then
		GUICtrlSetData($Combo_general, "on", "on")
		GUICtrlSetState($Combo_ambient_m, $GUI_ENABLE)
		GUICtrlSetState($Combo_ambient_s, $GUI_ENABLE)
		GUICtrlSetState($Combo_music, $GUI_ENABLE)
		GUICtrlSetState($Combo_sound, $GUI_ENABLE)
	Else
		GUICtrlSetData($Combo_general, "off", "off")
		GUICtrlSetState($Combo_ambient_m, $GUI_DISABLE)
		GUICtrlSetState($Combo_ambient_s, $GUI_DISABLE)
		GUICtrlSetState($Combo_music, $GUI_DISABLE)
		GUICtrlSetState($Combo_sound, $GUI_DISABLE)
	EndIf
	GUISetState(@SW_SHOW, $Form3)
	GUISwitch($Form3)
	GUISetOnEvent($GUI_EVENT_CLOSE, 'f44')
	GUICtrlSetOnEvent($Combo_general, 'f45')
	GUICtrlSetOnEvent($Combo_ambient_m, 'f46')
	GUICtrlSetOnEvent($Combo_ambient_s, 'f47')
	GUICtrlSetOnEvent($Combo_music, 'f48')
	GUICtrlSetOnEvent($Combo_sound, 'f49')
	GUICtrlSetOnEvent($Combo_sleep, 'f50')
	GUICtrlSetOnEvent($Combo_shadow, 'f51')
	GUICtrlSetOnEvent($Combo_dynamic, 'f52')
	GUICtrlSetOnEvent($Combo_water, 'f53')
	GUICtrlSetOnEvent($Combo_reflection_q, 'f54')
	GUICtrlSetOnEvent($Combo_reflection_u, 'f55')
	GUICtrlSetOnEvent($Combo_atlantis_t, 'f56')
	GUICtrlSetOnEvent($Combo_atlantis_te, 'f57')
	GUICtrlSetOnEvent($Combo_characters, 'f58')
EndFunc
Func f58()
	If GUICtrlRead($Combo_characters) == "classic" Then
		$temp = 0
	Else
		$temp = 1
	EndIf
	IniWrite($userdotdat, "character_version", "500-0", $temp)
	For $i = 0 To 20
		IniWrite($userdotdat, "character_version", $i & "-0", $temp)
		IniWrite($userdotdat, "character_version", $i & "-1", $temp)
	Next
EndFunc
Func f57()
	If GUICtrlRead($Combo_atlantis_te) == "on" Then
		IniWrite($userdotdat, "atlantis_internal", "item1", 0)
	Else
		IniWrite($userdotdat, "atlantis_internal", "item1", 1)
	EndIf
EndFunc
Func f56()
	If GUICtrlRead($Combo_atlantis_t) == "on" Then
		IniWrite($userdotdat, "atlantis_internal", "item2", 0)
	Else
		IniWrite($userdotdat, "atlantis_internal", "item2", 1)
	EndIf
EndFunc
Func f55()
	Switch GUICtrlRead($Combo_reflection_u)
		Case "often"
			IniWrite($userdotdat, "water", "item2", 0)
		Case "occasional"
			IniWrite($userdotdat, "water", "item2", 1)
		Case "seldom"
			IniWrite($userdotdat, "water", "item2", 2)
	EndSwitch
EndFunc
Func f54()
	Switch GUICtrlRead($Combo_reflection_q)
		Case "low"
			IniWrite($userdotdat, "water", "item3", 2)
		Case "medium"
			IniWrite($userdotdat, "water", "item3", 1)
		Case "high"
			IniWrite($userdotdat, "water", "item3", 0)
	EndSwitch
EndFunc
Func f53()
	Switch GUICtrlRead($Combo_water)
		Case "SI"
			IniWrite($userdotdat, "water", "item1", 2)
		Case "classic"
			IniWrite($userdotdat, "water", "item1", 1)
		Case "reflective"
			IniWrite($userdotdat, "water", "item1", 0)
	EndSwitch
EndFunc
Func f52()
	Switch GUICtrlRead($Combo_dynamic)
		Case "on"
			IniWrite($userdotdat, "shadows", "item1", 0)
		Case "low"
			IniWrite($userdotdat, "shadows", "item1", 2)
		Case "high"
			IniWrite($userdotdat, "shadows", "item1", 1)
	EndSwitch
EndFunc
Func f51()
	Switch GUICtrlRead($Combo_shadow)
		Case "none"
			IniWrite($userdotdat, "shadows", "item2", 4)
		Case "all figures"
			IniWrite($userdotdat, "shadows", "item2", 0)
		Case "self only"
			IniWrite($userdotdat, "shadows", "item2", 1)
		Case "near 5 figures"
			IniWrite($userdotdat, "shadows", "item2", 2)
		Case "near 10 figures"
			IniWrite($userdotdat, "shadows", "item2", 3)
	EndSwitch
EndFunc
Func f50()
	Switch GUICtrlRead($Combo_sleep)
		Case "background"
			IniWrite($userdotdat, "performance", "item7", 1)
		Case "never"
			IniWrite($userdotdat, "performance", "item7", 2)
		Case "minimized"
			IniWrite($userdotdat, "performance", "item7", 0)
	EndSwitch
EndFunc
Func f49()
	$temp = GUICtrlRead($Combo_sound)
	Switch $temp
		Case "full"
			IniWrite($userdotdat, "sound", "item1", 0)
		Case "off"
			IniWrite($userdotdat, "sound", "item1", 10)
		Case else
			IniWrite($userdotdat, "sound", "item1", (-1) * ($temp - 10))
	EndSwitch
EndFunc
Func f48()
	$temp = GUICtrlRead($Combo_music)
	Switch $temp
		Case "full"
			IniWrite($userdotdat, "sound", "item2", 0)
		Case "off"
			IniWrite($userdotdat, "sound", "item2", 10)
		Case else
			IniWrite($userdotdat, "sound", "item2", (-1) * ($temp - 10))
	EndSwitch
EndFunc
Func f47()
	$temp = GUICtrlRead($Combo_ambient_s)
	Switch $temp
		Case "full"
			IniWrite($userdotdat, "sound", "item3", 0)
		Case "off"
			IniWrite($userdotdat, "sound", "item3", 10)
		Case else
			IniWrite($userdotdat, "sound", "item3", (-1) * ($temp - 10))
	EndSwitch
EndFunc
Func f46()
	$temp = GUICtrlRead($Combo_ambient_m)
	Switch $temp
		Case "full"
			IniWrite($userdotdat, "sound", "item4", 0)
		Case "off"
			IniWrite($userdotdat, "sound", "item4", 10)
		Case else
			IniWrite($userdotdat, "sound", "item4", (-1) * ($temp - 10))
	EndSwitch
EndFunc
Func f45()
	If GUICtrlRead($Combo_general) == "on" Then
		GUICtrlSetState($Combo_ambient_m, $GUI_ENABLE)
		GUICtrlSetState($Combo_ambient_s, $GUI_ENABLE)
		GUICtrlSetState($Combo_music, $GUI_ENABLE)
		GUICtrlSetState($Combo_sound, $GUI_ENABLE)
		IniWrite($userdotdat, "sound", "item1", IniRead($userdotdat, "zsound", "item1", 0))
		IniWrite($userdotdat, "sound", "item2", IniRead($userdotdat, "zsound", "item2", 0))
		IniWrite($userdotdat, "sound", "item3", IniRead($userdotdat, "zsound", "item3", 0))
		IniWrite($userdotdat, "sound", "item4", IniRead($userdotdat, "zsound", "item4", 0))
		IniWrite($userdotdat, "zsound", "volume", "on")
		refresh_combo_sounds()
	Else
		GUICtrlSetState($Combo_ambient_m, $GUI_DISABLE)
		GUICtrlSetState($Combo_ambient_s, $GUI_DISABLE)
		GUICtrlSetState($Combo_music, $GUI_DISABLE)
		GUICtrlSetState($Combo_sound, $GUI_DISABLE)
		IniWrite($userdotdat, "zsound", "item1", IniRead($userdotdat, "sound", "item1", 0))
		IniWrite($userdotdat, "sound", "item1", 10)
		IniWrite($userdotdat, "zsound", "item2", IniRead($userdotdat, "sound", "item2", 0))
		IniWrite($userdotdat, "sound", "item2", 10)
		IniWrite($userdotdat, "zsound", "item3", IniRead($userdotdat, "sound", "item3", 0))
		IniWrite($userdotdat, "sound", "item3", 10)
		IniWrite($userdotdat, "zsound", "item4", IniRead($userdotdat, "sound", "item4", 0))
		IniWrite($userdotdat, "sound", "item4", 10)
		IniWrite($userdotdat, "zsound", "volume", "off")
		refresh_combo_sounds()
	EndIf
EndFunc
Func f44()
	GUISetState(@SW_HIDE, $Form3)
	GUISetState(@SW_ENABLE, $Form1)
	GUISwitch($Form1)
EndFunc
Func f37()
	GUICtrlSetData($Label_, "Starting Accounts Database Manager")
	GUISetState(@SW_DISABLE, $Form1)
	refresh_list_accounts()
	GUISetState(@SW_SHOW, $Form2)
	GUISwitch($Form2)
	GUICtrlSetOnEvent($Button_back, 'f38')
	GUISetOnEvent($GUI_EVENT_CLOSE, 'f38')
	GUICtrlSetOnEvent($Button_add, 'f39')
	GUICtrlSetOnEvent($Button_edit, 'f40')
	GUICtrlSetOnEvent($Button_remove, 'f41')
	GUICtrlSetOnEvent($Button_show, 'f42')
EndFunc
Func f42()
	$array = IniReadSection($userdotdat, "zdata")
	If @error == 1 Then
	Else
		$string = ""
		For $i = 1 To $array[0][0]
			$string = $string & _StringEncrypt(0, $array[$i][0]) & " : " & _StringEncrypt(0, $array[$i][1]) & @CR
		Next
		MsgBox(0, "Showing passwords", $string, "", $Form2)
	EndIf
EndFunc
Func f41()
	$temp = GUICtrlRead($List_account)
	If $temp == "" Then
	Else
		IniDelete($userdotdat, "zdata", _StringEncrypt(1, $temp))
		refresh_list_accounts()
	EndIf
EndFunc
Func f40()
	Dim $temp[3]
	$temp[0] = GUICtrlRead($List_account)
	If $temp[0] == "" Then
	Else
		$temp[1] = InputBox("Editing account " & $temp[0], "Insert the new account ID", $temp[0], "", Default, Default, Default, Default, "", $Form2)
		If $temp[1] == "" Then
		Else
			$temp[2] = InputBox("Editing account " & $temp[1], "Insert the new password", "", "*", Default, Default, Default, Default, "", $Form2)
			If $temp[2] == "" Then
			Else
				IniDelete($userdotdat, "zdata", _StringEncrypt(1, $temp[0]))
				IniWrite($userdotdat, "zdata", _StringEncrypt(1, $temp[1]), _StringEncrypt(1, $temp[2]))
				refresh_list_accounts()
			EndIf
		EndIf
	EndIf
EndFunc
Func f39()
	Dim $temp[2]
	$temp[0] = InputBox("Adding a new account", "Insert the account ID", "", "", Default, Default, Default, Default, "", $Form2)
	If $temp[0] == "" Then
	Else
		If IniRead($userdotdat, "zdata", $temp[0], "") == "" Then
			$temp[1] = InputBox("Adding a new account", "Insert the account password", "", "*", Default, Default, Default, Default, "", $Form2)
			If $temp[1] == "" Then
			Else
				IniWrite($userdotdat, "zdata", _StringEncrypt(1, $temp[0]), _StringEncrypt(1, $temp[1]))
				refresh_list_accounts()
			EndIf
		EndIf
	EndIf
EndFunc
Func f38()
	refresh_combo_accounts()
	GUISetState(@SW_HIDE, $Form2)
	GUISetState(@SW_ENABLE, $Form1)
	GUISwitch($Form1)
EndFunc
Func f36()
	$temp = GUICtrlRead($Combo_char)
	If $temp == "No Thank You" Then
		GUICtrlSetData($Label_, "No entry to delete")
	Else
		Dim $array[10]
		For $i = 0 To 9
			$array[$i] = IniRead($userdotdat, "quick", "entry" & $i, "")
		Next
		$array = array_compresser($array, $temp)
		For $i = 0 To 9
			IniWrite($userdotdat, "quick", "entry" & $i, $array[$i])
		Next
		GUICtrlSetData($Label_, "Deleted an entry")
		refresh_combo_chars()
	EndIf
EndFunc
Func f35()
	$mega = WinList('Dark Age of Camelot © 2001-2011 Electronic Arts Inc. All Rights Reserved.')
	Local $string = ''
	If $mega[0][0] > 0 Then
		For $i = 1 To $mega[0][0]
			$string = $string & '|' & $i
		Next
		GUICtrlSetData($List1, $string)
	Else
		MsgBox(64, 'No clients found', 'There are no clients to kill', Default, $Form1)
		Return
	EndIf
	GUISetState(@SW_DISABLE, $Form1)
	GUISetState(@SW_SHOW, $Form4)
	GUISwitch($Form4)
	GUISetOnEvent($GUI_EVENT_CLOSE, 'f35q')
	GUICtrlSetOnEvent($Button2, 'f35q')
	GUICtrlSetOnEvent($List1, 'f35f')
	GUICtrlSetOnEvent($Button1, 'f35k')
EndFunc
Func f35k()
	If GUICtrlRead($List1) <> "" Then
		If (ProcessClose(WinGetProcess($mega[GUICtrlRead($List1)][1])) == 1) Then
			GUICtrlSetData($Label_, "Killed a DAoC's client")
			f35q()
			f35()
		EndIf
	EndIf
EndFunc
Func f35f()
	If GUICtrlRead($List1) <> "" Then
		WinFlash($mega[GUICtrlRead($List1)][1], Default, 2, 50)
	EndIf
EndFunc
Func f35q()
	GUISetState(@SW_HIDE, $Form4)
	GUISetState(@SW_ENABLE, $Form1)
	GUISwitch($Form1)
EndFunc
Func f34()
	GUISetState($GUI_DISABLE, $Form1)
	GUICtrlSetData($Label_, "Starting...")
	$flag = 0
	If IniRead($userdotdat, "zmain", "mode", 0) == 1 Then
		GUICtrlSetData($Label_, "mode: shard")
		IniWrite($userdotdat, "zmain", "ip", _GUICtrlIpAddress_Get($IPAddress_))
		If IniRead($userdotdat, "zmain", "path_shard", "") == "" Then
			path_generator(1)
			If IniRead($userdotdat, "zmain", "path_shard", "") == "" Then
				$flag = 1
				GUICtrlSetData($Label_, "No path selected, aborting")
			EndIf
		EndIf
		If $flag == 0 Then
			If GUICtrlRead($Combo_account) == "No account selected" Then
				GUICtrlSetData($Label_, "No account selected, aborting")
			Else
				FileInstall("C:\ZZZ\AUTOIT\DAoC_Starter\dolloader.exe", $path & "\dolloader.exe")
				If ShellExecute($path & "\dolloader.exe ", """" & StringReplace(IniRead($userdotdat, "zmain", "path_shard", ""), "camelot.exe", "game.dll") & """ " & IniRead($userdotdat, "zmain", "ip", "0.0.0.0") & " " & IniRead($userdotdat, "zmain", "port", 0) & " 20 " & GUICtrlRead($Combo_account) & " " & _StringEncrypt(0, IniRead($userdotdat, "zdata", _StringEncrypt(1, GUICtrlRead($Combo_account)), "")), StringReplace(IniRead($userdotdat, "zmain", "path_shard", ""), "\camelot.exe", "")) == 1 Then
					GUICtrlSetData($Label_, "Done")
					set_last_account()
				Else
					GUICtrlSetData($Label_, "Error on starting camelot.exe")
				EndIf
			EndIf
		EndIf
	Else
		mutex_killer()
		GUICtrlSetData($Label_, "mode: official")
		While ProcessExists("login.dll") <> 0
			ProcessClose("login.dll")
			GUICtrlSetData($Label_, "Killing login.dll")
		WEnd
		If IniRead($userdotdat, "zmain", "path_official", "") == "" Then
			path_generator(0)
			If IniRead($userdotdat, "zmain", "path_official", "") == "" Then
				$flag = 1
				GUICtrlSetData($Label_, "No path selected, aborting")
			EndIf
		EndIf
		If $flag == 0 Then
			$pid = Run(StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "camelot.exe", "login.dll"), StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "camelot.exe", ""))
			If GUICtrlRead($Combo_account) == "No account selected" Then
				GUICtrlSetData($Label_, "Done")
				set_last_account()
			Else
				If $pid == 0 Then
					GUICtrlSetData($Label_, "Error on starting camelot.exe")
				Else
					$win_handle = 0
					While $win_handle == 0
						$list = WinList("Dark Age of Camelot")
						If IsArray($list) == 1 Then
							For $i = 1 To $list[0][0]
								$size = WinGetClientSize($list[$i][1])
								If IsArray($size) == 1 Then
									If $size[0] == 390 And $size[1] == 211 Then $win_handle = $list[$i][1]
								EndIf
							Next
						EndIf
					WEnd
					If ControlSetText($win_handle, "", "[CLASS:Edit; INSTANCE:2]", GUICtrlRead($Combo_account)) == 1 Then
						GUICtrlSetData($Label_, "Account setted")
						If ControlSetText($win_handle, "", "[CLASS:Edit; INSTANCE:1]", _StringEncrypt(0, IniRead($userdotdat, "zdata", _StringEncrypt(1, GUICtrlRead($Combo_account)), ""))) Then
							GUICtrlSetData($Label_, "Password setted")
							If WinActivate($win_handle) <> 0 Then
								If ControlSend($win_handle, "", "[CLASS:Edit; INSTANCE:1]", "{enter}") == 1 Then
									While WinExists("End User License Agreement") <> 1
										Sleep(10)
									WEnd
									Sleep(10)
									If ControlSend("End User License Agreement", "", "[CLASS:Button; INSTANCE:1]", "{enter}") == 1 Then
										While WinExists("Code of Conduct") <> 1
											Sleep(10)
										WEnd
										Sleep(10)
										If ControlSend("Code of Conduct", "", "[CLASS:Button; INSTANCE:1]", "{enter}") == 1 Then
											GUICtrlSetData($Label_, "Done")
											set_last_account()
										Else
											GUICtrlSetData($Label_, "Error on Code of Conduct form")
										EndIf
									Else
										GUICtrlSetData($Label_, "Error on End User License Agreement form")
									EndIf
								Else
									GUICtrlSetData($Label_, "Error on setting login.dll form")
								EndIf
							Else
								GUICtrlSetData($Label_, "Error: lost win_handle")
							EndIf
						Else
							GUICtrlSetData($Label_, "Error on setting password")
						EndIf
					Else
						GUICtrlSetData($Label_, "Error on setting account ID")
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	GUISetState($GUI_ENABLE, $Form1)
EndFunc
Func f33()
	Switch GUICtrlRead($Combo_char)
		Case "No Thank You"
			IniWrite($userdotdat, "quick", "setentry", 0)
		Case IniRead($userdotdat, "quick", "entry0", 0)
			IniWrite($userdotdat, "quick", "setentry", 1)
		Case IniRead($userdotdat, "quick", "entry1", 0)
			IniWrite($userdotdat, "quick", "setentry", 2)
		Case IniRead($userdotdat, "quick", "entry2", 0)
			IniWrite($userdotdat, "quick", "setentry", 3)
		Case IniRead($userdotdat, "quick", "entry3", 0)
			IniWrite($userdotdat, "quick", "setentry", 4)
		Case IniRead($userdotdat, "quick", "entry4", 0)
			IniWrite($userdotdat, "quick", "setentry", 5)
		Case IniRead($userdotdat, "quick", "entry5", 0)
			IniWrite($userdotdat, "quick", "setentry", 6)
		Case IniRead($userdotdat, "quick", "entry6", 0)
			IniWrite($userdotdat, "quick", "setentry", 7)
		Case IniRead($userdotdat, "quick", "entry7", 0)
			IniWrite($userdotdat, "quick", "setentry", 8)
		Case IniRead($userdotdat, "quick", "entry8", 0)
			IniWrite($userdotdat, "quick", "setentry", 9)
		Case IniRead($userdotdat, "quick", "entry9", 0)
			IniWrite($userdotdat, "quick", "setentry", 10)
	EndSwitch
EndFunc
Func f32()
	$array = StringSplit(GUICtrlRead($Combo_res), " ")
	IniWrite($userdotdat, "main", "screen_width", $array[1])
	IniWrite($userdotdat, "main", "screen_height", $array[2])
	GUICtrlSetData($Label_, "Resolution: " & $array[1] & "x" & $array[2])
EndFunc
Func f31()
	If GUICtrlRead($Checkbox_winmode) == 1 Then
		IniWrite($userdotdat, "main", "windowed", 0)
		GUICtrlSetData($Label_, "Win mode off")
	Else
		IniWrite($userdotdat, "main", "windowed", 1)
		GUICtrlSetData($Label_, "Win mode on")
	EndIf
EndFunc
Func f30()
	GUICtrlSetData($Label_, "Attemping to patch camelot.exe")
	ShellExecute(IniRead($userdotdat, "zmain", "path_official", ""), "", StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "\camelot.exe", ""))
EndFunc
Func f29()
	GUICtrlSetData($Label_, "Editing shard's path")
	path_generator(1)
EndFunc
Func f28()
	GUICtrlSetData($Label_, "Editing official's path")
	path_generator(0)
EndFunc
Func f27()
	IniWrite($userdotdat, "zmain", "mode", 1)
	_GUICtrlIpAddress_ShowHide($IPAddress_, @SW_SHOW)
	GUICtrlSetState($Input_port, $GUI_SHOW)
	GUICtrlSetState($Combo_char, $GUI_HIDE)
	GUICtrlSetData($Label_, "Shard mode on")
EndFunc
Func f26()
	IniWrite($userdotdat, "zmain", "mode", 0)
	_GUICtrlIpAddress_ShowHide($IPAddress_, @SW_HIDE)
	GUICtrlSetState($Input_port, $GUI_HIDE)
	GUICtrlSetState($Combo_char, $GUI_SHOW)
	GUICtrlSetData($Label_, "Official mode on")
EndFunc
Func f25()
	If GUICtrlRead($MenuItem_quiton) == 65 Then
		GUICtrlSetState($MenuItem_quiton, $GUI_UNCHECKED)
		IniWrite($userdotdat, "zmain", "quit", 0)
		GUICtrlSetData($Label_, "Quit on start option disabled")
	Else
		GUICtrlSetState($MenuItem_quiton, $GUI_CHECKED)
		IniWrite($userdotdat, "zmain", "quit", 1)
		GUICtrlSetData($Label_, "Quit on start option enabled")
	EndIf
EndFunc
Func f24()
	WinSetTrans($title, "", 255)
	GUICtrlSetData($Label_, "Opacity: 100%")
EndFunc
Func f23()
	WinSetTrans($title, "", 225)
	GUICtrlSetData($Label_, "Opacity: 90%")
EndFunc
Func f22()
	WinSetTrans($title, "", 200)
	GUICtrlSetData($Label_, "Opacity: 80%")
EndFunc
Func f21()
	WinSetTrans($title, "", 175)
	GUICtrlSetData($Label_, "Opacity: 70%")
EndFunc
Func f20()
	WinSetTrans($title, "", 150)
	GUICtrlSetData($Label_, "Opacity: 60%")
EndFunc
Func f19()
	WinSetTrans($title, "", 125)
	GUICtrlSetData($Label_, "Opacity: 50%")
EndFunc
Func f18()
	WinSetTrans($title, "", 100)
	GUICtrlSetData($Label_, "Opacity: 40%")
EndFunc
Func f17()
	WinSetTrans($title, "", 75)
	GUICtrlSetData($Label_, "Opacity: 30%")
EndFunc
Func f16()
	WinSetTrans($title, "", 50)
	GUICtrlSetData($Label_, "Opacity: 20%")
EndFunc
Func f15()
	WinSetTrans($title, "", 25)
	GUICtrlSetData($Label_, "Opacity: 10%")
EndFunc
Func f14()
	If GUICtrlRead($MenuItem_ontop) == 65 Then
		GUICtrlSetState($MenuItem_ontop, $GUI_UNCHECKED)
		IniWrite($userdotdat, "zmain", "top", 0)
		WinSetOnTop($title, "", 0)
		GUICtrlSetData($Label_, "On top mode disabled")
	Else
		GUICtrlSetState($MenuItem_ontop, $GUI_CHECKED)
		IniWrite($userdotdat, "zmain", "top", 1)
		WinSetOnTop($title, "", 1)
		GUICtrlSetData($Label_, "On top mode enabled")
	EndIf
EndFunc
Func f13()
	If IsAdmin() <> 1 Then GUICtrlSetData($Label_, "No admin priv. !")
	If RegDelete("HKEY_CLASSES_ROOT\LOKI.Document", "Priority") == 1 Then
		GUICtrlSetData($Label_, "Registry correctly edited")
	Else
		Switch @error
			Case 1
				GUICtrlSetData($Label_, "unable to open requested key")
			Case 2
				GUICtrlSetData($Label_, "unable to open requested main key")
			Case 3
				GUICtrlSetData($Label_, "unable to remote connect to the registry")
			Case -1
				GUICtrlSetData($Label_, "unable to delete requested value")
			Case -2
				GUICtrlSetData($Label_, "unable to delete requested key/value")
		EndSwitch
	EndIf
EndFunc
Func f12()
	GUICtrlSetData($Label_, "Back-up in progress...")
	$temp = FileSelectFolder("Select the destination of the back up", @HomeShare, 7) & "\DAoC_back_up"
	GUISetState(@SW_DISABLE, $Form1)
	If $temp <> "\DAoC_back_up" Then
		If DirCopy(@MyDocumentsDir & "\Electronic Arts\Dark Age of Camelot", $temp & "\Dark Age of Camelot", 1) + DirCopy($path, $temp & "\LotM", 1) == 2 Then
			GUICtrlSetData($Label_, "Back-up done")
		Else
			GUICtrlSetData($Label_, "Error, back-up failed")
		EndIf
	Else
		GUICtrlSetData($Label_, "Back-up aborted")
	EndIf
	GUISetState(@SW_ENABLE, $Form1)
EndFunc
Func f11()
	run("notepad.exe " & $userdotdat)
	GUICtrlSetData($Label_, "Opening user.dat")
EndFunc
Func f10()
	ShellExecute($path)
	GUICtrlSetData($Label_, "Opening settings directory")
EndFunc
Func f9()
	ShellExecute(@MyDocumentsDir & "\Electronic Arts\Dark Age of Camelot")
	GUICtrlSetData($Label_, "Opening screenshots directory")
EndFunc
Func f8()
	GUICtrlSetData($Label_, "Starting ventrilo's back-up")
	DirCopy(StringReplace($path, "\Electronic Arts\Dark Age of Camelot\LotM", "\Ventrilo"), FileSelectFolder("Select the destination of the back up", @HomeShare, 7) & "\Ventrilo_back_up", 1)
EndFunc
Func f7()
	GUICtrlSetData($Label_, "Setting Ventrilo's path")
	$temp = FileOpenDialog("Select Ventrilo client", @HomeDrive, "(ventrilo.exe)", "", "", $Form1)
	If $temp <> "" Then IniWrite($userdotdat, "zmain", "vent", $temp)
EndFunc
Func f6()
	If IniRead($userdotdat, "zmain", "vent", "") == "" Then	IniWrite($userdotdat, "zmain", "vent", FileOpenDialog("Select Ventrilo client", @HomeDrive, "(ventrilo.exe)", "", "", $Form1))
	If IniRead($userdotdat, "zmain", "vent", "") <> "" Then ShellExecute(IniRead($userdotdat, "zmain", "vent", ""), "-m")
	GUICtrlSetData($Label_, "www.ventrilo.com")
EndFunc
Func f5()
	FileInstall("C:\ZZZ\AUTOIT\DAoC_Starter\wIRC_03.31.2009_alpha.jar", $path & "\wIRC_03.31.2009_alpha.jar")
	ShellExecute($path & "\wIRC_03.31.2009_alpha.jar")
	GUICtrlSetData($Label_, "Starting IRC client")
EndFunc
Func f4()
	ShellExecute("http://www.ircbeginner.com/ircinfo/ircc-commands.html")
	GUICtrlSetData($Label_, "Opening www.ircbeginner.com")
EndFunc
Func f3()
	MsgBox(64, "Informations & thanks to", "Created by simon387@hotmail.it aka Rayvaughan." & @CR & @CR & "Testers and ideas: C@stro, hawk'~, Madcastah, Vindicare." & @CR & @CR & "Part of IRC code is from: teh internet (GNU General Public License v3)." & @CR & "Handle.exe Copyright (C) 1997-2010 Mark Russinovich." & @CR & "DOLLoader - DOL Project." & @CR & "Ventrilo Copyright Flagship Industries, Inc. All right reserved." & @CR & "Dark Age of Camelot, Copyright (C) 2001-10 Mythic Entertainment, Inc.", "", $Form1)
	GUICtrlSetData($Label_, "simon387@hotmail.it")
EndFunc
Func f2()
	MsgBox(64, "Informations about security", "User accounts, passwords and other settings are saved in the user.dat. They are encrypted, but for more security remember to do not share your user.dat.", "", $Form1)
	GUICtrlSetData($Label_, "simon387@hotmail.it")
EndFunc
Func f1()
	ShellExecute("http://www.wayne2k1.com/showthread.php?t=96614")
	GUICtrlSetData($Label_, "Opening www.wayne2k1.com")
EndFunc
Func minimize()
    GuiSetState(@SW_HIDE)
    TraySetState(1) ; show
    TraySetToolTip ("DAoC Starter - click here to restore")
EndFunc
Func CLOSEClicked()
	$array = WinGetPos($title)
	IniWrite($userdotdat, "zmain", "coo1", $array[0])
	IniWrite($userdotdat, "zmain", "coo2", $array[1])
	Exit
EndFunc
Func maximize()
    GuiSetState(@SW_Show, $Form1)
    TraySetState(2)
EndFunc
Func update_gui()
	GUICtrlSetData($Combo_res, getSupportedRes(), IniRead($userdotdat, "main", "screen_width", 800) & " " & IniRead($userdotdat, "main", "screen_height", 600))
	If IniRead($userdotdat, "zmain", "top", 0) == 1 Then
		GUICtrlSetState($MenuItem_ontop, $GUI_CHECKED)
		WinSetOnTop($title, "", 1)
	EndIf
	If IniRead($userdotdat, "zmain", "quit", 0) == 1 Then GUICtrlSetState($MenuItem_quiton, $GUI_CHECKED)
	If IniRead($userdotdat, "zmain", "mode", 0) == 1 Then
		GUICtrlSetState($MenuItem_shard, $GUI_CHECKED)
		GUICtrlSetState($MenuItem_official, $GUI_UNCHECKED)
		_GUICtrlIpAddress_ShowHide($IPAddress_, @SW_SHOW)
		GUICtrlSetState($Input_port, $GUI_SHOW)
		GUICtrlSetState($Combo_char, $GUI_HIDE)
	EndIf
	If IniRead($userdotdat, "main", "windowed", 0) == 0 Then GUICtrlSetState($Checkbox_winmode, $GUI_CHECKED)
	refresh_combo_chars()
	refresh_combo_accounts()
	GUICtrlSetData($Input_port, IniRead($userdotdat, "zmain", "port", 0))
	_GUICtrlIpAddress_Set($IPAddress_, IniRead($userdotdat, "zmain", "ip", "0.0.0.0"))
	GUICtrlSetData($Combo_account, _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))), _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))))
EndFunc
Func refresh_combo_chars()
	Local $array[10]
	Local $string = "No Thank You"
	Local $default = IniRead($userdotdat, "quick", "setentry", "0")
	For $i = 0 To 9
		$array[$i] = IniRead($userdotdat, "quick", "entry" & $i, "")
		$string = $string & "|" & $array[$i]
	Next
	If $default == 0 Then
		$default = "No Thank You"
	Else
		$default = $array[$default - 1]
	EndIf
	GUICtrlSetData($Combo_char, "")
	GUICtrlSetData($Combo_char, $string, $default)
EndFunc
Func refresh_combo_accounts()
	Local $array = IniReadSection($userdotdat, "zdata")
	GUICtrlSetData($Combo_account, "")
	If @error == 1 Or $array == 1 Then
		GUICtrlSetData($Combo_account, "No account selected", "No account selected")
	Else
		$string = "No account selected|"
		For $i = 1 To $array[0][0]
			$string = $string & _StringEncrypt(0, $array[$i][0]) & "|"
		Next
		GUICtrlSetData($Combo_account, $string, "No account selected")
	EndIf
EndFunc
Func path_generator($mode)
	Local $array[2] = ["official", "shard"]
	Local $path = FileOpenDialog("Select the " & $array[$mode] & " DAoC client", @HomeDrive, "(camelot.exe)", "", "camelot.exe", $Form1)
	If $path <> "" Then IniWrite($userdotdat, "zmain", "path_" & $array[$mode], $path)
EndFunc
Func set_last_account()
	IniWrite($userdotdat, "zmain", "last", _StringEncrypt(1, GUICtrlRead($Combo_account)))
	If IniRead($userdotdat, "zmain", "quit", 0) == 1 Then Exit
EndFunc
Func mutex_killer()
	Local $file
	Local $hex
	If IsAdmin() <> 1 Then GUICtrlSetData($Label_, "No admin priv. !")
	FileInstall("C:\ZZZ\AUTOIT\DAoC_Starter\handle.exe", $path & "\handle.exe")
	FileInstall("C:\ZZZ\AUTOIT\DAoC_Starter\Eula.txt", $path & "\Eula.txt")
	Local $array = ProcessList("game.dll")
	If IsArray($array) == 1 Then
		For $i = 1 To $array[0][0]
			RunWait(@COMSPEC & ' /c "' & $path & '\handle" -a -p '& $array[$i][1] & ' >> zzz.txt', $path, @SW_HIDE)
			$file = FileOpen($path & "\zzz.txt", 0)
			If $file = -1 Then Return
			While 1
				$line = FileReadLine($file)
				If @error = -1 Then ExitLoop
				If StringInStr($line, "BaseNamedObjects\DAoCi") <> 0 Then
					$line = StringStripWS($line, 8)
					$hex = StringSplit($line, ":")
					ShellExecuteWait($path & "\handle.exe", "-c " & $hex[1] & " -y -p " & $array[$i][1], $path, Default, @SW_HIDE)
				EndIf
			Wend
			FileClose($file)
			FileDelete($path & "\zzz.txt")
		Next
	EndIf
EndFunc
Func array_compresser($a, $string)
	Dim $array[UBound($a) + 1]
	For $i = 0 To UBound($a) - 1
		$array[$i] = $a[$i]
	Next
	$array[UBound($array) - 1] = ""
	For $i = 0 To UBound($a) - 1
		If $a[$i] <> $string Then
			$array[$i] = $a[$i]
		Else
			For $c = $i To UBound($a) - 1
				$array[$c] = $array[$c + 1]
			Next
			ExitLoop
		EndIf
	Next
	Return $array
EndFunc
Func refresh_list_accounts()
	Local $array = IniReadSection($userdotdat, "zdata")
	Local $string = ""
	If @error <> 1 Then
		For $i = 1 To $array[0][0]
			$string = $string & "|" & _StringEncrypt(0, $array[$i][0])
		Next
	EndIf
	GUICtrlSetData($List_account, $string)
EndFunc
Func refresh_combo_sounds()
	Local $temp = IniRead($userdotdat, "sound", "item1", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Combo_sound, "full", "full")
		Case 10
			GUICtrlSetData($Combo_sound, "off", "off")
		Case Else
			GUICtrlSetData($Combo_sound, 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($userdotdat, "sound", "item2", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Combo_music, "full", "full")
		Case 10
			GUICtrlSetData($Combo_music, "off", "off")
		Case Else
			GUICtrlSetData($Combo_music, 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($userdotdat, "sound", "item3", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Combo_ambient_s, "full", "full")
		Case 10
			GUICtrlSetData($Combo_ambient_s, "off", "off")
		Case Else
			GUICtrlSetData($Combo_ambient_s, 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($userdotdat, "sound", "item4", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Combo_ambient_m, "full", "full")
		Case 10
			GUICtrlSetData($Combo_ambient_m, "off", "off")
		Case Else
			GUICtrlSetData($Combo_ambient_m, 10 - $temp, 10 - $temp)
	EndSwitch
EndFunc