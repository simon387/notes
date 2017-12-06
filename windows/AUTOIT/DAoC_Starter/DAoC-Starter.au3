#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=i.ico
#AutoIt3Wrapper_Outfile=..\..\..\Desktop\asd.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <libs.au3>
_Singleton('DAoC-Starter.au3')
Global Const $title = 'DAoC Starter 1.113.21'
Global $path = @AppDataDir & '\Electronic Arts\Dark Age of Camelot\LotM', $udd = $path & '\user.dat', $coo[2] = [IniRead($udd, "zmain", "coo1", 1), IniRead($udd, "zmain", "coo2", 1)]
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
$MenuItem_adv = GUICtrlCreateMenuItem("Advanced options", $MenuItem_settings);$MenuItem_delete = GUICtrlCreateMenuItem("Delete entry", $MenuItem_settings)
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
$MenuItem_gamma = GUICtrlCreateMenu('Gamma', $MenuItem_tools)
$MenuItem_decGamma = GUICtrlCreateMenuItem('decrease', $MenuItem_gamma)
$MenuItem_resetGamma = GUICtrlCreateMenuItem('reset', $MenuItem_gamma)
$MenuItem_incGamma = GUICtrlCreateMenuItem('increase', $MenuItem_gamma)
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
$Combo_account = GUICtrlCreateCombo("", 176, 42, 143, 25, 67);
$Combo_char = GUICtrlCreateCombo("", 10, 42, 158, 25, 67);323
$Button_kill = GUICtrlCreateButton("Kill client", 251, 12, 68, 21)
$Input_port = GUICtrlCreateInput('', 285, 42, 34, 21, 8321);BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER)
$IPAddress_ = _GUICtrlIpAddress_Create($Form1, 176, 42, 103, 21);_GUICtrlIpAddress_Set($IPAddress_, "0.0.0.0")
$Label_ = GUICtrlCreateLabel("Welcome to DAoC Starter", 4, 74, 322, 17, 1);$SS_CENTER
GUICtrlCreateGroup('', 4, 0, 323, 72)
#EndRegion
updateGui()
GUISetState(@SW_SHOW, $Form1)
#Region ### Tips
GUICtrlSetTip($Button_start, "Start a DAoC's client")
GUICtrlSetTip($Combo_res, "Select game's resolution")
GUICtrlSetTip($Checkbox_winmode, "Check to play fullscreen")
GUICtrlSetTip($Combo_account, "Select an account")
GUICtrlSetTip($Combo_char, "Select a quick-login")
GUICtrlSetTip($Button_kill, "Kill a DAoC's client")
GUICtrlSetTip($Input_port, "This is the shard's port")
#EndRegion ### Tips
GUICtrlSetState($MenuItem_100, $GUI_CHECKED)
Global Const $sDaoc = 'Dark Age of Camelot � 2001';-2012 Electronic Arts Inc. All Rights Reserved.'
Global $clientList = WinList($sDaoc), $Form2[7], $Form3[15], $Form4[4], $Form5[15]
Global $varGamma = 128
#Region ### events
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
GUICtrlSetOnEvent($Button_start, 'startClient')
GUICtrlSetOnEvent($Button_kill, 'killClient');GUICtrlSetOnEvent($MenuItem_delete, 'deleteEntry')
GUICtrlSetOnEvent($MenuItem_manage, 'OpenAccountManager')
GUICtrlSetOnEvent($MenuItem_adv, 'openAdvancedOptions')
GUICtrlSetOnEvent($Input_port, 'setPort')
GUICtrlSetOnEvent($MenuItem_limiter, 'mutexKiller')
GUICtrlSetOnEvent($MenuItem_free, 'freeMem')
GUICtrlSetOnEvent($MenuItem_change, 'setUserDotDatPath')
GUICtrlSetOnEvent($MenuItem_f5, 'refreshComboAccounts')
GUICtrlSetOnEvent($MenuItem_ts3start, "tsStart")
GUICtrlSetOnEvent($MenuItem_ts3path, "tsEditPath")
GUICtrlSetOnEvent($MenuItem_manageChars, 'manageChars')
GUICtrlSetOnEvent($Combo_account, 'matcherA')
GUICtrlSetOnEvent($Combo_char, 'matcherC')
GUICtrlSetOnEvent($MenuItem_incGamma, 'incGamma')
GUICtrlSetOnEvent($MenuItem_resetGamma, 'resetGamma')
GUICtrlSetOnEvent($MenuItem_decGamma, 'decGamma')
#EndRegion ### Events
While True
	$clientList = WinList($sDaoc)
	WinSetTitle($Form1, '', $title & ' [' & $clientList[0][0] & ']')
	If UBound($clientList) == 1 Then;80 on; 144 off
		If GUICtrlGetState($Button_kill) == 80 Then GUICtrlSetState($Button_kill, $GUI_DISABLE)
	Else
		If GUICtrlGetState($Button_kill) == 144 Then GUICtrlSetState($Button_kill, $GUI_ENABLE)
	EndIf
	Sleep(5000)
WEnd
#Region ### Men� GUI
Func tsEditPath()
	GUICtrlSetData($Label_, "Setting TeamSpeak3's path")
	Local $temp = FileOpenDialog("Select TeamSpeak3 client", @HomeDrive, "(ts3client_win64.exe)|(ts3client_win32.exe)", "", "", $Form1)
	If $temp <> "" Then IniWrite($udd, "zmain", "ts3", $temp)
EndFunc
Func tsStart()
	If IniRead($udd, "zmain", "ts3", "") == "" Then IniWrite($udd, "zmain", "ts3", FileOpenDialog("Select TeamSpeak3 client", @HomeDrive, "(ts3client_win64.exe)|(ts3client_win32.exe)", "", "", $Form1))
	If IniRead($udd, "zmain", "ts3", "") <> "" Then ShellExecute(IniRead($udd, "zmain", "ts3", ""), "-m")
	GUICtrlSetData($Label_, "http://teamspeak.com/")
