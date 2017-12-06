#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=i.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global Const $title = "DAoC Starter 3.1.1_lite"
Global $path = @AppDataDir & "\Electronic Arts\Dark Age of Camelot\LotM", $userdotdat = $path & "\user.dat", $mega;, $array = "",
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=d:\AUTOIT\daoc_starter\form1.kxf
$Form1 = GUICreate($title, 332, 115, IniRead($userdotdat, "zmain", "coo1", -1), IniRead($userdotdat, "zmain", "coo2", -1))
$MenuItem_settings = GUICtrlCreateMenu("&Settings")
$MenuItem_optionofficial = GUICtrlCreateMenu("Official server options", $MenuItem_settings)
$MenuItem_editofficialpath = GUICtrlCreateMenuItem("Edit client path", $MenuItem_optionofficial)
$MenuItem_patch = GUICtrlCreateMenuItem("Patch client", $MenuItem_optionofficial)
$MenuItem_manage = GUICtrlCreateMenuItem("Manage accounts", $MenuItem_settings)
$MenuItem_view = GUICtrlCreateMenu("&View")
$MenuItem_f5 = GUICtrlCreateMenuItem("Update", $MenuItem_view)
$MenuItem_tools = GUICtrlCreateMenu("&Tools")
$MenuItem_screen = GUICtrlCreateMenuItem("Show screenshots directory", $MenuItem_tools)
$MenuItem_user = GUICtrlCreateMenuItem("Open user settings directory", $MenuItem_tools)
$MenuItem_userdotdat = GUICtrlCreateMenuItem("Edit user.dat", $MenuItem_tools)
$Button_start = GUICtrlCreateButton("Start", 10, 12, 68, 21)
$Combo_account = GUICtrlCreateCombo("", 10, 42, 158, 25, 67)
$Combo_char = GUICtrlCreateCombo("", 176, 42, 143, 25, 67)
$Button_kill = GUICtrlCreateButton("Kill client", 251, 12, 68, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
update_gui()
GUISetState(@SW_SHOW, $Form1)
$Form2 = GUICreate("Accounts Database Editor", 308, 181, -1, -1)
$List_account = GUICtrlCreateList("", 8, 10, 139, 162)
$Button_add = GUICtrlCreateButton("Add new account", 158, 10, 139, 25)
$Button_edit = GUICtrlCreateButton("Edit selected account", 158, 44, 139, 25)
$Button_remove = GUICtrlCreateButton("Delete selected account", 158, 79, 139, 25)
$Button_show = GUICtrlCreateButton("Show passwords!", 158, 113, 139, 25)
$Form4 = GUICreate("Select client to kill", 202, 72, -1, -1)
$List1 = GUICtrlCreateList("", 2, 5, 106, 58)
$Button1 = GUICtrlCreateButton("Kill", 118, 5, 75, 25, 0)
GUISwitch($Form1)
#endregion
GUISetOnEvent(-3, "CLOSEClicked")
GUICtrlSetOnEvent($MenuItem_screen, 'f9')
GUICtrlSetOnEvent($MenuItem_user, 'f10')
GUICtrlSetOnEvent($MenuItem_userdotdat, 'f11')
GUICtrlSetOnEvent($MenuItem_editofficialpath, 'path_generator')
GUICtrlSetOnEvent($MenuItem_patch, 'f30')
GUICtrlSetOnEvent($Combo_char, 'f33')
GUICtrlSetOnEvent($Button_start, 'f34')
GUICtrlSetOnEvent($Button_kill, 'f35')
GUICtrlSetOnEvent($MenuItem_manage, 'f37')
GUICtrlSetOnEvent($MenuItem_f5, 'update_gui')
While 1
	Sleep(1000)
WEnd
Func f37()
	GUISetState(@SW_DISABLE, $Form1)
	refresh_list_accounts()
	GUISetState(@SW_SHOW, $Form2)
	GUISwitch($Form2)
	GUISetOnEvent(-3, 'f38')
	GUICtrlSetOnEvent($Button_add, 'f39')
	GUICtrlSetOnEvent($Button_edit, 'f40')
	GUICtrlSetOnEvent($Button_remove, 'f41')
	GUICtrlSetOnEvent($Button_show, 'f42')
EndFunc   ;==>f37
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
EndFunc   ;==>f42
Func f41()
	$temp = GUICtrlRead($List_account)
	If $temp == "" Then
	Else
		IniDelete($userdotdat, "zdata", _StringEncrypt(1, $temp))
		refresh_list_accounts()
	EndIf
EndFunc   ;==>f41
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
EndFunc   ;==>f40
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
EndFunc   ;==>f39
Func f38()
	refresh_combo_accounts()
	GUISetState(@SW_HIDE, $Form2)
	GUISetState(@SW_ENABLE, $Form1)
	GUISwitch($Form1)
EndFunc   ;==>f38
Func f35()
	$mega = WinList('Dark Age of Camelot © 2001-2011 Electronic Arts Inc. All Rights Reserved.')
	Local $string = ''
	If $mega[0][0] > 0 Then
		For $i = 1 To $mega[0][0]
			$string &= '|' & $i
		Next
		GUICtrlSetData($List1, $string)
	Else
		Return
	EndIf
	GUISetState(@SW_DISABLE, $Form1)
	GUISetState(@SW_SHOW, $Form4)
	GUISwitch($Form4)
	GUISetOnEvent(-3, 'f35q')
	GUICtrlSetOnEvent($List1, 'f35f')
	GUICtrlSetOnEvent($Button1, 'f35k')
EndFunc   ;==>f35
Func f35k()
	If GUICtrlRead($List1) <> "" Then
		If (ProcessClose(WinGetProcess($mega[GUICtrlRead($List1)][1])) == 1) Then
			f35q()
			f35()
		EndIf
	EndIf
EndFunc   ;==>f35k
Func f35f()
	If GUICtrlRead($List1) <> "" Then
		WinFlash($mega[GUICtrlRead($List1)][1], Default, 2, 50)
	EndIf
EndFunc   ;==>f35f
Func f35q()
	GUISetState(@SW_HIDE, $Form4)
	GUISetState(@SW_ENABLE, $Form1)
	GUISwitch($Form1)
EndFunc   ;==>f35q
Func f34()
	GUISetState(128, $Form1)
	$flag = 0
		mutex_killer()
		While ProcessExists("login.dll") <> 0
			ProcessClose("login.dll")
		WEnd
		If IniRead($userdotdat, "zmain", "path_official", "") == "" Then
			path_generator()
			If IniRead($userdotdat, "zmain", "path_official", "") == "" Then
				$flag = 1
			EndIf
		EndIf
		If $flag == 0 Then
			$pid = Run(StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "camelot.exe", "login.dll"), StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "camelot.exe", ""))
			If GUICtrlRead($Combo_account) == "No account selected" Then
				set_last_account()
			Else
				If $pid == 0 Then
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
						If ControlSetText($win_handle, "", "[CLASS:Edit; INSTANCE:1]", _StringEncrypt(0, IniRead($userdotdat, "zdata", _StringEncrypt(1, GUICtrlRead($Combo_account)), ""))) Then
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
											set_last_account()
										EndIf
									EndIf
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf

	GUISetState(64, $Form1)
