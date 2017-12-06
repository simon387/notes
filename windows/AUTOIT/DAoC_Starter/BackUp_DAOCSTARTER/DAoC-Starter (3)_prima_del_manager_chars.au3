#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=i.ico
#AutoIt3Wrapper_Outfile=..\..\Public\DAoC-Starter.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#region ### include section ###
#include <libs.au3>; 1 cripta; 0 decripta ;#include <_ControlHover.au3>
#endregion
_Singleton('DAoC-Starter.au3')
Global Const $title = 'DAoC Starter 1.113.17'
Global $path = @AppDataDir & '\Electronic Arts\Dark Age of Camelot\LotM', $userdotdat = $path & '\user.dat'
Global $coo[2] = [IniRead($userdotdat, "zmain", "coo1", 1), IniRead($userdotdat, "zmain", "coo2", 1)]
If $coo[0] > @DesktopWidth  Or $coo[0] < 0 Then $coo[0] = 1
If $coo[1] > @DesktopHeight Or $coo[1] < 0 Then $coo[1] = 1
#Region ### Koda GUI section ###
$Form1 = GUICreate($title, 332, 115, $coo[0], $coo[1])
$MenuItem_settings = GUICtrlCreateMenu("&Settings")
$MenuItem_servermode = GUICtrlCreateMenu("Server mode", $MenuItem_settings)
$MenuItem_official = GUICtrlCreateMenuItem("Official", $MenuItem_servermode, $MenuItem_settings, 1)
$MenuItem_shard = GUICtrlCreateMenuItem("Shard", $MenuItem_servermode, $MenuItem_settings, 1)
$MenuItem_optionofficial = GUICtrlCreateMenu("Official server options", $MenuItem_settings)
$MenuItem_editofficialpath = GUICtrlCreateMenuItem("Edit client path", $MenuItem_optionofficial)
$MenuItem_patch = GUICtrlCreateMenuItem("Patch client", $MenuItem_optionofficial)
$MenuItem_optionsshard = GUICtrlCreateMenu("Shard server options", $MenuItem_settings)
$MenuItem_editshardpath = GUICtrlCreateMenuItem("Edit path", $MenuItem_optionsshard)
$MenuItem_manage = GUICtrlCreateMenuItem("Manage accounts", $MenuItem_settings)
$MenuItem_manageChars = GUICtrlCreateMenuItem("Manage chars", $MenuItem_settings)
$MenuItem_adv = GUICtrlCreateMenuItem("Advanced options", $MenuItem_settings)
$MenuItem_delete = GUICtrlCreateMenuItem("Delete entry", $MenuItem_settings)
$MenuItem_change = GUICtrlCreateMenuItem("Change user.dat path", $MenuItem_settings)
$MenuItem_start = GUICtrlCreateMenuItem('Start DAoC Starter on system startup', $MenuItem_settings)
$MenuItem_quiton = GUICtrlCreateMenuItem("Quit on client start", $MenuItem_settings)
$MenuItem_view = GUICtrlCreateMenu("Vie&w")
$MenuItem_f5 = GUICtrlCreateMenuItem("Refresh", $MenuItem_view)
$MenuItem_opacity = GUICtrlCreateMenu("Set opacity", $MenuItem_view)
$MenuItem_10 = GUICtrlCreateMenuItem("10%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_20 = GUICtrlCreateMenuItem("20%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_30 = GUICtrlCreateMenuItem("30%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_40 = GUICtrlCreateMenuItem("40%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_50 = GUICtrlCreateMenuItem("50%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_60 = GUICtrlCreateMenuItem("60%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_70 = GUICtrlCreateMenuItem("70%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_80 = GUICtrlCreateMenuItem("80%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_90 = GUICtrlCreateMenuItem("90%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_100 = GUICtrlCreateMenuItem("100%", $MenuItem_opacity, $MenuItem_view, 1)
$MenuItem_ontop = GUICtrlCreateMenuItem("Always on top", $MenuItem_view)
$MenuItem_tools = GUICtrlCreateMenu("T&ools")
$MenuItem_screen = GUICtrlCreateMenuItem("Show screenshots directory", $MenuItem_tools)
$MenuItem_user = GUICtrlCreateMenuItem("Open user settings directory", $MenuItem_tools)
$MenuItem_userdotdat = GUICtrlCreateMenuItem("Edit user.dat", $MenuItem_tools)
$MenuItem_backup = GUICtrlCreateMenuItem("Back up settings and screenshots", $MenuItem_tools)
$MenuItem_loki = GUICtrlCreateMenuItem("Delete Loki2 register keys", $MenuItem_tools)
$MenuItem_limiter = GUICtrlCreateMenuItem("Remove clients limiter", $MenuItem_tools)
$MenuItem_free = GUICtrlCreateMenuItem("Kill all clients, death processes and free up memory", $MenuItem_tools)
$MenuItem_vent = GUICtrlCreateMenu("&Ventrilo")
$MenuItem_ventstart = GUICtrlCreateMenuItem("Start", $MenuItem_vent)
$MenuItem_ventpath = GUICtrlCreateMenuItem("Edit path", $MenuItem_vent)
$MenuItem_ventbackup = GUICtrlCreateMenuItem("Back up", $MenuItem_vent)
$MenuItem_ts3 = GUICtrlCreateMenu("&TS3")
$MenuItem_ts3start = GUICtrlCreateMenuItem("Start", $MenuItem_ts3)
$MenuItem_ts3path = GUICtrlCreateMenuItem("Edit path", $MenuItem_ts3)
$MenuItem_irc = GUICtrlCreateMenu("&IRC")
$MenuItem_ircclient = GUICtrlCreateMenuItem("IRC client", $MenuItem_irc)
$MenuItem_irchelp = GUICtrlCreateMenuItem("IRC help", $MenuItem_irc)
$MenuItem_info = GUICtrlCreateMenu("&?")
$MenuItem_update = GUICtrlCreateMenuItem("Check for update", $MenuItem_info)
$MenuItem_about1 = GUICtrlCreateMenuItem("About security", $MenuItem_info)
$MenuItem_about2 = GUICtrlCreateMenuItem("About DAoC Starter", $MenuItem_info)
$Button_start = GUICtrlCreateButton("Start", 10, 12, 68, 21)
$Combo_res = GUICtrlCreateCombo("", 84, 12, 84, 25, 323);67
$Checkbox_winmode = GUICtrlCreateCheckbox("Fullscreen", 177, 14, 71, 17)
$Combo_account = GUICtrlCreateCombo("", 10, 42, 158, 25, 323);67
$Combo_char = GUICtrlCreateCombo("", 176, 42, 143, 25, 67)
$Button_kill = GUICtrlCreateButton("Kill client", 251, 12, 68, 21)
$Input_port = GUICtrlCreateInput('', 285, 42, 34, 21, 8321);BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER)
$IPAddress_ = _GUICtrlIpAddress_Create($Form1, 176, 42, 103, 21);_GUICtrlIpAddress_Set($IPAddress_, "0.0.0.0")
$Label_ = GUICtrlCreateLabel("Welcome to DAoC Starter", 4, 74, 322, 17, 1);$SS_CENTER
GUICtrlCreateGroup('', 4, 0, 323, 72)
#EndRegion
updateGui()
refreshComboAccounts()
GUISetState(@SW_SHOW, $Form1)
GUICtrlSetTip($Button_start, "Start a DAoC's client")
GUICtrlSetTip($Combo_res, "Select game's resolution")
GUICtrlSetTip($Checkbox_winmode, "Check to play fullscreen")
GUICtrlSetTip($Combo_account, "Select an account")
GUICtrlSetTip($Combo_char, "Select a quick-login")
GUICtrlSetTip($Button_kill, "Kill a DAoC's client")
GUICtrlSetTip($Input_port, "This is the shard's port")
GUICtrlSetState($MenuItem_100, $GUI_CHECKED)
Global Const $sDaoc = 'Dark Age of Camelot © 2001';-2012 Electronic Arts Inc. All Rights Reserved.'
Global $clientList = WinList($sDaoc), $Form2[7], $Form3[15], $Form4[4], $Form5[2], $Form6[5]
Opt('TrayOnEventMode', 1)
Opt('TrayMenuMode', 1)
Opt('GUIOnEventMode', 1)
TraySetOnEvent($TRAY_EVENT_PRIMARYUP, "maximize")
GUISetOnEvent($GUI_EVENT_CLOSE, "closeClicked", $Form1)
GUISetOnEvent($GUI_EVENT_MINIMIZE, "minimize", $Form1)
GUICtrlSetOnEvent($MenuItem_update, 'updateLink')
GUICtrlSetOnEvent($MenuItem_about1, 'info')
GUICtrlSetOnEvent($MenuItem_about2, 'info')
GUICtrlSetOnEvent($MenuItem_irchelp, 'ircHelp')
GUICtrlSetOnEvent($MenuItem_ircclient, 'ircStart')
GUICtrlSetOnEvent($MenuItem_ventstart, 'ventStart')
GUICtrlSetOnEvent($MenuItem_ventpath, 'setVentPath')
GUICtrlSetOnEvent($MenuItem_ventbackup, 'ventBackUp')
GUICtrlSetOnEvent($MenuItem_screen, 'openScreenShotsDir')
GUICtrlSetOnEvent($MenuItem_user, 'openUserDir')
GUICtrlSetOnEvent($MenuItem_userdotdat, 'editUserDotDat')
GUICtrlSetOnEvent($MenuItem_backup, 'backUP')
GUICtrlSetOnEvent($MenuItem_loki, 'regedit')
GUICtrlSetOnEvent($MenuItem_ontop, 'setOnTop')
GUICtrlSetOnEvent($MenuItem_10, 'setTrans')
GUICtrlSetOnEvent($MenuItem_20, 'setTrans')
GUICtrlSetOnEvent($MenuItem_30, 'setTrans')
GUICtrlSetOnEvent($MenuItem_40, 'setTrans')
GUICtrlSetOnEvent($MenuItem_50, 'setTrans')
GUICtrlSetOnEvent($MenuItem_60, 'setTrans')
GUICtrlSetOnEvent($MenuItem_70, 'setTrans')
GUICtrlSetOnEvent($MenuItem_80, 'setTrans')
GUICtrlSetOnEvent($MenuItem_90, 'setTrans')
GUICtrlSetOnEvent($MenuItem_100, 'setTrans')
GUICtrlSetOnEvent($MenuItem_quiton, 'setQuit')
GUICtrlSetOnEvent($MenuItem_start, 'setStartUp')
GUICtrlSetOnEvent($MenuItem_official, 'setServerMode')
GUICtrlSetOnEvent($MenuItem_shard, 'setServerMode')
GUICtrlSetOnEvent($MenuItem_editofficialpath, 'editPath')
GUICtrlSetOnEvent($MenuItem_editshardpath, 'editPath')
GUICtrlSetOnEvent($MenuItem_patch, 'patchClient')
GUICtrlSetOnEvent($Checkbox_winmode, 'setWinMode')
GUICtrlSetOnEvent($Combo_res, 'setRes')
GUICtrlSetOnEvent($Combo_char, 'actionComboChar')
GUICtrlSetOnEvent($Button_start, 'startClient')
GUICtrlSetOnEvent($Button_kill, 'killClient')
GUICtrlSetOnEvent($MenuItem_delete, 'deleteEntry')
GUICtrlSetOnEvent($MenuItem_manage, 'OpenAccountManager')
GUICtrlSetOnEvent($MenuItem_adv, 'openAdvancedOptions')
GUICtrlSetOnEvent($Input_port, 'setPort')
GUICtrlSetOnEvent($MenuItem_limiter, 'mutexKiller')
GUICtrlSetOnEvent($MenuItem_free, 'freeMem')
GUICtrlSetOnEvent($MenuItem_change, 'setUserDotDatPath')
GUICtrlSetOnEvent($MenuItem_f5, 'refreshComboAccounts')
GUICtrlSetOnEvent($MenuItem_ts3start, "tsStart")
GUICtrlSetOnEvent($MenuItem_ts3path, "tsEditPath")
GUICtrlSetOnEvent($Combo_account, 'checkAccount')
GUICtrlSetOnEvent($MenuItem_manageChars, 'manageChars')
_FileSysMonSetup(3, $path, "")
_FileSysMonSetDirMonPath($path)
_FileSysMonSetShellMonPath($userdotdat)

While True;80 on; 144 off
	$clientList = WinList($sDaoc)
	WinSetTitle($Form1, '', $title & ' [' & $clientList[0][0] & ']')
	_FileSysMonDirEventHandler()
	If UBound($clientList) == 1 Then
		If GUICtrlGetState($Button_kill) == 80 Then GUICtrlSetState($Button_kill, $GUI_DISABLE)
	Else
		If GUICtrlGetState($Button_kill) == 144 Then GUICtrlSetState($Button_kill, $GUI_ENABLE)
	EndIf
	Sleep(5000)
WEnd

Func manageChars()
	GUICtrlSetData($Label_, 'Starting Characters Database Manager')
	GUISetState(@SW_DISABLE, $Form1)
	$form6[0] = GUICreate("Characters Database Editor", 308, 181, 422, 252)
	$form6[1] = GUICtrlCreateList("", 8, 10, 139, 162)
	$form6[2] = GUICtrlCreateButton("Add new char", 158, 10, 139, 25)
	$form6[3] = GUICtrlCreateButton("Edit selected char", 158, 44, 139, 25)
	$form6[4] = GUICtrlCreateButton("Delete selected char", 158, 79, 139, 25)

EndFunc

Func _FileSysMonActionEvent($event_type, $event_id, $event_value)

	Local $event_type_name
	Local $fs_event = ObjCreate("Scripting.Dictionary")

	Switch $event_type
		Case 0
			$fs_event.item(Hex(0x00000001)) = "file added to the directory|FILE_ACTION_ADDED"
			$fs_event.item(Hex(0x00000002)) = "file removed from the directory|FILE_ACTION_REMOVED"
			$fs_event.item(Hex(0x00000003)) = "file was modified|FILE_ACTION_MODIFIED"
			$fs_event.item(Hex(0x00000004)) = "file was renamed old name|FILE_ACTION_RENAMED_OLD_NAME"
			$fs_event.item(Hex(0x00000005)) = "file was renamed new name|FILE_ACTION_RENAMED_NEW_NAME"
		Case 1
			$fs_event.item(Hex(0x00000001)) = "Non-folder item name changed|SHCNE_RENAMEITEM"
			$fs_event.item(Hex(0x00000002)) = "Non-folder item created|SHCNE_CREATE"
			$fs_event.item(Hex(0x00000004)) = "Non-folder item deleted|SHCNE_DELETE"
			$fs_event.item(Hex(0x00000008)) = "Folder created|SHCNE_MKDIR"
			$fs_event.item(Hex(0x00000010)) = "Folder removed|SHCNE_RMDIR"
			$fs_event.item(Hex(0x00000020)) = "Storage media inserted into a drive|SHCNE_MEDIAINSERTED"
			$fs_event.item(Hex(0x00000040)) = "Storage media removed from a drive|SHCNE_MEDIAREMOVED"
			$fs_event.item(Hex(0x00000080)) = "Drive removed|SHCNE_DRIVEREMOVED"
			$fs_event.item(Hex(0x00000100)) = "Drive added|SHCNE_DRIVEADD"
			$fs_event.item(Hex(0x00000200)) = "Local computer folder shared via the network|SHCNE_NETSHARE"
			$fs_event.item(Hex(0x00000400)) = "Local computer folder not shared via the network|SHCNE_NETUNSHARE"
			$fs_event.item(Hex(0x00000800)) = "Item or folder attributes have changed|SHCNE_ATTRIBUTES"
			$fs_event.item(Hex(0x00001000)) = "Folder content has changed|SHCNE_UPDATEDIR"
			$fs_event.item(Hex(0x00002000)) = "Folder or non-folder has changed|SHCNE_UPDATEITEM"
			$fs_event.item(Hex(0x00004000)) = "Computer disconnected from server|SHCNE_SERVERDISCONNECT"
			$fs_event.item(Hex(0x00008000)) = "System image list image has changed|SHCNE_UPDATEIMAGE"
			$fs_event.item(Hex(0x00010000)) = "Not used|SHCNE_DRIVEADDGUI"
			$fs_event.item(Hex(0x00020000)) = "Folder name has changed|SHCNE_RENAMEFOLDER"
			$fs_event.item(Hex(0x00040000)) = "Drive free space has changed|SHCNE_FREESPACE"
			$fs_event.item(Hex(0x0002381F)) = "SHCNE_DISKEVENTS"
			$fs_event.item(Hex(0x0C0581E0)) = "SHCNE_GLOBALEVENTS"
			$fs_event.item(Hex(0x7FFFFFFF)) = "SHCNE_ALLEVENTS"
			$fs_event.item(Hex(0x80000000)) = "SHCNE_INTERRUPT"
	EndSwitch

	if StringLen($fs_event.item(Hex($event_id))) > 0 Then
		$event_type_name = StringSplit($fs_event.item(Hex($event_id)), "|")
		$event_type_name[2] = $event_type_name[2] & "(" & $event_id & ")"
;~ 		MsgBox(0,0,$event_type_name[1]& " " & $event_type_name[2] & " " & $event_value & " ")
		updateGui()
;~ 		_GUICtrlListView_InsertItem($listview, , 0)
;~ 		_GUICtrlListView_SetItemText($listview, 0, , 1)
;~ 		_GUICtrlListView_SetItemText($listview, 0, , 2)
;~ 		_GUICtrlListView_SetItemText($listview, 0, @HOUR & ":" & @MIN & ":" & @SEC, 3)
	EndIf
EndFunc

Func checkAccount()
	If GUICtrlRead($Combo_account) == 'No account selected' Then
		GUICtrlSetState($Combo_char, $GUI_DISABLE)
	Else
		GUICtrlSetState($Combo_char, $GUI_ENABLE)
	EndIf
EndFunc

Func tsEditPath()
	GUICtrlSetData($Label_, "Setting TeamSpeak3's path")
	Local $temp = FileOpenDialog("Select TeamSpeak3 client", @HomeDrive, "(ts3client_win64.exe)|(ts3client_win32.exe)", "", "", $Form1)
	If $temp <> "" Then IniWrite($userdotdat, "zmain", "ts3", $temp)
EndFunc

Func tsStart()
	If IniRead($userdotdat, "zmain", "ts3", "") == "" Then IniWrite($userdotdat, "zmain", "ts3", FileOpenDialog("Select TeamSpeak3 client", @HomeDrive, "(ts3client_win64.exe)|(ts3client_win32.exe)", "", "", $Form1))
	If IniRead($userdotdat, "zmain", "ts3", "") <> "" Then ShellExecute(IniRead($userdotdat, "zmain", "ts3", ""), "-m")
	GUICtrlSetData($Label_, "http://teamspeak.com/")
EndFunc

Func setUserDotDatPath()
	Local $temp = FileOpenDialog("Select the user.dat", @HomeDrive, "All (*.*)", 3, "uset.dat", $Form1)
	If $temp <> 0 Then
		$userdotdat = $temp
		$path = StringReplace($temp, "/user.dat", "")
		_FileSysMonSetDirMonPath($path)
		_FileSysMonSetShellMonPath($userdotdat)
		GUICtrlSetData($Label_, "Done")
	Else
		GUICtrlSetData($Label_, "Aborted")
	EndIf
EndFunc

Func freeMem()
	While ProcessExists("game.dll") + ProcessExists("login.dll") <> 0
		ProcessClose("game.dll")
		ProcessClose("login.dll")
	WEnd
	GUICtrlSetData($Label_, "Done")
EndFunc

Func setPort()
	IniWrite($userdotdat, "zmain", "port", GUICtrlRead($Input_port))
EndFunc

Func openAdvancedOptions()
	GUICtrlSetData($Label_, "Showing more options")
	GUISetState(@SW_DISABLE, $Form1)
	$Form3[0] = GUICreate("Advanced Options", 570, 269, -1, -1)
	$Form3[1] = GUICtrlCreateCombo("", 145, 36, 145, 25, 67)
	$Form3[2] = GUICtrlCreateCombo("", 145, 67, 145, 25, 67)
	$Form3[3] = GUICtrlCreateCombo("", 145, 98, 145, 25, 67)
	$Form3[4] = GUICtrlCreateCombo("", 145, 129, 145, 25, 67)
	$Form3[5] = GUICtrlCreateCombo("", 145, 159, 145, 25, 67)
	$Form3[6] = GUICtrlCreateCombo("", 145, 190, 145, 25, 67)
	$Form3[7] = GUICtrlCreateCombo("", 145, 221, 145, 25, 67)
	$Form3[8] = GUICtrlCreateCombo("", 401, 36, 145, 25, 67)
	$Form3[9] = GUICtrlCreateCombo("", 401, 67, 145, 25, 67)
	$Form3[10] = GUICtrlCreateCombo("", 401, 98, 145, 25, 67)
	$Form3[11] = GUICtrlCreateCombo("", 401, 129, 145, 25, 67)
	$Form3[12] = GUICtrlCreateCombo("", 401, 159, 145, 25, 67)
	$Form3[13] = GUICtrlCreateCombo("", 401, 190, 145, 25, 67)
	$Form3[14] = GUICtrlCreateCombo("", 401, 221, 145, 25, 67)
	GUICtrlCreateGroup("Advanced Options", 12, 11, 547, 247)
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
	GUICtrlSetData($Form3[1], "on|off")
	GUICtrlSetData($Form3[2], "full|9|8|7|6|5|4|3|2|1|off")
	GUICtrlSetData($Form3[3], "full|9|8|7|6|5|4|3|2|1|off")
	GUICtrlSetData($Form3[4], "full|9|8|7|6|5|4|3|2|1|off")
	GUICtrlSetData($Form3[5], "full|9|8|7|6|5|4|3|2|1|off")
	GUICtrlSetData($Form3[6], "background|never|minimized")
	GUICtrlSetData($Form3[7], "none|all figures|self only|near 5 figures|near 10 figures")
	GUICtrlSetData($Form3[8], "on|low|high")
	GUICtrlSetData($Form3[9], "classic|SI|reflective")
	GUICtrlSetData($Form3[10], "low|medium|high")
	GUICtrlSetData($Form3[11], "often|occasional|seldom")
	GUICtrlSetData($Form3[12], "on|off")
	GUICtrlSetData($Form3[13], "on|off")
	GUICtrlSetData($Form3[14], "classic|catacombs")
	If IniRead($userdotdat, "character_version", "9-0", "0") == 0 Then
		GUICtrlSetData($Form3[14], "classic", "classic")
	Else
		GUICtrlSetData($Form3[14], "catacombs", "catacombs")
	EndIf
	If IniRead($userdotdat, "atlantis_internal", "item1", 0) == 0 Then
		GUICtrlSetData($Form3[13], "on", "on")
	Else
		GUICtrlSetData($Form3[13], "off", "off")
	EndIf
	If IniRead($userdotdat, "atlantis_internal", "item2", 0) == 0 Then
		GUICtrlSetData($Form3[12], "on", "on")
	Else
		GUICtrlSetData($Form3[12], "off", "off")
	EndIf
	Switch IniRead($userdotdat, "water", "item2", 0)
		Case 0
			GUICtrlSetData($Form3[11], "often", "often")
		Case 1
			GUICtrlSetData($Form3[11], "occasional", "occasional")
		Case 2
			GUICtrlSetData($Form3[11], "seldom", "seldom")
	EndSwitch
	Switch IniRead($userdotdat, "water", "item3", 0)
		Case 2
			GUICtrlSetData($Form3[10], "low", "low")
		Case 1
			GUICtrlSetData($Form3[10], "medium", "medium")
		Case 0
			GUICtrlSetData($Form3[10], "high", "high")
	EndSwitch
	Switch IniRead($userdotdat, "water", "item1", 0)
		Case 2
			GUICtrlSetData($Form3[9], "SI", "SI")
		Case 1
			GUICtrlSetData($Form3[9], "classic", "classic")
		Case 0
			GUICtrlSetData($Form3[9], "reflective", "reflective")
	EndSwitch
	Switch IniRead($userdotdat, "shadows", "item1", 0)
		Case 0
			GUICtrlSetData($Form3[8], "on", "on")
		Case 2
			GUICtrlSetData($Form3[8], "low", "low")
		Case 1
			GUICtrlSetData($Form3[8], "high", "high")
	EndSwitch
	Switch IniRead($userdotdat, "shadows", "item2", 0)
		Case 4
			GUICtrlSetData($Form3[7], "none", "none")
		Case 0
			GUICtrlSetData($Form3[7], "all figures", "all figures")
		Case 1
			GUICtrlSetData($Form3[7], "self only", "self only")
		Case 2
			GUICtrlSetData($Form3[7], "near 5 figures", "near 5 figures")
		Case 3
			GUICtrlSetData($Form3[7], "near 10 figures", "near 10 figures")
	EndSwitch
	Switch IniRead($userdotdat, "performance", "item7", 0)
		Case 1
			GUICtrlSetData($Form3[6], "background", "background")
		Case 2
			GUICtrlSetData($Form3[6], "never", "never")
		Case 0
			GUICtrlSetData($Form3[6], "minimized", "minimized")
	EndSwitch
	refreshComboSounds()
	If IniRead($userdotdat, "zsound", "volume", "on") == "on" Then
		GUICtrlSetData($Form3[1], "on", "on")
		GUICtrlSetState($Form3[2], $GUI_ENABLE)
		GUICtrlSetState($Form3[3], $GUI_ENABLE)
		GUICtrlSetState($Form3[4], $GUI_ENABLE)
		GUICtrlSetState($Form3[5], $GUI_ENABLE)
	Else
		GUICtrlSetData($Form3[1], "off", "off")
		GUICtrlSetState($Form3[2], $GUI_DISABLE)
		GUICtrlSetState($Form3[3], $GUI_DISABLE)
		GUICtrlSetState($Form3[4], $GUI_DISABLE)
		GUICtrlSetState($Form3[5], $GUI_DISABLE)
	EndIf
	GUISetState(@SW_SHOW, $Form3[0])
	GUISwitch($Form3[0])
	GUISetOnEvent($GUI_EVENT_CLOSE, 'closeAdvancedOptions', $Form3[0])
	GUICtrlSetOnEvent($Form3[1], 'setGeneralAudio')
	GUICtrlSetOnEvent($Form3[2], 'setComboSounds')
	GUICtrlSetOnEvent($Form3[3], 'setComboSounds')
	GUICtrlSetOnEvent($Form3[4], 'setComboSounds')
	GUICtrlSetOnEvent($Form3[5], 'setComboSounds')
	GUICtrlSetOnEvent($Form3[6], 'setCombo')
	GUICtrlSetOnEvent($Form3[7], 'setCombo')
	GUICtrlSetOnEvent($Form3[8], 'setCombo')
	GUICtrlSetOnEvent($Form3[9], 'setCombo')
	GUICtrlSetOnEvent($Form3[10], 'setCombo')
	GUICtrlSetOnEvent($Form3[11], 'setCombo')
	GUICtrlSetOnEvent($Form3[12], 'atlantisInternal')
	GUICtrlSetOnEvent($Form3[13], 'atlantisInternal')
	GUICtrlSetOnEvent($Form3[14], 'setCharVersion')
EndFunc

Func setCharVersion()
	Local $temp = 1
	If GUICtrlRead($Form3[14]) == "classic" Then $temp = 0
	IniWrite($userdotdat, "character_version", "500-0", $temp)
	For $i = 0 To 20
		IniWrite($userdotdat, "character_version", $i & "-0", $temp)
		IniWrite($userdotdat, "character_version", $i & "-1", $temp)
	Next
EndFunc

Func atlantisInternal()
	Local $c = 1
	If @GUI_CtrlId == $Form3[12] Then $c = 2
	If GUICtrlRead(@GUI_CtrlId) == "on" Then
		IniWrite($userdotdat, "atlantis_internal", "item" & $c, 0)
	Else
		IniWrite($userdotdat, "atlantis_internal", "item" & $c, 1)
	EndIf
EndFunc

Func setCombo()
	Local $temp = 1
	Switch @GUI_CtrlId
		Case $Form3[11]
			$temp = 2
		Case $Form3[10]
			$temp = 3
		Case $Form3[8]
			Switch GUICtrlRead($Form3[8])
				Case "on"
					IniWrite($userdotdat, "shadows", "item1", 0)
				Case "high"
					IniWrite($userdotdat, "shadows", "item1", 1)
				Case "low"
				IniWrite($userdotdat, "shadows", "item1", 2)
			EndSwitch
			Return
		Case $Form3[6]
			Switch GUICtrlRead($Form3[6])
				Case "background"
					IniWrite($userdotdat, "performance", "item7", 1)
				Case "minimized"
					IniWrite($userdotdat, "performance", "item7", 0)
				Case "never"
					IniWrite($userdotdat, "performance", "item7", 2)
			EndSwitch
			Return
		Case $Form3[7]
			Switch GUICtrlRead($Form3[7])
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
			Return
	EndSwitch
	Switch GUICtrlRead(@GUI_CtrlId)
		Case "reflective" Or "often" Or "high"
			IniWrite($userdotdat, "water", "item" & $temp, 0)
		Case "classic" Or "occasional" Or "medium"
			IniWrite($userdotdat, "water", "item" & $temp, 1)
		Case "SI" Or "seldom" Or "low"
			IniWrite($userdotdat, "water", "item" & $temp, 2)
	EndSwitch
EndFunc

Func setComboSounds()
	Local $temp = GUICtrlRead($Form3[5]), $c = 1
	Select
		Case @GUI_CtrlId = $Form3[2]
			$temp = GUICtrlRead($Form3[2])
			$c = 4
		Case @GUI_CtrlId = $Form3[3]
			$temp = GUICtrlRead($Form3[3])
			$c = 3
		Case @GUI_CtrlId = $Form3[4]
			$temp = GUICtrlRead($Form3[4])
			$c = 2
	EndSelect
	Switch $temp
		Case "full"
			IniWrite($userdotdat, "sound", "item" & $c, 0)
		Case "off"
			IniWrite($userdotdat, "sound", "item" & $c, 10)
		Case Else
			IniWrite($userdotdat, "sound", "item" & $c, -1 * ($temp - 10))
	EndSwitch
EndFunc

Func setGeneralAudio()
	If GUICtrlRead($Form3[1]) == "on" Then
		For $i = 2 To 5
			GUICtrlSetState($Form3[$i], $GUI_ENABLE)
			IniWrite($userdotdat, 'sound', 'item' & $i - 1, IniRead($userdotdat, 'zsound', 'item' & $i - 1, 0))
		Next
		IniWrite($userdotdat, "zsound", "volume", "on")
	Else
		For $i = 2 To 5
			GUICtrlSetState($Form3[$i], $GUI_DISABLE)
			IniWrite($userdotdat, 'zsound', 'item' & $i - 1, IniRead($userdotdat, 'sound', 'item' & $i - 1, 0))
			IniWrite($userdotdat, 'sound', 'item' & $i - 1, 10)
		Next
		IniWrite($userdotdat, "zsound", "volume", "off")
	EndIf
	refreshComboSounds()
EndFunc

Func openAccountManager()
	GUICtrlSetData($Label_, "Starting Accounts Database Manager")
	GUISetState(@SW_DISABLE, $Form1)
	$Form2[0] = GUICreate("Accounts Database Editor", 308, 181, -1, -1)
	$Form2[1] = GUICtrlCreateList("", 8, 10, 139, 162)
	$Form2[2] = GUICtrlCreateButton("Add new account", 158, 10, 139, 25)
	$Form2[3] = GUICtrlCreateButton("Edit selected account", 158, 44, 139, 25)
	$Form2[4] = GUICtrlCreateButton("Delete selected account", 158, 79, 139, 25)
	$Form2[5] = GUICtrlCreateButton("Show passwords!", 158, 113, 139, 25)
	$Form2[6] = GUICtrlCreateButton("Back", 158, 147, 139, 25)
	refreshAccountManager()
	GUISetState(@SW_SHOW, $Form2[0])
	GUISwitch($Form2[0])
	GUICtrlSetOnEvent($Form2[6], 'closeAccountManager')
	GUISetOnEvent($GUI_EVENT_CLOSE, 'closeAccountManager', $Form2[0])
	GUICtrlSetOnEvent($Form2[2], 'addAccount')
	GUICtrlSetOnEvent($Form2[3], 'editAccount')
	GUICtrlSetOnEvent($Form2[4], 'deleteAccount')
	GUICtrlSetOnEvent($Form2[5], 'showPasswords')
EndFunc

Func showPasswords()
	Local $array = IniReadSection($userdotdat, "zdata")
	If @error <> 1 Then
		Local $string = ""
		For $i = 1 To $array[0][0]
			$string &= _StringEncrypt(0, $array[$i][0]) & @TAB & _StringEncrypt(0, $array[$i][1]) & @CRLF
		Next
		$Form5[0] = GUICreate("Showing passwords", 267, 317, -1, -1)
		$Form5[1] = GUICtrlCreateEdit("... Loading ...", 0, 0, 267, 317)
		GUICtrlSetData($Form5[1], $string)
		GUISetState(@SW_DISABLE, $Form2[0])
		GUISetState(@SW_SHOW, $Form5[0])
		GUISwitch($Form5[0])
		GUISetOnEvent($GUI_EVENT_CLOSE, 'closeShowPassword', $Form5[0])
	EndIf
EndFunc

Func closeShowPassword()
	GUISetState(@SW_ENABLE, $Form2[0])
	GUIDelete($Form5[0])
	GUISwitch($Form2[0])
	GUISetState(@SW_SHOW, $Form2[0])
EndFunc

Func closeAdvancedOptions()
	GUISetState(@SW_ENABLE, $Form1)
	GUIDelete($Form3[0])
	GUISwitch($Form1)
	GUISetState(@SW_SHOW, $Form1)
EndFunc

Func closeAccountManager()
	GUISetState(@SW_ENABLE, $Form1)
	GUIDelete($Form2[0])
	GUISwitch($Form1)
	GUISetState(@SW_SHOW, $Form1)
EndFunc

Func closeKillClient()
	GUICtrlSetData($Button_kill, 'Kill client')
	GUICtrlSetState($Button_kill, $GUI_ENABLE)
	GUISetState(@SW_ENABLE, $Form1)
	GUIDelete($Form4[0])
	GUISwitch($Form1)
	GUISetState(@SW_SHOW, $Form1)
EndFunc

Func deleteAccount()
	Local $temp = GUICtrlRead($Form2[1])
	If $temp <> "" Then
		IniDelete($userdotdat, "zdata", _StringEncrypt(1, $temp))
		refreshAccountManager()
	EndIf
EndFunc

Func editAccount()
	Local $temp[3]
	$temp[0] = GUICtrlRead($Form2[1])
	If $temp[0] <> "" Then
		$temp[1] = InputBox("Editing account " & $temp[0], "Insert the new account ID", $temp[0], "", Default, Default, Default, Default, "", $Form2[0])
		If $temp[1] <> "" Then
			$temp[2] = InputBox("Editing account " & $temp[1], "Insert the new password", "", "*", Default, Default, Default, Default, "", $Form2[0])
			If $temp[2] <> "" Then
				IniDelete($userdotdat, "zdata", _StringEncrypt(1, $temp[0]))
				IniWrite($userdotdat, "zdata", _StringEncrypt(1, $temp[1]), _StringEncrypt(1, $temp[2]))
				refreshAccountManager()
			EndIf
		EndIf
	EndIf
EndFunc

Func addAccount()
	Local $temp[2]
	$temp[0] = InputBox("Adding a new account", "Insert the account ID", "", "", Default, Default, Default, Default, "", $Form2[0])
	If $temp[0] <> "" Then
		If IniRead($userdotdat, "zdata", $temp[0], "") == "" Then
			$temp[1] = InputBox("Adding a new account", "Insert the account password", "", "*", Default, Default, Default, Default, "", $Form2[0])
			If $temp[1] <> "" Then
				IniWrite($userdotdat, "zdata", _StringEncrypt(1, $temp[0]), _StringEncrypt(1, $temp[1]))
				refreshAccountManager()
			EndIf
		EndIf
	EndIf
EndFunc

Func deleteEntry()
	Local $temp = GUICtrlRead($Combo_char)
	If $temp == "No Thank You" Or $temp == "" Then
		GUICtrlSetData($Label_, "No entry to delete")
	Else
		Local $array[10], $flag = 0
		For $i = 0 To 9
			$array[$i] = IniRead($userdotdat, "quick", "entry" & $i, "")
		Next
		For $i = 0 To 9
			If $i == 9 Then
				$array[$i] = ' '
				ExitLoop
			EndIf
			If $array[$i] == $temp Or $flag == 1 Then
				$array[$i] = $array[$i + 1]
				$flag = 1
			EndIf
		Next
		For $i = 0 To 9
			IniWrite($userdotdat, "quick", "entry" & $i, $array[$i])
		Next
		GUICtrlSetData($Label_, "Deleted an entry")
		refreshComboChars()
	EndIf
EndFunc

Func killClient()
	$clientList = WinList($sDaoc)
	If $clientList[0][0] == 0 Then
		GUICtrlSetData($Label_, 'There are no clients to kill')
		Return
	EndIf
	If $clientList[0][0] == 1 Then
		ProcessClose('game.dll')
		GUICtrlSetState($Button_kill, $GUI_DISABLE)
		GUICtrlSetData($Label_, "Killed a DAoC's client")
		Return
	EndIf
	GUICtrlSetData($Button_kill, 'Killing...')
	GUICtrlSetState($Button_kill, $GUI_DISABLE)
	Local $string = ''
	For $i = 1 To $clientList[0][0]
		$string &= '|' & $i
	Next
	$Form4[0] = GUICreate("Select client to kill", 202, 72, -1, -1)
	$Form4[1] = GUICtrlCreateList("", 2, 5, 106, 58)
	$Form4[2] = GUICtrlCreateButton("Kill", 118, 5, 75, 25, 0)
	$Form4[3] = GUICtrlCreateButton("Back", 118, 38, 75, 25, 0)
	GUICtrlSetData($Form4[1], $string)
	GUISetState(@SW_DISABLE, $Form1)
	GUISetState(@SW_SHOW, $Form4[0])
	GUISwitch($Form4[0])
	GUISetOnEvent($GUI_EVENT_CLOSE, 'closeKillClient', $Form4[0])
	GUICtrlSetOnEvent($Form4[1], 'flashClient')
	GUICtrlSetOnEvent($Form4[2], 'killSelectedClient')
	GUICtrlSetOnEvent($Form4[3], 'closeKillClient')
EndFunc

Func killSelectedClient()
	If GUICtrlRead($Form4[1]) <> "" Then
		If (ProcessClose(WinGetProcess($clientList[GUICtrlRead($Form4[1])][1])) == 1) Then
			GUICtrlSetData($Label_, "Killed a DAoC's client")
			closeKillClient()
		EndIf
	EndIf
EndFunc

Func flashClient()
	If GUICtrlRead($Form4[1]) <> "" Then WinFlash($clientList[GUICtrlRead($Form4[1])][1], Default, 2, 50)
EndFunc

Func startClient()
	Local $audio = IniRead($userdotdat, 'sound', 'item1', 10)
	IniWrite($userdotdat, 'sound', 'item1', 10)
	GUISetState($GUI_DISABLE, $Form1)
	GUICtrlSetData($Button_start, 'Starting...')
	GUICtrlSetState($Button_start, $GUI_DISABLE)
	GUICtrlSetData($Label_, "Starting...")
	Local $flag = 0
	If IniRead($userdotdat, "zmain", "mode", 0) == 1 Then
		GUICtrlSetData($Label_, "Mode: shard")
		IniWrite($userdotdat, "zmain", "ip", _GUICtrlIpAddress_Get($IPAddress_))
		If IniRead($userdotdat, "zmain", "path_shard", "") == "" Then
			pathGenerator(1)
			If IniRead($userdotdat, "zmain", "path_shard", "") == "" Then
				$flag = 1
				GUICtrlSetData($Label_, "No path selected, aborting")
			EndIf
		EndIf
		If $flag == 0 Then
			If GUICtrlRead($Combo_account) == "No account selected" Then
				GUICtrlSetData($Label_, "No account selected, aborting")
			Else
				FileInstall("C:\Users\Simone\Dropbox\AUTOIT\DAoC_Starter\dolloader.exe", @TempDir & "\dolloader.exe")
				If ShellExecute(@TempDir & "\dolloader.exe ", """" & StringReplace(IniRead($userdotdat, "zmain", "path_shard", ""), "camelot.exe", "game.dll") & """ " & IniRead($userdotdat, "zmain", "ip", "0.0.0.0") & " " & IniRead($userdotdat, "zmain", "port", 0) & " 20 " & GUICtrlRead($Combo_account) & " " & _StringEncrypt(0, IniRead($userdotdat, "zdata", _StringEncrypt(1, GUICtrlRead($Combo_account)), "")), StringReplace(IniRead($userdotdat, "zmain", "path_shard", ""), "\camelot.exe", "")) == 1 Then
					GUICtrlSetData($Label_, "Done")
;~ 					setLastAccount()
				Else
					GUICtrlSetData($Label_, "Error on starting camelot.exe")
				EndIf
			EndIf
		EndIf
	Else
		mutexKiller()
		GUICtrlSetData($Label_, "Mode: official")
		While ProcessExists("login.dll") <> 0
			ProcessClose("login.dll")
			GUICtrlSetData($Label_, "Killing login.dll")
		WEnd
		While ProcessExists("camelot.bin") <> 0
			ProcessClose("camelot.bin")
			GUICtrlSetData($Label_, "Killing patcher")
		WEnd
		If IniRead($userdotdat, "zmain", "path_official", "") == "" Then
			pathGenerator(0)
			If IniRead($userdotdat, "zmain", "path_official", "") == "" Then
				$flag = 1
				GUICtrlSetData($Label_, "No path selected, aborting")
			EndIf
		EndIf
		If $flag == 0 Then
			Local $pid = Run(StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "camelot.exe", "login.dll"), StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "camelot.exe", ""))
			If GUICtrlRead($Combo_account) == "No account selected" Then
				ControlSend("Dark Age of Camelot", "", "[CLASS:Button; INSTANCE:1]", "{enter}")
				GUICtrlSetData($Label_, "Done")
;~ 				setLastAccount()
			Else
				If $pid == 0 Then
					GUICtrlSetData($Label_, "Error on starting camelot.exe")
				Else
					Local $win_handle = 0
					While $win_handle == 0
						Local $list = WinList("Dark Age of Camelot")
						If IsArray($list) == 1 Then
							For $i = 1 To $list[0][0]
								Local $size = WinGetClientSize($list[$i][1])
								If IsArray($size) == 1 Then
									If $size[0] == 413 And $size[1] == 258 Then $win_handle = $list[$i][1]
								EndIf
							Next
						EndIf
					WEnd
					If ControlSetText($win_handle, "", "[CLASS:Edit; INSTANCE:2]", GUICtrlRead($Combo_account)) == 1 Then
						GUICtrlSetData($Label_, "Account setted")
						If ControlSetText($win_handle, "", "[CLASS:Edit; INSTANCE:1]", _StringEncrypt(0, IniRead($userdotdat, "zdata", _StringEncrypt(1, GUICtrlRead($Combo_account)), ""))) Then
							GUICtrlSetData($Label_, "Password setted")
							;ControlSend("Dark Age of Camelot", "", "[CLASS:Button; INSTANCE:1]", "{enter}")
							ControlSend($win_handle, "", "[CLASS:Button; INSTANCE:1]", "{enter}")
							GUICtrlSetData($Label_, "Done")
;~ 							setLastAccount();If WinActivate($win_handle) <> 0 Then;If ControlSend($win_handle, "", "[CLASS:Edit; INSTANCE:1]", "{enter}") == 1 Then;While WinExists("End User License Agreement") <> 1;Sleep(10);WEnd;Sleep(10);If ControlSend("End User License Agreement", "", "[CLASS:Button; INSTANCE:1]", "{enter}") == 1 Then;While WinExists("Code of Conduct") <> 1;Sleep(10);WEnd;Sleep(10);If ControlSend("Code of Conduct", "", "[CLASS:Button; INSTANCE:1]", "{enter}") == 1 Then;GUICtrlSetData($Label_, "Done");setLastAccount();Else;GUICtrlSetData($Label_, "Error on Code of Conduct form");EndIf;Else;GUICtrlSetData($Label_, "Error on End User License Agreement form");EndIf;Else;GUICtrlSetData($Label_, "Error on setting login.dll form");EndIf;Else;GUICtrlSetData($Label_, "Error: lost win_handle");EndIf
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
	GUICtrlSetData($Button_start, 'Start')
	GUICtrlSetState($Button_start, $GUI_ENABLE)
	GUISetState($GUI_ENABLE, $Form1)
	IniWrite($userdotdat, 'sound', 'item1', $audio)
	IniWrite($userdotdat, "zmain", "last", _StringEncrypt(1, GUICtrlRead($Combo_account)))
	If IniRead($userdotdat, "zmain", "quit", 0) == 1 Then closeClicked()
EndFunc

Func actionComboChar()
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

Func setRes()
	Local $array = StringSplit(GUICtrlRead($Combo_res), ' ')
	IniWrite($userdotdat, "main", "screen_width", $array[1])
	IniWrite($userdotdat, "main", "screen_height", $array[2])
	GUICtrlSetData($Label_, "Resolution: " & $array[1] & ' x ' & $array[2])
EndFunc

Func setWinMode()
	If GUICtrlRead($Checkbox_winmode) == 1 Then
		IniWrite($userdotdat, "main", "windowed", 0)
		GUICtrlSetData($Label_, "Win mode off")
	Else
		IniWrite($userdotdat, "main", "windowed", 1)
		GUICtrlSetData($Label_, "Win mode on")
	EndIf
EndFunc

Func patchClient()
	GUICtrlSetData($Label_, "Attemping to patch camelot.exe")
	ShellExecute(IniRead($userdotdat, "zmain", "path_official", ""), "", StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "\camelot.exe", ""))
EndFunc

Func editPath()
	If @GUI_CtrlId == $MenuItem_editofficialpath Then
		GUICtrlSetData($Label_, "Editing official's path")
		pathGenerator(0)
	Else
		GUICtrlSetData($Label_, "Editing shard's path")
		pathGenerator(1)
	EndIf
EndFunc

Func setServerMode()
	If @GUI_CtrlId == $MenuItem_shard Then
		IniWrite($userdotdat, "zmain", "mode", 1)
		GUICtrlSetData($Label_, "Shard mode on")
	Else
		IniWrite($userdotdat, "zmain", "mode", 0)
		GUICtrlSetData($Label_, "Official mode on")
	EndIf
	updateGui()
EndFunc

Func setQuit()
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

Func setStartUp()
	If GUICtrlRead($MenuItem_start) == 65 Then
		GUICtrlSetState($MenuItem_start, $GUI_UNCHECKED)
		IniWrite($userdotdat, 'zmain', 'startup', 0)
		GUICtrlSetData($Label_, 'Start on system startup disabled')
		FileDelete(@StartupDir & '/' & @ScriptName & '.lnk')
	Else
		GUICtrlSetState($MenuItem_start, $GUI_CHECKED)
		IniWrite($userdotdat, 'zmain', 'startup', 1)
		GUICtrlSetData($Label_, 'Start on system startup enabled')
		FileCreateShortcut(@ScriptDir & '/' & @ScriptName, @StartupDir & '/' & @ScriptName)
	EndIf
EndFunc

Func setTrans()
	Local $temp = 10
	Select
		Case @GUI_CtrlId = $MenuItem_10
			$temp = 1
		Case @GUI_CtrlId = $MenuItem_20
			$temp = 2
		Case @GUI_CtrlId = $MenuItem_30
			$temp = 3
		Case @GUI_CtrlId = $MenuItem_40
			$temp = 4
		Case @GUI_CtrlId = $MenuItem_50
			$temp = 5
		Case @GUI_CtrlId = $MenuItem_60
			$temp = 6
		Case @GUI_CtrlId = $MenuItem_70
			$temp = 7
		Case @GUI_CtrlId = $MenuItem_80
			$temp = 8
		Case @GUI_CtrlId = $MenuItem_90
			$temp = 9
	EndSelect
	WinSetTrans($title, "", $temp * 25 + 5)
	GUICtrlSetData($Label_, "Opacity: " & $temp & "0%")
EndFunc

Func setOnTop()
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

Func regedit()
	If IsAdmin() <> 1 Then GUICtrlSetData($Label_, "No admin priv. !")
	If RegDelete("HKEY_CLASSES_ROOT\LOKI.Document", "Priority") == 1 Then
		GUICtrlSetData($Label_, "Registry correctly edited")
	Else
		GUICtrlSetData($Label_, "Unable to delete requested value")
	EndIf
EndFunc

Func backUP()
	GUICtrlSetData($Label_, "Back-up in progress...")
	Local $temp = FileSelectFolder("Select the destination of the back up", @HomeShare, 7) & "\DAoC_back_up"
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

Func editUserDotDat()
	Run("notepad.exe " & $userdotdat)
	GUICtrlSetData($Label_, "Opening user.dat")
EndFunc

Func openUserDir()
	ShellExecute($path)
	GUICtrlSetData($Label_, "Opening settings directory")
EndFunc

Func openScreenShotsDir()
	ShellExecute(@MyDocumentsDir & "\Electronic Arts\Dark Age of Camelot")
	GUICtrlSetData($Label_, "Opening screenshots directory")
EndFunc

Func ventBackUp()
	GUICtrlSetData($Label_, "Starting ventrilo's back-up")
	DirCopy(StringReplace($path, "\Electronic Arts\Dark Age of Camelot\LotM", "\Ventrilo"), FileSelectFolder("Select the destination of the back up", @HomeShare, 7) & "\Ventrilo_back_up", 1)
EndFunc

Func setVentPath()
	GUICtrlSetData($Label_, "Setting Ventrilo's path")
	Local $temp = FileOpenDialog("Select Ventrilo client", @HomeDrive, "(ventrilo.exe)", "", "", $Form1)
	If $temp <> "" Then IniWrite($userdotdat, "zmain", "vent", $temp)
EndFunc

Func ventStart()
	If IniRead($userdotdat, "zmain", "vent", "") == "" Then IniWrite($userdotdat, "zmain", "vent", FileOpenDialog("Select Ventrilo client", @HomeDrive, "(ventrilo.exe)", "", "", $Form1))
	If IniRead($userdotdat, "zmain", "vent", "") <> "" Then ShellExecute(IniRead($userdotdat, "zmain", "vent", ""), "-m")
	GUICtrlSetData($Label_, "www.ventrilo.com")
EndFunc

Func ircStart()
	FileInstall("C:\Users\Simone\Dropbox\AUTOIT\DAoC_Starter\wIRC_03.31.2009_alpha.jar", @TempDir & "\wIRC_03.31.2009_alpha.jar", 1)
	ShellExecute(@TempDir & "\wIRC_03.31.2009_alpha.jar");ShellExecute("http://www.sorcery.net/index.php?option=com_wrapper&view=wrapper&Itemid=69")
	GUICtrlSetData($Label_, "Starting IRC client")
EndFunc

Func ircHelp()
	ShellExecute("http://www.ircbeginner.com/ircinfo/ircc-commands.html")
	GUICtrlSetData($Label_, "www.ircbeginner.com")
EndFunc

Func info()
	If @GUI_CtrlId == $MenuItem_about2 Then
		MsgBox(64, "Informations & thanks to", "Created by Simon387." & @CR & @CR & "Testers and ideas: C@stro, hawk'~, Madcastah, Vindicare, Ferdi." & @CR & @CR & "Handle.exe Copyright (C) 1997-2012 Mark Russinovich." & @CR & "DOLLoader - DOL Project." & @CR & "Ventrilo© Flagship Industries, Inc. All right reserved." & @CR & "TeamSpeak© TeamSpeak Systems GmbH. All rights reserved." & @CR & "Dark Age of Camelot, Copyright (C) 2001-12 Mythic Entertainment, Inc." & @CR & "WIRC GNU General Public License v3", '', $Form1)
	Else
		MsgBox(64, "Informations about security", "User accounts, passwords and other settings are saved in the user.dat. They are encrypted, but for more security remember to do not share your user.dat.", "", $Form1)
	EndIf
EndFunc

Func updateLink()
	GUICtrlSetData($Label_, "Checking for updates")
	Local $temp = InetGet('http://dl.dropbox.com/u/15371921/update.ini', @TempDir & '\update.ini', 1)
	If $temp == 0 Then
		MsgBox(16, 'Error', 'Impossible to complete the update check', 0, $Form1)
		GUICtrlSetData($Label_, "Done")
	Else
		If IniRead(@TempDir & '\update.ini', 'section', 'version', -1) == $title Then
			MsgBox(64, 'Update check done', 'You already have the last version!', 0, $Form1)
			GUICtrlSetData($Label_, "Done")
		Else
			$temp = MsgBox(36, 'Update check done', 'A new version is avaible!' & @CRLF & IniRead(@TempDir & '\update.ini', 'section', 'version', -1) & @CRLF & @CRLF & 'Do you want to download it?', 0, $Form1)
			If $temp == 6 Then
				$temp = FileSelectFolder('Select the destination of the download', '', 4, '', $Form1)
				If $temp == '' Then Return
				GUICtrlSetData($Label_, "Downloading...")
				$temp = InetGet('http://dl.dropbox.com/u/15371921/DAoC-Starter.exe', $temp & '\DAoC-Starter.exe', 1)
				If $temp > 0 Then
					GUICtrlSetData($Label_, "Done")
				Else
					GUICtrlSetData($Label_, "Error on download")
				EndIf
			EndIf
		EndIf
	EndIf
EndFunc

Func minimize()
	GUISetState(@SW_HIDE, $Form1)
	TraySetState(1) ; show
	TraySetToolTip("DAoC Starter - click here to restore")
EndFunc

Func maximize()
	GUISetState(@SW_SHOW, $Form1)
	TraySetState(2)
EndFunc

Func closeClicked()
	Local $array = WinGetPos($title)
	If $array[0] < 0 Or $array[0] > @DesktopWidth Then $array[0] = 1
	If $array[1] < 0 Or $array[1] > @DesktopHeight Then $array[1] = 1
	IniWrite($userdotdat, "zmain", "coo1", $array[0])
	IniWrite($userdotdat, "zmain", "coo2", $array[1])
	Exit
EndFunc

Func updateGui()
	GUICtrlSetData($Combo_res, '')
	GUICtrlSetData($Combo_res, getSupportedRes(), IniRead($userdotdat, "main", "screen_width", 800) & " " & IniRead($userdotdat, "main", "screen_height", 600))
	If IniRead($userdotdat, "zmain", "top", 0) == 1 Then
		GUICtrlSetState($MenuItem_ontop, $GUI_CHECKED)
		WinSetOnTop($title, "", 1)
	EndIf
	If IniRead($userdotdat, "zmain", "quit", 0) == 1 Then GUICtrlSetState($MenuItem_quiton, $GUI_CHECKED)
	If IniRead($userdotdat, 'zmain', 'startup', 0) == 1 Then GUICtrlSetState($MenuItem_start, $GUI_CHECKED)
	If IniRead($userdotdat, "zmain", "mode", 0) == 1 Then
		_WinAPI_ShowWindow($IPAddress_, @SW_SHOW)
		GUICtrlSetState($MenuItem_shard, $GUI_CHECKED)
		GUICtrlSetState($MenuItem_official, $GUI_UNCHECKED)
		GUICtrlSetState($Input_port, $GUI_SHOW)
		GUICtrlSetState($Combo_char, $GUI_HIDE)
	Else
		_WinAPI_ShowWindow($IPAddress_, @SW_HIDE)
		GUICtrlSetState($MenuItem_official, $GUI_CHECKED)
		GUICtrlSetState($MenuItem_shard, $GUI_UNCHECKED)
		GUICtrlSetState($Input_port, $GUI_HIDE)
		GUICtrlSetState($Combo_char, $GUI_SHOW)
	EndIf
	If IniRead($userdotdat, "main", "windowed", 0) == 0 Then GUICtrlSetState($Checkbox_winmode, $GUI_CHECKED)
	refreshComboChars()
;~ 	refreshComboAccounts()
	GUICtrlSetData($Input_port, IniRead($userdotdat, "zmain", "port", 0))
	_GUICtrlIpAddress_Set($IPAddress_, IniRead($userdotdat, "zmain", "ip", "127.0.0.1"))
;~ 	GUICtrlSetData($Combo_account, _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))), _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))))
;~ 	GUISetState(@SW_SHOW, $Form1)
EndFunc

