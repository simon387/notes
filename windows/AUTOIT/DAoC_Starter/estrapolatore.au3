#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

Opt("GUIOnEventMode", 1)

$Form = GUICreate("Showing passwords", 267, 317, -1, -1)
$Edit = GUICtrlCreateEdit("... Loading ...", 0, 0, 624, 442)

GUISetState(@SW_SHOW, $Form)

GUISetOnEvent(-3, "closing", $Form)

$array = IniReadSection(@AppDataDir & "\Electronic Arts\Dark Age of Camelot\LotM\user.dat", "zdata")

If @error == 1 Then
	Exit
Else
	For $i = 1 To $array[0][0]
		GUICtrlSetData($Edit, GUICtrlRead($Edit) & @CRLF & stringEncrypt($array[$i][0]) & @TAB & stringEncrypt($array[$i][1]))
	Next
	GUICtrlSetData($Edit, GUICtrlRead($Edit) & @CRLF & "... End of List ...")
EndIf

While 1
	Sleep(10000)
WEnd

Func closing()
	Exit
EndFunc

Func stringEncrypt($s_EncryptText)
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
	For $i_EncryptCountF = 0 To 1
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
			$av_EncryptBox[$i_EncryptCountA][1] = Asc(StringMid("Dark Age of Camelot", Mod($i_EncryptCountA, StringLen("Dark Age of Camelot")) + 1, 1))
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
			If $i_EncryptCountH = StringLen("Dark Age of Camelot") Then
				$i_EncryptCountH = 1
			Else
				$i_EncryptCountH += 1
			EndIf
			$v_EncryptModified &= Chr(BitXOR(Asc(StringMid($s_EncryptText, $i_EncryptCountG, 1)), Asc(StringMid("Dark Age of Camelot", $i_EncryptCountH, 1)), 255))
		Next
		$s_EncryptText = $v_EncryptModified
	Next
	Return $s_EncryptText
EndFunc