EndFunc   ;==>f34
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
EndFunc   ;==>f33
Func f30()
	ShellExecute(IniRead($userdotdat, "zmain", "path_official", ""), "", StringReplace(IniRead($userdotdat, "zmain", "path_official", ""), "\camelot.exe", ""))
EndFunc   ;==>f30
Func f11()
	Run("notepad.exe " & $userdotdat)
EndFunc   ;==>f11
Func f10()
	ShellExecute($path)
EndFunc   ;==>f10
Func f9()
	ShellExecute(@MyDocumentsDir & "\Electronic Arts\Dark Age of Camelot")
EndFunc   ;==>f9
Func CLOSEClicked()
	Local $array = WinGetPos($title)
	IniWrite($userdotdat, "zmain", "coo1", $array[0])
	IniWrite($userdotdat, "zmain", "coo2", $array[1])
	Exit
EndFunc   ;==>CLOSEClicked
Func update_gui()
	refresh_combo_chars()
	refresh_combo_accounts()
	GUICtrlSetData($Combo_account, _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))), _StringEncrypt(0, IniRead($userdotdat, "zmain", "last", _StringEncrypt(1, "No account selected"))))
EndFunc   ;==>update_gui
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
EndFunc   ;==>refresh_combo_chars
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
EndFunc   ;==>refresh_combo_accounts
Func path_generator()
	Local $path = FileOpenDialog("Select the official DAoC client", @HomeDrive, "(camelot.exe)", "", "camelot.exe", $Form1)
	If $path <> "" Then IniWrite($userdotdat, "zmain", "path_official", $path)