Func refreshComboChars()
	Local $array[10], $string = "No Thank You", $temp = IniRead($userdotdat, "quick", "setentry", "0")
	For $i = 0 To 9
		$array[$i] = IniRead($userdotdat, "quick", "entry" & $i, "")
		$string &= "|" & $array[$i]
	Next
	If $temp == 0 Or $temp > 10 Then
		$temp = "No Thank You"
	Else
		$temp = $array[$temp - 1]
	EndIf
	GUICtrlSetData($Combo_char, "")
	GUICtrlSetData($Combo_char, $string, $temp)
EndFunc

Func refreshComboAccounts()
	Local $array = IniReadSection($userdotdat, "zdata")
	GUICtrlSetData($Combo_account, "")
	If @error == 1 Or $array == 1 Then
		GUICtrlSetData($Combo_account, "No account selected", "No account selected")
	Else
		Local $string = "No account selected|"
		For $i = 1 To $array[0][0]
			$string &= _StringEncrypt(0, $array[$i][0]) & "|"
		Next;$array = StringSplit($string, '|')
		GUICtrlSetData($Combo_account, $string, _StringEncrypt(0, $array[$i - 1][0]));, "No account selected"
		GUICtrlSetData($Combo_account, _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))), _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))))
	EndIf
EndFunc

