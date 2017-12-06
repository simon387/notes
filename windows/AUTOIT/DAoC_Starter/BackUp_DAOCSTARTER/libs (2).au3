;#include <ComboConstants.au3>
Global Const $CBS_DROPDOWNLIST = 0x3
Global Const $CBS_AUTOHSCROLL = 0x40;#include <EditConstants.au3>
Global Const $GUI_SS_DEFAULT_INPUT = 128
Global Const $ES_CENTER = 1
Global Const $ES_NUMBER = 8192;#include <GUIConstantsEx.au3>;#include <StaticConstants.au3>
Global Const $SS_CENTER = 0x1;#include <WindowsConstants.au3>;#include <GUIListBox.au3>
Global Const $GUI_CHECKED = 1
Global Const $GUI_HIDE = 32
Global Const $GUI_UNCHECKED = 4
Global Const $GUI_SHOW = 16
Global Const $GUI_EVENT_CLOSE = -3
Global Const $GUI_ENABLE = 64
Global Const $GUI_DISABLE = 128
Global Const $GUI_EVENT_MINIMIZE = -4;#include <string.au3>
Func _StringEncrypt($i_Encrypt, $s_EncryptText, $s_EncryptPassword = "Dark Age of Camelot");, $i_EncryptLevel = 1);If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then	SetError(1, 0, '')	ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then	SetError(1, 0, '')	Else	If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
	Local $v_EncryptModified, $i_EncryptCountH, $i_EncryptCountG, $v_EncryptSwap, $av_EncryptBox[256][2], $i_EncryptCountA, $i_EncryptCountB, $i_EncryptCountC, $i_EncryptCountD, $i_EncryptCountE, $v_EncryptCipher, $v_EncryptCipherBy
	If $i_Encrypt = 1 Then
		For $i_EncryptCountF = 0 To 1
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
	Return $s_EncryptText;EndIf
EndFunc;#include <Constants.au3>
Global Const $TRAY_EVENT_PRIMARYUP = -8 ; NON CANCELLARE!;#include <GuiIPAddress.au3>
Global $_UDF_GlobalIDs_Used[16][55538];Global $_ip_ghIPLastWnd;Global $__gaInProcess_WinAPI[64][2]	= [[0, 0]]
Func _GUICtrlIpAddress_GetEx($hWnd)
	Local $tIP = DllStructCreate("byte Field4;byte Field3;byte Field2;byte Field1")
	Local $pIP = DllStructGetPtr($tIP)
	If @error Then Return SetError(1, 1, "")
	_SendMessage($hWnd, 1126, 0, $pIP, 0, "wparam", "ptr")
	Return $tIP
EndFunc
Func _GUICtrlIpAddress_Get($hWnd)
	Local $tIP = _GUICtrlIpAddress_GetEx($hWnd)
	If @error Then Return SetError(2, 2, "")
	Return StringFormat("%d.%d.%d.%d", DllStructGetData($tIP, "Field1"), DllStructGetData($tIP, "Field2"), DllStructGetData($tIP, "Field3"), DllStructGetData($tIP, "Field4"))
EndFunc
Func _WinAPI_ShowWindow($hWnd, $iCmdShow)
	Local $aResult = DllCall("user32.dll", "bool", "ShowWindow", "hwnd", $hWnd, "int", $iCmdShow)
	If @error Then Return SetError(@error, @extended, False)
	Return $aResult[0]
EndFunc
Func _GUICtrlIpAddress_ShowHide($hWnd, $iState)
	If $iState <> @SW_HIDE And $iState <> @SW_SHOW Then Return SetError(1, 1, 0)
	Return _WinAPI_ShowWindow($hWnd, $iState) <> 0
EndFunc
Func _WinAPI_MakeLong($iLo, $iHi)
	Return BitOR(BitShift($iHi, -16), BitAND($iLo, 0xFFFF))