EndFunc   ;==>path_generator
Func set_last_account()
	IniWrite($userdotdat, "zmain", "last", _StringEncrypt(1, GUICtrlRead($Combo_account)))
	If IniRead($userdotdat, "zmain", "quit", 0) == 1 Then Exit
EndFunc   ;==>set_last_account
Func mutex_killer()
	Local $file
	Local $hex
	FileInstall("C:\ZZZ\AUTOIT\DAoC_Starter\handle.exe", $path & "\handle.exe")
	Local $array = ProcessList("game.dll")
	If IsArray($array) == 1 Then
		For $i = 1 To $array[0][0]
			RunWait(@ComSpec & ' /c "' & $path & '\handle" -a -p ' & $array[$i][1] & ' >> zzz.txt', $path, @SW_HIDE)
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
			WEnd
			FileClose($file)
			FileDelete($path & "\zzz.txt")
		Next
	EndIf
EndFunc   ;==>mutex_killer
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
Func _StringEncrypt($i_Encrypt, $s_EncryptText, $s_EncryptPassword = "Dark Age of Camelot", $i_EncryptLevel = 1)
		Local $v_EncryptModified
		Local $i_EncryptCountH
		Local $i_EncryptCountG
		Local $v_EncryptSwap
		Local $av_EncryptBox[256][2]
		Local $i_EncryptCountA
		Local $i_EncryptCountB
		Local $i_EncryptCountC
		Local $i_EncryptCountD
		Local $i_EncryptCountE
		Local $v_EncryptCipher
		Local $v_EncryptCipherBy
		If $i_Encrypt = 1 Then
			For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
				$i_EncryptCountG = ''
				$i_EncryptCountH = ''
				$v_EncryptModified = ''
				For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
					If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
						$i_EncryptCountH = 1
					Else
						$i_EncryptCountH += 1
					EndIf
					$v_EncryptModified = $v_EncryptModified & Chr(BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountG, 1)), Asc(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
				Next
				$s_EncryptText = $v_EncryptModified
				$i_EncryptCountA = ''
				$i_EncryptCountB = 0
				$i_EncryptCountC = ''
				$i_EncryptCountD = ''
				$i_EncryptCountE = ''
				$v_EncryptCipherBy = ''
				$v_EncryptCipher = ''
				$v_EncryptSwap = ''
				$av_EncryptBox = ''
				Local $av_EncryptBox[256][2]
				For $i_EncryptCountA = 0 To 255
					$av_EncryptBox[$i_EncryptCountA][1] = Asc(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
					$av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
				Next
				For $i_EncryptCountA = 0 To 255
					$i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
					$v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
					$av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
					$av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
				Next
				For $i_EncryptCountA = 1 To StringLen($s_EncryptText)
					$i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
					$i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
					$i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
					$v_EncryptCipherBy = BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountA, 1)), $i_EncryptCountE)
					$v_EncryptCipher &= Hex($v_EncryptCipherBy, 2)
				Next
				$s_EncryptText = $v_EncryptCipher
			Next
		Else
			For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
				$i_EncryptCountB = 0
				$i_EncryptCountC = ''
				$i_EncryptCountD = ''
				$i_EncryptCountE = ''
				$v_EncryptCipherBy = ''
				$v_EncryptCipher = ''
				$v_EncryptSwap = ''
				$av_EncryptBox = ''
				Local $av_EncryptBox[256][2]
				For $i_EncryptCountA = 0 To 255
					$av_EncryptBox[$i_EncryptCountA][1] = Asc(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
					$av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
				Next
				For $i_EncryptCountA = 0 To 255
					$i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
					$v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
					$av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
					$av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
				Next
				For $i_EncryptCountA = 1 To StringLen($s_EncryptText) Step 2
					$i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
					$i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
					$i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
					$v_EncryptCipherBy = BitXOR(Dec(StringMid($s_EncryptText, $i_EncryptCountA, 2)), $i_EncryptCountE)
					$v_EncryptCipher = $v_EncryptCipher & Chr($v_EncryptCipherBy)
				Next
				$s_EncryptText = $v_EncryptCipher
				$i_EncryptCountG = ''
				$i_EncryptCountH = ''
				$v_EncryptModified = ''
				For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
					If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
						$i_EncryptCountH = 1
					Else
						$i_EncryptCountH += 1
					EndIf
					$v_EncryptModified &= Chr(BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountG, 1)), Asc(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
				Next
				$s_EncryptText = $v_EncryptModified
			Next
		EndIf
		Return $s_EncryptText
EndFunc   ;==>_StringEncrypt