Func pathGenerator($mode)
	Local $array[2] = ["official", "shard"], $path = FileOpenDialog("Select the " & $array[$mode] & " DAoC client", @HomeDrive, "(camelot.exe)", "", "camelot.exe", $Form1)
	If $path <> "" Then IniWrite($userdotdat, "zmain", "path_" & $array[$mode], $path)
EndFunc

;~ Func setLastAccount()IniWrite($userdotdat, "zmain", "last", _StringEncrypt(1, GUICtrlRead($Combo_account)))

Func mutexKiller()
	GUICtrlSetData($Label_, "Killing mutexs")
	If IsAdmin() <> 1 Then GUICtrlSetData($Label_, "No admin priv. !")
	FileInstall("C:\Users\Simone\Dropbox\AUTOIT\DAoC_Starter\handle.exe", @TempDir & "\handle.exe");FileInstall("C:\ZZZ\AUTOIT\DAoC_Starter\Eula.txt", $path & "\Eula.txt")
	Local $array = ProcessList("game.dll"), $file, $hex
	If IsArray($array) == 1 Then
		FileDelete(@TempDir & "\tmp")
		For $i = 1 To $array[0][0]
			RunWait(@ComSpec & ' /c "' & @TempDir & '\handle" -a -p ' & $array[$i][1] & ' >> tmp', @TempDir, @SW_HIDE)
			Local $file = FileOpen(@TempDir & "\tmp", 0)
			If $file = -1 Then Return
			While 1
				$line = FileReadLine($file)
				If @error = -1 Then ExitLoop
				If StringInStr($line, "BaseNamedObjects\DAoC") <> 0 Then;mutex delle #istanze e dell'IP_reame
					$line = StringStripWS($line, 8)
					$hex = StringSplit($line, ":")
					ShellExecuteWait(@TempDir & "\handle.exe", "-c " & $hex[1] & " -y -p " & $array[$i][1], @TempDir, Default, @SW_HIDE)
				EndIf
			WEnd
			FileClose($file)
			FileDelete(@TempDir & "\tmp")
		Next
	EndIf
	GUICtrlSetData($Label_, "Done")