EndFunc
Func _GUICtrlIpAddress_SetEx($hWnd, $tIP)
    _SendMessage($hWnd, 1125, 0, _WinAPI_MakeLong(BitOR(DllStructGetData($tIP, "Field4"), 0x100 * DllStructGetData($tIP, "Field3")), BitOR(DllStructGetData($tIP, "Field2"), 0x100 * DllStructGetData($tIP, "Field1"))))
EndFunc
Func _GUICtrlIpAddress_Set($hWnd, $sAddress)
	Local $aAddress = StringSplit($sAddress, ".")
	If $aAddress[0] = 4 Then
		Local $tIP = DllStructCreate("byte Field4;byte Field3;byte Field2;byte Field1")
		For $x = 1 To 4
			DllStructSetData($tIP, "Field" & $x, $aAddress[$x])
		Next
		_GUICtrlIpAddress_SetEx($hWnd, $tIP)
	EndIf
EndFunc
Func _SendMessage($hWnd, $iMsg, $wParam = 0, $lParam = 0, $iReturn = 0, $wParamType = "wparam", $lParamType = "lparam")
	Local $aResult = DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $hWnd, "uint", $iMsg, $wParamType, $wParam, $lParamType, $lParam)
	If @error Then Return SetError(@error, @extended, "")
	If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
	Return $aResult
EndFunc
Func _WinAPI_GetModuleHandle($sModuleName)
	Local $sModuleNameType = "wstr"
	If $sModuleName = "" Then
		$sModuleName = 0
		$sModuleNameType = "ptr"
	EndIf
	Local $aResult = DllCall("kernel32.dll", "handle", "GetModuleHandleW", $sModuleNameType, $sModuleName)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aResult[0]