EndFunc
Func setUserDotDatPath()
	Local $temp = FileOpenDialog("Select the user.dat", @HomeDrive, "All (*.*)", 3, "uset.dat", $Form1)
	If $temp <> 0 Then
		$udd = $temp
		$path = StringReplace($temp, "/user.dat", "")
		GUICtrlSetData($Label_, "Done")
	Else
		GUICtrlSetData($Label_, "Aborted")
	EndIf
EndFunc
Func freeMem()
	While ProcessExists("game.dll") + ProcessExists("login.dll") + ProcessExists('camelot.bin') <> 0
		ProcessClose("game.dll")
		ProcessClose("login.dll")
		ProcessClose('camelot.bin')
	WEnd
	GUICtrlSetData($Label_, "Done")
EndFunc
Func patchClient()
	GUICtrlSetData($Label_, "Attemping to patch camelot.exe")
	ShellExecute(IniRead($udd, "zmain", "path_official", ""), "", StringReplace(IniRead($udd, "zmain", "path_official", ""), "\camelot.exe", ""))
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
		IniWrite($udd, "zmain", "mode", 1)
		GUICtrlSetData($Label_, "Shard mode on")
	Else
		IniWrite($udd, "zmain", "mode", 0)
		GUICtrlSetData($Label_, "Official mode on")
	EndIf
	updateGui()
EndFunc
Func setQuit()
	If GUICtrlRead($MenuItem_quiton) == 65 Then
		GUICtrlSetState($MenuItem_quiton, $GUI_UNCHECKED)
		IniWrite($udd, "zmain", "quit", 0)
		GUICtrlSetData($Label_, "Quit on start option disabled")
	Else
		GUICtrlSetState($MenuItem_quiton, $GUI_CHECKED)
		IniWrite($udd, "zmain", "quit", 1)
		GUICtrlSetData($Label_, "Quit on start option enabled")
	EndIf
EndFunc
Func setStartUp()
	If GUICtrlRead($MenuItem_start) == 65 Then
		GUICtrlSetState($MenuItem_start, $GUI_UNCHECKED)
		IniWrite($udd, 'zmain', 'startup', 0)
		GUICtrlSetData($Label_, 'Start on system startup disabled')
		FileDelete(@StartupDir & '/' & @ScriptName & '.lnk')
	Else
		GUICtrlSetState($MenuItem_start, $GUI_CHECKED)
		IniWrite($udd, 'zmain', 'startup', 1)
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
		IniWrite($udd, "zmain", "top", 0)
		WinSetOnTop($title, "", 0)
		GUICtrlSetData($Label_, "On top mode disabled")
	Else
		GUICtrlSetState($MenuItem_ontop, $GUI_CHECKED)
		IniWrite($udd, "zmain", "top", 1)
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
	Run("notepad.exe " & $udd)
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
	If $temp <> "" Then IniWrite($udd, "zmain", "vent", $temp)
EndFunc
Func ventStart()
	If IniRead($udd, "zmain", "vent", "") == "" Then IniWrite($udd, "zmain", "vent", FileOpenDialog("Select Ventrilo client", @HomeDrive, "(ventrilo.exe)", "", "", $Form1))
	If IniRead($udd, "zmain", "vent", "") <> "" Then ShellExecute(IniRead($udd, "zmain", "vent", ""), "-m")
	GUICtrlSetData($Label_, "www.ventrilo.com")
EndFunc
Func ircStart()
	FileInstall("C:\Users\Simone\Google Drive\dev\AUTOIT\DAoC_Starter\wIRC_03.31.2009_alpha.jar", @TempDir & "\wIRC_03.31.2009_alpha.jar", 1)
	ShellExecute(@TempDir & "\wIRC_03.31.2009_alpha.jar");ShellExecute("http://www.sorcery.net/index.php?option=com_wrapper&view=wrapper&Itemid=69")
	GUICtrlSetData($Label_, "Starting IRC client")
EndFunc
Func ircHelp()
	ShellExecute("http://www.ircbeginner.com/ircinfo/ircc-commands.html")
	GUICtrlSetData($Label_, "www.ircbeginner.com")
EndFunc
Func info()
	If @GUI_CtrlId == $MenuItem_about2 Then
		MsgBox(64, "Informations & thanks to", "Created by Simon387." & @CR & @CR & "Testers and ideas: C@stro, hawk'~, Madcastah, Vindicare, Ferdi." & @CR & @CR & "Handle.exe Copyright (C) 1997-2012 Mark Russinovich." & @CR & "DOLLoader - DOL Project." & @CR & "Ventrilo� Flagship Industries, Inc. All right reserved." & @CR & "TeamSpeak� TeamSpeak Systems GmbH. All rights reserved." & @CR & "Dark Age of Camelot, Copyright (C) 2001-12 Mythic Entertainment, Inc." & @CR & "WIRC GNU General Public License v3", '', $Form1)
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
Func pathGenerator($mode)
	Local $array[2] = ["official", "shard"], $path = FileOpenDialog("Select the " & $array[$mode] & " DAoC client", @HomeDrive, "(camelot.exe)", "", "camelot.exe", $Form1)
	If $path <> "" Then IniWrite($udd, "zmain", "path_" & $array[$mode], $path)
EndFunc
Func mutexKiller()
	GUICtrlSetData($Label_, "Killing mutexs")
	If IsAdmin() <> 1 Then GUICtrlSetData($Label_, "No admin priv. !")
	FileInstall("C:\Users\Simone\Google Drive\dev\AUTOIT\DAoC_Starter\handle.exe", @TempDir & "\handle.exe");FileInstall("C:\ZZZ\AUTOIT\DAoC_Starter\Eula.txt", $path & "\Eula.txt")
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
#EndRegion ### Men� GUI
#Region ### Main GUI
Func realmSelector($string)
	Switch $string
		Case 'Albion'
			Return 1
		Case 'Hibernia'
			Return 3
		Case 'Midgard'
			Return 2
	EndSwitch
EndFunc
Func setPort()
	IniWrite($udd, "zmain", "port", GUICtrlRead($Input_port))