EndFunc

Func refreshAccountManager()
	Local $array = IniReadSection($userdotdat, "zdata"), $string = ""
	If @error <> 1 Then
		For $i = 1 To $array[0][0]
			$string &= "|" & _StringEncrypt(0, $array[$i][0])
		Next
	EndIf
	GUICtrlSetData($Form2[1], $string)
	refreshComboAccounts()
EndFunc

Func refreshComboSounds()
	Local $temp = IniRead($userdotdat, "sound", "item1", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[5], "full", "full")
		Case 10
			GUICtrlSetData($Form3[5], "off", "off")
		Case Else
			GUICtrlSetData($Form3[5], 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($userdotdat, "sound", "item2", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[4], "full", "full")
		Case 10
			GUICtrlSetData($Form3[4], "off", "off")
		Case Else
			GUICtrlSetData($Form3[4], 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($userdotdat, "sound", "item3", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[3], "full", "full")
		Case 10
			GUICtrlSetData($Form3[3], "off", "off")
		Case Else
			GUICtrlSetData($Form3[3], 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($userdotdat, "sound", "item4", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[2], "full", "full")
		Case 10
			GUICtrlSetData($Form3[2], "off", "off")
		Case Else
			GUICtrlSetData($Form3[2], 10 - $temp, 10 - $temp)
	EndSwitch
EndFunc

Func getSupportedRes()
	Local $c = 0, $temp = '', $string = '', $dm = DllStructCreate("char dmDeviceName[32];ushort dmSpecVersion;ushort dmDriverVersion;short dmSize;ushort dmDriverExtra;dword dmFields;short dmOrientation;short dmPaperSize;short dmPaperLength;short dmPaperWidth;short dmScale;short dmCopies;short dmDefaultSource;short dmPrintQuality;short dmColor;short dmDuplex;short dmYResolution;short dmTTOption;short dmCollate;byte dmFormName[32];dword dmBitsPerPel;int dmPelsWidth;dword dmPelsHeight")
	DllStructSetData($dm, "dmSize", DllStructGetSize($dm))
	Do
		$DllRet = DllCall("user32.dll", "int", "EnumDisplaySettingsEx", "ptr", 0, "dword", $c, "ptr", DllStructGetPtr($dm), "dword", 0)
		$DllRet = $DllRet[0]
		$c += 1
		If DllStructGetData($dm, "dmPelsWidth") > 799 And StringInStr($temp, DllStructGetData($dm, "dmPelsWidth") & " " & DllStructGetData($dm, "dmPelsHeight")) == 0 Then
			$temp &= '+' & DllStructGetData($dm, "dmPelsWidth") & " " & DllStructGetData($dm, "dmPelsHeight") & '+'
			$string &= DllStructGetData($dm, "dmPelsWidth") & " " & DllStructGetData($dm, "dmPelsHeight") & '|'
		EndIf
	Until $DllRet = 0
	$dm = 0
	$temp = ''
	Return $string
EndFunc