EndFunc
Func _WinAPI_CreateWindowEx($iExStyle, $sClass, $sName, $iStyle, $iX, $iY, $iWidth, $iHeight, $hParent, $hMenu)
	Local $aResult = DllCall("user32.dll", "hwnd", "CreateWindowExW", "dword", $iExStyle, "wstr", $sClass, "wstr", $sName, "dword", $iStyle, "int", $iX, "int", $iY, "int", $iWidth, "int", $iHeight, "hwnd", $hParent, "handle", $hMenu, "handle", _WinAPI_GetModuleHandle(""), "ptr", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aResult[0]
EndFunc
Func __UDF_GetNextGlobalID($hWnd)
	Local $nCtrlID, $iUsedIndex = -1, $fAllUsed = True
	; check if window still exists
	If Not WinExists($hWnd) Then Return SetError(-1, -1, 0)
	; check that all slots still hold valid window handles
	For $iIndex = 0 To 15
		If $_UDF_GlobalIDs_Used[$iIndex][0] <> 0 Then
			; window no longer exist, free up the slot and reset the control id counter
			If Not WinExists($_UDF_GlobalIDs_Used[$iIndex][0]) Then
				For $x = 0 To UBound($_UDF_GlobalIDs_Used, 2) - 1
					$_UDF_GlobalIDs_Used[$iIndex][$x] = 0
				Next
				$_UDF_GlobalIDs_Used[$iIndex][1] = 10000
				$fAllUsed = False
			EndIf
		EndIf
	Next
	; check if window has been used before with this function
	For $iIndex = 0 To 15
		If $_UDF_GlobalIDs_Used[$iIndex][0] = $hWnd Then
			$iUsedIndex = $iIndex
			ExitLoop ; $hWnd has been used before
		EndIf
	Next
	; window hasn't been used before, get 1st un-used index
	If $iUsedIndex = -1 Then
		For $iIndex = 0 To 15
			If $_UDF_GlobalIDs_Used[$iIndex][0] = 0 Then
				$_UDF_GlobalIDs_Used[$iIndex][0] = $hWnd
				$_UDF_GlobalIDs_Used[$iIndex][1] = 10000
				$fAllUsed = False
				$iUsedIndex = $iIndex
				ExitLoop
			EndIf
		Next
	EndIf
	If $iUsedIndex = -1 And $fAllUsed Then Return SetError(16, 0, 0) ; used up all 16 window slots
	$nCtrlID = $_UDF_GlobalIDs_Used[$iUsedIndex][1]
	$_UDF_GlobalIDs_Used[$iUsedIndex][1] += 1
	$_UDF_GlobalIDs_Used[$iUsedIndex][($nCtrlID - 10000) + 2] = $nCtrlID
	Return $nCtrlID
EndFunc
Func _GUICtrlIpAddress_Create($hWnd, $iX, $iY, $iWidth, $iHeight)
	If Not IsHWnd($hWnd) Then Return SetError(1, 0, 0)	; Invalid Window handle for _GUICtrlIpAddress_Create 1st parameter
	Local $tICCE = DllStructCreate('dword dwSize;dword dwICC')
	DllStructSetData($tICCE, "dwSize", DllStructGetSize($tICCE))
	DllStructSetData($tICCE, "dwICC", 0x0800)
	DllCall('comctl32.dll', 'bool', 'InitCommonControlsEx', 'ptr', DllStructGetPtr($tICCE))
	If @error Then Return SetError(@error, @extended, 0)
	Local $nCtrlID = __UDF_GetNextGlobalID($hWnd)
	If @error Then Return SetError(@error, @extended, 0)
	Local $hIPAddress = _WinAPI_CreateWindowEx(0x00000000, "SysIPAddress32", "", 1342242816, $iX, $iY, $iWidth, $iHeight, $hWnd, $nCtrlID)
	Return $hIPAddress
EndFunc;#include <Misc.au3>
Func _Singleton($sOccurenceName, $iFlag = 0)
	Local $pSecurityAttributes = 0
	If BitAND($iFlag, 2) Then
		; The size of SECURITY_DESCRIPTOR is 20 bytes.  We just need a block of memory the right size, we aren't going to access any members directly so it's not important what the members are, just that the total size is correct.
		Local $tSecurityDescriptor = DllStructCreate("dword[5]")
		Local $pSecurityDescriptor = DllStructGetPtr($tSecurityDescriptor)
		; Initialize the security descriptor.
		Local $aRet = DllCall("advapi32.dll", "bool", "InitializeSecurityDescriptor", _
				"ptr", $pSecurityDescriptor, "dword", 1)
		If @error Then Return SetError(@error, @extended, 0)
		If $aRet[0] Then
			; Add the NULL DACL specifying access to everybody.
			$aRet = DllCall("advapi32.dll", "bool", "SetSecurityDescriptorDacl", "ptr", $pSecurityDescriptor, "bool", 1, "ptr", 0, "bool", 0)
			If @error Then Return SetError(@error, @extended, 0)
			If $aRet[0] Then
				; Create a SECURITY_ATTRIBUTES structure.
				Local $structSecurityAttributes = DllStructCreate("dword Length;ptr Descriptor;bool InheritHandle")
				; Assign the members.
				DllStructSetData($structSecurityAttributes, 1, DllStructGetSize($structSecurityAttributes))
				DllStructSetData($structSecurityAttributes, 2, $pSecurityDescriptor)
				DllStructSetData($structSecurityAttributes, 3, 0)
				; Everything went okay so update our pointer to point to our structure.
				$pSecurityAttributes = DllStructGetPtr($structSecurityAttributes)
			EndIf
		EndIf
	EndIf
	Local $handle = DllCall("kernel32.dll", "handle", "CreateMutexW", "ptr", $pSecurityAttributes, "bool", 1, "wstr", $sOccurenceName)
	If @error Then Return SetError(@error, @extended, 0)
	Local $lastError = DllCall("kernel32.dll", "dword", "GetLastError")
	If @error Then Return SetError(@error, @extended, 0)
	If $lastError[0] = 183 Then
		If BitAND($iFlag, 1) Then
			Return SetError($lastError[0], $lastError[0], 0)
		Else
			Exit -1
		EndIf
	EndIf
	Return $handle[0]
EndFunc