EndFunc
Func startClient()
	Local $audio = IniRead($udd, 'sound', 'item1', 10)
	IniWrite($udd, 'sound', 'item1', 10)
	GUISetState($GUI_DISABLE, $Form1)
	GUICtrlSetData($Button_start, 'Starting...')
	GUICtrlSetState($Button_start, $GUI_DISABLE)
	GUICtrlSetData($Label_, "Starting...")
	Local $flag = 0
	If IniRead($udd, "zmain", "mode", 0) == 1 Then
		GUICtrlSetData($Label_, "Mode: shard")
		IniWrite($udd, "zmain", "ip", _GUICtrlIpAddress_Get($IPAddress_))
		If IniRead($udd, "zmain", "path_shard", "") == "" Then
			pathGenerator(1)
			If IniRead($udd, "zmain", "path_shard", "") == "" Then
				$flag = 1
				GUICtrlSetData($Label_, "No path selected, aborting")
			EndIf
		EndIf
		If $flag == 0 Then
			If GUICtrlRead($Combo_account) == "No account selected" Then
				GUICtrlSetData($Label_, "No account selected, aborting")
			Else
				FileInstall("C:\Users\Simone\Google Drive\dev\AUTOIT\DAoC_Starter\dolloader.exe", @TempDir & "\dolloader.exe")
				If ShellExecute(@TempDir & "\dolloader.exe ", """" & StringReplace(IniRead($udd, "zmain", "path_shard", ""), "camelot.exe", "game.dll") & """ " & IniRead($udd, "zmain", "ip", "0.0.0.0") & " " & IniRead($udd, "zmain", "port", 0) & " 20 " & GUICtrlRead($Combo_account) & " " & _StringEncrypt(0, IniRead($udd, "zdata", _StringEncrypt(1, GUICtrlRead($Combo_account)), "")), StringReplace(IniRead($udd, "zmain", "path_shard", ""), "\camelot.exe", "")) == 1 Then
					GUICtrlSetData($Label_, "Done")
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
		If IniRead($udd, "zmain", "path_official", "") == "" Then
			pathGenerator(0)
			If IniRead($udd, "zmain", "path_official", "") == "" Then
				$flag = 1
				GUICtrlSetData($Label_, "No path selected, aborting")
			EndIf
		EndIf
		If $flag == 0 Then
			Local $pid = Run(StringReplace(IniRead($udd, "zmain", "path_official", ""), "camelot.exe", "login.dll"), StringReplace(IniRead($udd, "zmain", "path_official", ""), "camelot.exe", ""))
			If GUICtrlRead($Combo_account) == "No account selected" Then
				ControlSend("Dark Age of Camelot", "", "[CLASS:Button; INSTANCE:1]", "{enter}")
				GUICtrlSetData($Label_, "Done")
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
									If $size[0] == 550 And $size[1] == 318 Then $win_handle = $list[$i][1]
								EndIf
							Next
						EndIf
					WEnd
					If ControlSetText($win_handle, "", "[CLASS:Edit; INSTANCE:2]", GUICtrlRead($Combo_account)) == 1 Then
						GUICtrlSetData($Label_, "Account setted")
						If ControlSetText($win_handle, "", "[CLASS:Edit; INSTANCE:1]", _StringEncrypt(0, IniRead($udd, "zdata", _StringEncrypt(1, GUICtrlRead($Combo_account)), ""))) Then
							GUICtrlSetData($Label_, "Password setted")
							ControlSend($win_handle, "", "[CLASS:Button; INSTANCE:1]", "{enter}")
							GUICtrlSetData($Label_, "Done")
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
	IniWrite($udd, 'sound', 'item1', $audio)
	IniWrite($udd, "zmain", "last", _StringEncrypt(1, GUICtrlRead($Combo_account)))
	If IniRead($udd, "zmain", "quit", 0) == 1 Then closeClicked()
EndFunc
Func setRes()
	Local $array = StringSplit(GUICtrlRead($Combo_res), ' ')
	IniWrite($udd, "main", "screen_width", $array[1])
	IniWrite($udd, "main", "screen_height", $array[2])
	GUICtrlSetData($Label_, "Resolution: " & $array[1] & ' x ' & $array[2])
EndFunc
Func setWinMode()
	If GUICtrlRead($Checkbox_winmode) == 1 Then
		IniWrite($udd, "main", "windowed", 0)
		GUICtrlSetData($Label_, "Win mode off")
	Else
		IniWrite($udd, "main", "windowed", 1)
		GUICtrlSetData($Label_, "Win mode on")
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
	IniWrite($udd, "zmain", "coo1", $array[0])
	IniWrite($udd, "zmain", "coo2", $array[1])
	IniWrite($udd, 'zmain', 'last_char', GUICtrlRead($Combo_char))
	Exit
EndFunc
Func updateGui()
	GUICtrlSetData($Combo_res, '')
	GUICtrlSetData($Combo_res, getSupportedRes(), IniRead($udd, "main", "screen_width", 800) & " " & IniRead($udd, "main", "screen_height", 600))
	If IniRead($udd, "zmain", "top", 0) == 1 Then
		GUICtrlSetState($MenuItem_ontop, $GUI_CHECKED)
		WinSetOnTop($title, "", 1)
	EndIf
	If IniRead($udd, "zmain", "quit", 0) == 1 Then GUICtrlSetState($MenuItem_quiton, $GUI_CHECKED)
	If IniRead($udd, 'zmain', 'startup', 0) == 1 Then GUICtrlSetState($MenuItem_start, $GUI_CHECKED)
	If IniRead($udd, "zmain", "mode", 0) == 1 Then
		_WinAPI_ShowWindow($IPAddress_, @SW_SHOW)
		GUICtrlSetState($MenuItem_shard, $GUI_CHECKED)
		GUICtrlSetState($MenuItem_official, $GUI_UNCHECKED)
		GUICtrlSetState($Input_port, $GUI_SHOW)
		GUICtrlSetState($Combo_account, $GUI_HIDE)
	Else
		_WinAPI_ShowWindow($IPAddress_, @SW_HIDE)
		GUICtrlSetState($MenuItem_official, $GUI_CHECKED)
		GUICtrlSetState($MenuItem_shard, $GUI_UNCHECKED)
		GUICtrlSetState($Input_port, $GUI_HIDE)
		GUICtrlSetState($Combo_account, $GUI_SHOW)
	EndIf
	If IniRead($udd, "main", "windowed", 0) == 0 Then GUICtrlSetState($Checkbox_winmode, $GUI_CHECKED)
	refreshComboChars()
	refreshComboAccounts()
	GUICtrlSetData($Input_port, IniRead($udd, "zmain", "port", 0))
	_GUICtrlIpAddress_Set($IPAddress_, IniRead($udd, "zmain", "ip", "127.0.0.1"))
	matcherC()
	matcherA()
EndFunc
Func matcherA()
	Local Const $account = GUICtrlRead($Combo_account)
	Local Const $char = GUICtrlRead($Combo_char)
	If $account == 'No account selected' Then
		GUICtrlSetData($Combo_char, 'No Thank You')
		quicksetter()
		Return
	EndIf
	$array = StringSplit(StringStripWS($char, 8), ',')
	If IsArray($array) And UBound($array) > 4 Then
		If $array[7] <> $account Then GUICtrlSetData($Combo_char, 'No Thank You')
	EndIf
	quicksetter()
EndFunc
Func matcherC()
	Local Const $char = GUICtrlRead($Combo_char)
	If $char == 'No Thank You' Then
		quicksetter()
		Return
	EndIf
	Local $array = StringSplit(StringStripWS($char, 8), ',')
	If $array[7] <> GUICtrlRead($Combo_account) Then
		$a2 = IniReadSection($udd, 'zdata')
		If IsArray($a2) And UBound($a2) > 0 Then
			For $i = 1 To $a2[0][0]
				If _StringEncrypt(0, $a2[$i][0]) == $array[7] Then
					GUICtrlSetData($Combo_account, $array[7])
					ExitLoop
				EndIf
			Next
		EndIf
	EndIf
	quicksetter()
EndFunc
Func quicksetter()
	If GUICtrlRead($Combo_char) == 'No Thank You' Then
		IniWrite($udd, 'quick', 'setentry', 0)
	Else
		IniWrite($udd, 'quick', 'setentry', 1)
		Local $string = StringStripWS(GUICtrlRead($Combo_char), 8)
		$string = StringSplit($string, ',')
		IniWrite($udd, 'quick', 'entry0', $string[1] & ', ' & $string[2] & ', ' & $string[3] & ', ' & $string[4] & ', ' & realmSelector($string[5]) & ', ' & $string[6])
	EndIf
EndFunc
Func refreshComboChars()
	Local Const $array = IniReadSection($udd, 'chars')
	Local $string = 'No Thank You'
	If IsArray($array) == 1 And UBound($array) > 0 Then
		For $i = 1 To $array[0][0]
			$string &= '|' & $array[$i][1]
		Next
	EndIf
	GUICtrlSetData($Combo_char, '')
	GUICtrlSetData($Combo_char, $string, IniRead($udd, 'zmain', 'last_char', ''))
	If GUICtrlRead($Combo_char) == '' Then
		GUICtrlSetData($Combo_char, '')
		GUICtrlSetData($Combo_char, $string, 'No Thank You')
	EndIf	;matcherA();;senza test
EndFunc
Func refreshComboAccounts()
	Local $array = IniReadSection($udd, "zdata")
	GUICtrlSetData($Combo_account, "")
	If @error == 1 Or $array == 1 Then
		GUICtrlSetData($Combo_account, "No account selected", "No account selected")
	Else
		Local $string = "No account selected|"
		For $i = 1 To $array[0][0]
			$string &= _StringEncrypt(0, $array[$i][0]) & "|"
		Next
		GUICtrlSetData($Combo_account, $string, _StringEncrypt(0, $array[$i - 1][0]));, "No account selected"
		GUICtrlSetData($Combo_account, _StringEncrypt(0, IniRead($udd, "zmain", "last", _StringEncrypt(1, "No account selected"))), _StringEncrypt(0, IniRead($udd, "zmain", "last", _StringEncrypt(1, "No account selected"))))
	EndIf	;matcherC();;modifica
EndFunc
Func refreshAccountManager()
	Local $array = IniReadSection($udd, "zdata"), $string = ""
	If @error <> 1 Then
		For $i = 1 To $array[0][0]
			$string &= "|" & _StringEncrypt(0, $array[$i][0])
		Next
	EndIf
	GUICtrlSetData($Form2[1], $string)
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
#EndRegion ### Main GUI
#Region ### AdvancedOption GUI
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
	If IniRead($udd, "character_version", "9-0", "0") == 0 Then
		GUICtrlSetData($Form3[14], "classic", "classic")
	Else
		GUICtrlSetData($Form3[14], "catacombs", "catacombs")
	EndIf
	If IniRead($udd, "atlantis_internal", "item1", 0) == 0 Then
		GUICtrlSetData($Form3[13], "on", "on")
	Else
		GUICtrlSetData($Form3[13], "off", "off")
	EndIf
	If IniRead($udd, "atlantis_internal", "item2", 0) == 0 Then
		GUICtrlSetData($Form3[12], "on", "on")
	Else
		GUICtrlSetData($Form3[12], "off", "off")
	EndIf
	Switch IniRead($udd, "water", "item2", 0)
		Case 0
			GUICtrlSetData($Form3[11], "often", "often")
		Case 1
			GUICtrlSetData($Form3[11], "occasional", "occasional")
		Case 2
			GUICtrlSetData($Form3[11], "seldom", "seldom")
	EndSwitch
	Switch IniRead($udd, "water", "item3", 0)
		Case 2
			GUICtrlSetData($Form3[10], "low", "low")
		Case 1
			GUICtrlSetData($Form3[10], "medium", "medium")
		Case 0
			GUICtrlSetData($Form3[10], "high", "high")
	EndSwitch
	Switch IniRead($udd, "water", "item1", 0)
		Case 2
			GUICtrlSetData($Form3[9], "SI", "SI")
		Case 1
			GUICtrlSetData($Form3[9], "classic", "classic")
		Case 0
			GUICtrlSetData($Form3[9], "reflective", "reflective")
	EndSwitch
	Switch IniRead($udd, "shadows", "item1", 0)
		Case 0
			GUICtrlSetData($Form3[8], "on", "on")
		Case 2
			GUICtrlSetData($Form3[8], "low", "low")
		Case 1
			GUICtrlSetData($Form3[8], "high", "high")
	EndSwitch
	Switch IniRead($udd, "shadows", "item2", 0)
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
	Switch IniRead($udd, "performance", "item7", 0)
		Case 1
			GUICtrlSetData($Form3[6], "background", "background")
		Case 2
			GUICtrlSetData($Form3[6], "never", "never")
		Case 0
			GUICtrlSetData($Form3[6], "minimized", "minimized")
	EndSwitch
	refreshComboSounds()
	If IniRead($udd, "zsound", "volume", "on") == "on" Then
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
Func refreshComboSounds()
	Local $temp = IniRead($udd, "sound", "item1", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[5], "full", "full")
		Case 10
			GUICtrlSetData($Form3[5], "off", "off")
		Case Else
			GUICtrlSetData($Form3[5], 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($udd, "sound", "item2", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[4], "full", "full")
		Case 10
			GUICtrlSetData($Form3[4], "off", "off")
		Case Else
			GUICtrlSetData($Form3[4], 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($udd, "sound", "item3", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[3], "full", "full")
		Case 10
			GUICtrlSetData($Form3[3], "off", "off")
		Case Else
			GUICtrlSetData($Form3[3], 10 - $temp, 10 - $temp)
	EndSwitch
	$temp = IniRead($udd, "sound", "item4", 0)
	Switch $temp
		Case 0
			GUICtrlSetData($Form3[2], "full", "full")
		Case 10
			GUICtrlSetData($Form3[2], "off", "off")
		Case Else
			GUICtrlSetData($Form3[2], 10 - $temp, 10 - $temp)
	EndSwitch
EndFunc
Func setCharVersion()
	Local $temp = 1
	If GUICtrlRead($Form3[14]) == "classic" Then $temp = 0
	IniWrite($udd, "character_version", "500-0", $temp)
	For $i = 0 To 20
		IniWrite($udd, "character_version", $i & "-0", $temp)
		IniWrite($udd, "character_version", $i & "-1", $temp)
	Next
EndFunc
Func atlantisInternal()
	Local $c = 1
	If @GUI_CtrlId == $Form3[12] Then $c = 2
	If GUICtrlRead(@GUI_CtrlId) == "on" Then
		IniWrite($udd, "atlantis_internal", "item" & $c, 0)
	Else
		IniWrite($udd, "atlantis_internal", "item" & $c, 1)
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
					IniWrite($udd, "shadows", "item1", 0)
				Case "high"
					IniWrite($udd, "shadows", "item1", 1)
				Case "low"
				IniWrite($udd, "shadows", "item1", 2)
			EndSwitch
			Return
		Case $Form3[6]
			Switch GUICtrlRead($Form3[6])
				Case "background"
					IniWrite($udd, "performance", "item7", 1)
				Case "minimized"
					IniWrite($udd, "performance", "item7", 0)
				Case "never"
					IniWrite($udd, "performance", "item7", 2)
			EndSwitch
			Return
		Case $Form3[7]
			Switch GUICtrlRead($Form3[7])
				Case "none"
					IniWrite($udd, "shadows", "item2", 4)
				Case "all figures"
					IniWrite($udd, "shadows", "item2", 0)
				Case "self only"
					IniWrite($udd, "shadows", "item2", 1)
				Case "near 5 figures"
					IniWrite($udd, "shadows", "item2", 2)
				Case "near 10 figures"
					IniWrite($udd, "shadows", "item2", 3)
			EndSwitch
			Return
	EndSwitch
	Switch GUICtrlRead(@GUI_CtrlId)
		Case "reflective" Or "often" Or "high"
			IniWrite($udd, "water", "item" & $temp, 0)
		Case "classic" Or "occasional" Or "medium"
			IniWrite($udd, "water", "item" & $temp, 1)
		Case "SI" Or "seldom" Or "low"
			IniWrite($udd, "water", "item" & $temp, 2)
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
			IniWrite($udd, "sound", "item" & $c, 0)
		Case "off"
			IniWrite($udd, "sound", "item" & $c, 10)
		Case Else
			IniWrite($udd, "sound", "item" & $c, -1 * ($temp - 10))
	EndSwitch
EndFunc
Func setGeneralAudio()
	If GUICtrlRead($Form3[1]) == "on" Then
		For $i = 2 To 5
			GUICtrlSetState($Form3[$i], $GUI_ENABLE)
			IniWrite($udd, 'sound', 'item' & $i - 1, IniRead($udd, 'zsound', 'item' & $i - 1, 0))
		Next
		IniWrite($udd, "zsound", "volume", "on")
	Else
		For $i = 2 To 5
			GUICtrlSetState($Form3[$i], $GUI_DISABLE)
			IniWrite($udd, 'zsound', 'item' & $i - 1, IniRead($udd, 'sound', 'item' & $i - 1, 0))
			IniWrite($udd, 'sound', 'item' & $i - 1, 10)
		Next
		IniWrite($udd, "zsound", "volume", "off")
	EndIf
	refreshComboSounds()
EndFunc
Func closeAdvancedOptions()
	GUISetState(@SW_ENABLE, $Form1)
	GUIDelete($Form3[0])
	GUISwitch($Form1)
	GUISetState(@SW_SHOW, $Form1)
EndFunc
#EndRegion ### AdvancedOption GUI
#Region ### AccountManager GUI
Func openAccountManager()
	GUICtrlSetData($Label_, "Starting Accounts Database Manager")
	GUISetState(@SW_DISABLE, $Form1)
	$Form2[0] = GUICreate("Accounts Database Editor", 308, 181, -1, -1)
	$Form2[1] = GUICtrlCreateList("", 8, 10, 139, 162)
				GUICtrlCreateLabel("ID", 160, 10, 65, 17)
	$Form2[3] = GUICtrlCreateInput("", 160, 24, 137, 21)
				GUICtrlCreateLabel("Password", 160, 48, 100, 17)
	$Form2[5] = GUICtrlCreateInput("", 160, 62, 137, 21)
	$Form2[6] = GUICtrlCreateButton('Save data', 159, 88, 139, 25)
	$Form2[2] = GUICtrlCreateButton("Add new account", 159, 118, 139, 25)
	$Form2[4] = GUICtrlCreateButton("Delete account", 159, 148, 139, 25)
	refreshAccountManager()
	GUISetState(@SW_SHOW, $Form2[0])
	GUISwitch($Form2[0])
	GUISetOnEvent($GUI_EVENT_CLOSE, 'closeAccountManager', $Form2[0])
	GUICtrlSetOnEvent($Form2[1], 'showData')
	GUICtrlSetOnEvent($Form2[2], 'addAccount')
	GUICtrlSetOnEvent($Form2[4], 'deleteAccount')
	GUICtrlSetOnEvent($Form2[6], 'saveData')
	GUICtrlSetOnEvent($Form2[3], 'stripper')
	GUICtrlSetOnEvent($Form2[5], 'stripper')
EndFunc
Func stripper()
	GUICtrlSetData($Form2[3], StringStripWS(GUICtrlRead($Form2[3]), 8))
	GUICtrlSetData($Form2[5], StringStripWS(GUICtrlRead($Form2[5]), 8))
EndFunc
Func addAccount()
	Local Const $temp[2] = [GUICtrlRead($Form2[3]), GUICtrlRead($Form2[5])]
	If $temp[0] <> '' And $temp[1] <> '' Then
		IniWrite($udd, 'zdata', _StringEncrypt(1, $temp[0]), _StringEncrypt(1, $temp[1]))
		refreshAccountManager()
	EndIf
EndFunc
Func saveData()
	Local Const $temp[2] = [GUICtrlRead($Form2[3]), GUICtrlRead($Form2[5])]
	If $temp[0] <> '' And $temp[1] <> '' Then
		IniDelete($udd, 'zdata', _StringEncrypt(1, GUICtrlRead($Form2[1])))
		IniWrite($udd, 'zdata', _StringEncrypt(1, $temp[0]), _StringEncrypt(1, $temp[1]))
		refreshAccountManager()
	EndIf
EndFunc
Func deleteAccount()
	Local $temp = GUICtrlRead($Form2[1])
	If $temp <> "" Then
		IniDelete($udd, "zdata", _StringEncrypt(1, $temp))
		refreshAccountManager()
	EndIf
EndFunc
Func showData()
	GUICtrlSetData($Form2[3], GUICtrlRead($Form2[1]), "")
	GUICtrlSetData($Form2[5], _StringEncrypt(0, IniRead($udd, 'zdata', _StringEncrypt(1, GUICtrlRead($Form2[1])), '')))
EndFunc
Func closeAccountManager()
	refreshComboAccounts()
	GUISetState(@SW_ENABLE, $Form1)
	GUIDelete($Form2[0])
	GUISwitch($Form1)
	GUISetState(@SW_SHOW, $Form1)
EndFunc
#EndRegion ### AccountManager GUI
#Region ### ManageChars GUI
Func manageChars()
	GUICtrlSetData($Label_, 'Starting Characters Database Manager')
	GUISetState(@SW_DISABLE, $Form1)
	$Form5[0] = GUICreate("Characters Database Editor", 492, 204, -1, -1)
	$Form5[1] = GUICtrlCreateList("", 8, 5, 139, 188)
				GUICtrlCreateLabel("Name", 168, 7, 32, 17)
				GUICtrlCreateLabel("Server", 168, 48, 35, 17)
				GUICtrlCreateLabel("Server IP", 312, 48, 48, 17)
				GUICtrlCreateLabel("Port", 408, 48, 23, 17)
				GUICtrlCreateLabel("ID", 456, 48, 15, 17)
				GUICtrlCreateLabel("Realm", 240, 48, 34, 17)
				GUICtrlCreateLabel("Account", 312, 7, 44, 17)
	$Form5[2] = GUICtrlCreateInput("", 168, 24, 137, 21)
	$Form5[11] = GUICtrlCreateCombo("", 312, 24, 169, 25, 323)
	$Form5[4] = GUICtrlCreateCombo("", 168, 65, 65, 25, 323)
				GUICtrlSetData(-1, "Custom|Ywain1|Ywain2|Ywain3|Ywain4|Ywain5|Ywain6|Ywain7|Ywain8|Ywain9|Ywain10", "Ywain1")
	$Form5[3] = GUICtrlCreateCombo("", 240, 65, 65, 25, 323);realm
				GUICtrlSetData(-1, "Albion|Hibernia|Midgard", "Albion")
	$Form5[5] = GUICtrlCreateInput("107.23.173.143", 312, 65, 89, 21)
	$Form5[6] = GUICtrlCreateInput("10622", 408, 65, 41, 21, 8320)
	$Form5[7] = GUICtrlCreateInput("41", 456, 66, 25, 21, 8320)
	$Form5[9] = GUICtrlCreateButton("Delete", 160, 168, 99, 25)
	$Form5[10] = GUICtrlCreateButton("Update", 271, 168, 99, 25)
	$Form5[8] = GUICtrlCreateButton("Add new", 382, 168, 99, 25)
				GUICtrlCreateGroup("Optional", 160, 96, 321, 65)
				GUICtrlCreateLabel("Resolution", 314, 110, 54, 17)
				GUICtrlCreateLabel("Class", 278, 110, 29, 17)
	$Form5[12] = GUICtrlCreateCombo("", 168, 127, 137, 25, 323);class
				GUICtrlSetData(-1, '', ''); inserire le classi di albion
	$Form5[13] = GUICtrlCreateCombo("", 314, 127, 81, 25, 323);res
	$Form5[14] = GUICtrlCreateCheckbox("Fullscreen", 400, 129, 73, 17);fullscreen
	GUICtrlSetData($Form5[13], '', '')
	GUICtrlSetData($Form5[13], getSupportedRes(), IniRead($udd, "main", "screen_width", 800) & " " & IniRead($udd, "main", "screen_height", 600))
	If IniRead($udd, "main", "windowed", 0) == 0 Then GUICtrlSetState($Form5[14], $GUI_CHECKED)
	GUICtrlSetState($Form5[5], $GUI_DISABLE)
	GUICtrlSetState($Form5[6], $GUI_DISABLE)
	GUICtrlSetState($Form5[7], $GUI_DISABLE)
	refreshCharacterManager()
	Local $array = IniReadSection($udd, "zdata"), $string = ""
	If @error <> 1 Then
		For $i = 1 To $array[0][0]
			$string &= "|" & _StringEncrypt(0, $array[$i][0])
		Next
	EndIf
	GUICtrlSetData($Form5[11], $string)
	GUISetState(@SW_SHOW, $Form5[0])
	GUISwitch($Form5[0])
	GUISetOnEvent($GUI_EVENT_CLOSE, 'closeCharManager', $Form5[0])
	GUICtrlSetOnEvent($Form5[8], 'addChar')
	GUICtrlSetOnEvent($Form5[10], 'editChar')
	GUICtrlSetOnEvent($Form5[9], 'deleteChar')
	GUICtrlSetOnEvent($Form5[4], 'setServerData')
	GUICtrlSetOnEvent($Form5[1], 'showPGData')
	GUICtrlSetOnEvent($Form5[2], 'stripws')
	GUICtrlSetOnEvent($Form5[3], 'setClass')
EndFunc
Func setClass()
	GUICtrlSetData($Form5[12], '')
	Switch GUICtrlRead($Form5[3])
		Case 'Albion'
			GUICtrlSetData($Form5[12], 'Armsman|Cabalist|Cleric|Friar|Heretic|Infiltrator|Mauler|Mercenary|Minstrel|Necromancer|Paladin|Reaver|Scout|Sorcerer|Theurg|Wizard', 'Armsman')
		Case 'Hibernia'
			GUICtrlSetData($Form5[12], 'Animist|Bainshee|Bard|Blademaster|Champion|Druid|Eldritch|Enchanter|Hero|Mauler|Mentalist|Nightshade|Ranger|Valewalker|Vampiir|Warden', 'Animist')
		Case Else
			GUICtrlSetData($Form5[12], 'Berserker|Bonedancer|Healer|Hunter|Mauler|Runemaster|Savage|Shadowblade|Shaman|Skald|Spiritmaster|Thane|Valkyrie|Warlock|Warrior', 'Berserker')
	EndSwitch
EndFunc
Func stripws()
	GUICtrlSetData($Form5[2], StringStripWS(GUICtrlRead($Form5[2]), 8))
EndFunc
Func showPGData();7 elementi si parte da [1];1       2       3               4      5  6   7;nomepg, Ywain1, 107.23.173.143, 10622, 1, 41, ray
	Local $temp = StringSplit(StringReplace(IniRead($udd, 'chars', StringReplace(GUICtrlRead($Form5[1]), ' ', '_'), ''), ', ', ' '), ' ')
	If UBound($temp) < 6 Then Return
	GUICtrlSetData($Form5[2],  $temp[1]) ;nome pg
	GUICtrlSetData($Form5[11], $temp[7]) ;combo acc
	GUICtrlSetData($Form5[4],  $temp[2]) ;server
	GUICtrlSetData($Form5[3],  $temp[5]) ;reame
	GUICtrlSetData($Form5[5],  $temp[3]) ;ip
	GUICtrlSetData($Form5[6],  $temp[4]) ;porta
	GUICtrlSetData($Form5[7],  $temp[6]) ;ID
	If GUICtrlRead($Form5[4]) <> 'Custom' Then
		GUICtrlSetState($Form5[5], $GUI_DISABLE)
		GUICtrlSetState($Form5[6], $GUI_DISABLE)
		GUICtrlSetState($Form5[7], $GUI_DISABLE)
	Else
		GUICtrlSetState($Form5[5], $GUI_ENABLE)
		GUICtrlSetState($Form5[6], $GUI_ENABLE)
		GUICtrlSetState($Form5[7], $GUI_ENABLE)
	EndIf
	If UBound($temp) < 9 Then Return
	;GUICtrlSetData($Form5[12], $temp[8])
	;GUICtrlSetData($Form5[13], $temp[9])
	;GUICtrlSetData($Form5[14], $temp[10])
EndFunc
Func editChar()
	If GUICtrlRead($Form5[1]) == '' Then Return
	Local $array = StringSplit(StringReplace(IniRead($udd, 'chars', StringReplace(GUICtrlRead($Form5[1]), ' ', '_'), ''), ', ', ' '), ' ')
	Local $temp[10] = [GUICtrlRead($Form5[11]), GUICtrlRead($Form5[2]), GUICtrlRead($Form5[4]), GUICtrlRead($Form5[5]), GUICtrlRead($Form5[6]), GUICtrlRead($Form5[3]), GUICtrlRead($Form5[7]), _
	GUICtrlRead($Form5[8]), GUICtrlRead($Form5[9]), GUICtrlRead($form5[10])]
	If $temp[0] <> '' And StringIsAlNum($temp[1]) And $temp[2] <> '' And $temp[3] <> '' And StringIsInt($temp[4]) And StringIsInt($temp[6]) Then
		IniDelete($udd, 'chars', $array[1] & '_' & $array[2] & '_' & $array[7])
		IniWrite($udd, 'chars', $temp[1] & '_' &$temp[2] & '_' & $temp[0], $temp[1] & ', ' & $temp[2] & ', ' & $temp[3] & ', ' & $temp[4] & ', ' & $temp[5] & ', ' & $temp[6] & ', ' & $temp[0])
		refreshCharacterManager()
	EndIf
	refreshCharacterManager()
EndFunc
;checkbox: o 1 4

Func setServerData()
	Local Const $temp = GUICtrlRead($Form5[4])
	If $temp == 'Custom' Then
		GUICtrlSetState($Form5[5], $GUI_ENABLE)
		GUICtrlSetState($Form5[6], $GUI_ENABLE)
		GUICtrlSetState($Form5[7], $GUI_ENABLE)
	Else
		GUICtrlSetState($Form5[5], $GUI_DISABLE)
		GUICtrlSetState($Form5[6], $GUI_DISABLE)
		GUICtrlSetState($Form5[7], $GUI_DISABLE)
		GUICtrlSetData($Form5[5], '107.23.173.143')
		GUICtrlSetData($Form5[6], '10622')
		Switch $temp
			Case 'Ywain1'
				GUICtrlSetData($Form5[7], '41')
			Case 'Ywain2'
				GUICtrlSetData($Form5[7], '49')
			Case 'Ywain3'
				GUICtrlSetData($Form5[7], '50')
			Case 'Ywain4'
				GUICtrlSetData($Form5[7], '51')
			Case 'Ywain5'
				GUICtrlSetData($Form5[7], '52')
			Case 'Ywain6'
				GUICtrlSetData($Form5[7], '53')
			Case 'Ywain7'
				GUICtrlSetData($Form5[7], '54')
			Case 'Ywain8'
				GUICtrlSetData($Form5[7], '55')
			Case 'Ywain9'
				GUICtrlSetData($Form5[7], '56')
			Case 'Ywain10'
				GUICtrlSetData($Form5[7], '57')
		EndSwitch
	EndIf
EndFunc
Func closeCharManager()
	refreshComboChars()
	GUISetState(@SW_ENABLE, $Form1)
	GUIDelete($Form5[0])
	GUISwitch($Form1)
	GUISetState(@SW_SHOW, $Form1)
EndFunc
Func addChar();             account[0]               pg[1]                   server[2]               ip[3]                   porta[4]                reame[5]                               id[6]
	Local Const $temp[10] = [GUICtrlRead($Form5[11]), GUICtrlRead($Form5[2]), GUICtrlRead($Form5[4]), GUICtrlRead($Form5[5]), GUICtrlRead($Form5[6]), GUICtrlRead($Form5[3]), GUICtrlRead($Form5[7]), _
	GUICtrlRead($Form5[8]), GUICtrlRead($Form5[9]), GUICtrlRead($form5[10])]
	If $temp[0] <> '' And StringIsAlNum($temp[1]) And $temp[2] <> '' And $temp[3] <> '' And StringIsInt($temp[4]) And StringIsInt($temp[6]) Then
		IniWrite($udd, 'chars', $temp[1] & '_' &$temp[2] & '_' & $temp[0], $temp[1] & ', ' & $temp[2] & ', ' & $temp[3] & ', ' & $temp[4] & ', ' & $temp[5] & ', ' & $temp[6] & ', ' & $temp[0])
		refreshCharacterManager()
	EndIf
EndFunc
Func deleteChar()
	Local Const $temp = StringReplace(GUICtrlRead($Form5[1]), ' ', '_')
	If $temp <> '' Then
		IniDelete($udd, "chars", $temp)
		refreshCharacterManager()
	EndIf
EndFunc
Func refreshCharacterManager()
	Local $array = IniReadSection($udd, "chars"), $string = "", $temp
	If @error <> 1 Then
		For $i = 1 To $array[0][0]
			$temp = StringSplit($array[$i][0], '_', 3)
			$string &= "|" & $temp[0] & ' ' & $temp[1] & ' ' & $temp[2]
		Next
	EndIf
	GUICtrlSetData($Form5[1], $string)
EndFunc
#EndRegion ### ManageChars GUI
#Region ### KillClient GUI
Func closeKillClient()
	GUICtrlSetData($Button_kill, 'Kill client')
	GUICtrlSetState($Button_kill, $GUI_ENABLE)
	GUISetState(@SW_ENABLE, $Form1)
	GUIDelete($Form4[0])
	GUISwitch($Form1)
	GUISetState(@SW_SHOW, $Form1)
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
#EndRegion ### KillClient GUI

#Region

Func resetGamma()
	$varGamma = 128
	setGamma($varGamma)
EndFunc

Func incGamma()
	$varGamma += 10
	setGamma($varGamma)
EndFunc

Func decGamma()
	$varGamma -= 10
	setGamma($varGamma)
EndFunc

Func setGamma($var)
	Local $vRed = $var, $vGreen = $var, $vBlue = $var
    Local $n_ramp, $rVar, $gVar, $bVar, $Ret, $i, $dc
    If $vRed < 0 Or $vRed > 386 Then Return -1
    If $vGreen < 0 Or $vGreen > 386 Then Return -1
    If $vBlue < 0 Or $vBlue > 386 Then Return -1
    $dc = DLLCall ( "user32.dll", "int", "GetDC","hwnd", 0 )
    $n_ramp = DllStructCreate ( "short[" & ( 256*3 ) & "]" )
    For $i = 0 to 256
		$rVar = $i * ( $vRed + 128 )
		If $rVar > 65535 Then $rVar = 65535
		$gVar = $i * ( $vGreen + 128 )
		If $gVar > 65535 Then $gVar = 65535
		$bVar = $i * ( $vBlue + 128 )
		If $bVar > 65535 Then $bVar = 65535
		DllStructSetData ( $n_ramp, 1, Int ( $rVar ), $i  ) ; red
		DllStructSetData ( $n_ramp, 1, Int ( $gVar ), $i+256 ) ; green
		DllStructSetData ( $n_ramp, 1, Int ( $bVar ), $i+512 ) ; blue
    Next
    $ret = DLLCall ( "gdi32.dll", "int", "SetDeviceGammaRamp", "int", $dc[0], "ptr", DllStructGetPtr ( $n_Ramp ) )
    $dc = 0
    $n_Ramp = 0
EndFunc
#EndRegion