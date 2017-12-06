;#include <ComboConstants.au3>
Global Const $CBS_DROPDOWNLIST = 0x3
Global Const $CBS_AUTOHSCROLL = 0x40
;#include <EditConstants.au3>
Global Const $GUI_SS_DEFAULT_INPUT = 128
Global Const $ES_CENTER = 1
Global Const $ES_NUMBER = 8192
;#include <GUIConstantsEx.au3>
;#include <StaticConstants.au3>
Global Const $SS_CENTER = 0x1
;#include <WindowsConstants.au3>
;#include <GUIListBox.au3>
Global Const $GUI_CHECKED = 1
Global Const $GUI_HIDE = 32
Global Const $GUI_UNCHECKED = 4
Global Const $GUI_SHOW = 16
Global Const $GUI_EVENT_CLOSE = -3
Global Const $GUI_ENABLE = 64
Global Const $GUI_DISABLE = 128
Global Const $GUI_EVENT_MINIMIZE = -4
;#include <string.au3>
Func _StringEncrypt($i_Encrypt, $s_EncryptText, $s_EncryptPassword = "Dark Age of Camelot", $i_EncryptLevel = 1)
;~ 	If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then	SetError(1, 0, '')	ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then	SetError(1, 0, '')	Else	If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
	Local $v_EncryptModified, $i_EncryptCountH, $i_EncryptCountG, $v_EncryptSwap, $av_EncryptBox[256][2], $i_EncryptCountA, $i_EncryptCountB, $i_EncryptCountC, $i_EncryptCountD, $i_EncryptCountE, $v_EncryptCipher, $v_EncryptCipherBy
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
	Return $s_EncryptText;EndIf
EndFunc
;#include <Constants.au3>
Global Const $TRAY_EVENT_PRIMARYUP = -8 ; NON CANCELLARE!
;#include <GuiIPAddress.au3>
Global $_UDF_GlobalIDs_Used[16][55538]
;Global $_ip_ghIPLastWnd
;Global $__gaInProcess_WinAPI[64][2]	= [[0, 0]]
Func _MemVirtualFreeEx($hProcess, $pAddress, $iSize, $iFreeType)
	Local $aResult = DllCall("kernel32.dll", "bool", "VirtualFreeEx", "handle", $hProcess, "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iFreeType)
	If @error Then Return SetError(@error, @extended, False)
	Return $aResult[0]
EndFunc
Func _MemFree(ByRef $tMemMap)
	Local $pMemory = DllStructGetData($tMemMap, "Mem")
	Local $hProcess = DllStructGetData($tMemMap, "hProc")
	Local $bResult = _MemVirtualFreeEx($hProcess, $pMemory, 0, 0x00008000)
	DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hProcess)
	If @error Then Return SetError(@error, @extended, False)
	Return $bResult
EndFunc
Func _MemRead(ByRef $tMemMap, $pSrce, $pDest, $iSize)
	Local $aResult = DllCall("kernel32.dll", "bool", "ReadProcessMemory", "handle", DllStructGetData($tMemMap, "hProc"), "ptr", $pSrce, "ptr", $pDest, "ulong_ptr", $iSize, "ulong_ptr*", 0)
	If @error Then Return SetError(@error, @extended, False)
	Return $aResult[0]
EndFunc
Func _MemVirtualAllocEx($hProcess, $pAddress, $iSize, $iAllocation, $iProtect)
	Local $aResult = DllCall("kernel32.dll", "ptr", "VirtualAllocEx", "handle", $hProcess, "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iAllocation, "dword", $iProtect)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aResult[0]
EndFunc
Func _Security__AdjustTokenPrivileges($hToken, $fDisableAll, $pNewState, $iBufferLen, $pPrevState = 0, $pRequired = 0)
	Local $aResult = DllCall("advapi32.dll", "bool", "AdjustTokenPrivileges", "handle", $hToken, "bool", $fDisableAll, "ptr", $pNewState, "dword", $iBufferLen, "ptr", $pPrevState, "ptr", $pRequired)
	If @error Then Return SetError(@error, @extended, False)
	Return $aResult[0]
EndFunc
Func _Security__LookupPrivilegeValue($sSystem, $sName)
	Local $aResult = DllCall("advapi32.dll", "int", "LookupPrivilegeValueW", "wstr", $sSystem, "wstr", $sName, "int64*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetError(0, $aResult[0], $aResult[3])
EndFunc
Func _Security__SetPrivilege($hToken, $sPrivilege, $fEnable)
	Local $iLUID = _Security__LookupPrivilegeValue("", $sPrivilege)
	If $iLUID = 0 Then Return SetError(-1, 0, False)
	Local $tCurrState = DllStructCreate("dword Count;int64 LUID;dword Attributes")
	Local $pCurrState = DllStructGetPtr($tCurrState)
	Local $iCurrState = DllStructGetSize($tCurrState)
	Local $tPrevState = DllStructCreate("dword Count;int64 LUID;dword Attributes")
	Local $pPrevState = DllStructGetPtr($tPrevState)
	Local $iPrevState = DllStructGetSize($tPrevState)
	Local $tRequired = DllStructCreate("int Data")
	Local $pRequired = DllStructGetPtr($tRequired)
	; Get current privilege setting
	DllStructSetData($tCurrState, "Count", 1)
	DllStructSetData($tCurrState, "LUID", $iLUID)
	If Not _Security__AdjustTokenPrivileges($hToken, False, $pCurrState, $iCurrState, $pPrevState, $pRequired) Then Return SetError(-2, @error, False)
	; Set privilege based on prior setting
	DllStructSetData($tPrevState, "Count", 1)
	DllStructSetData($tPrevState, "LUID", $iLUID)
	Local $iAttributes = DllStructGetData($tPrevState, "Attributes")
	If $fEnable Then
		$iAttributes = BitOR($iAttributes, 0x00000002)
	Else
		$iAttributes = BitAND($iAttributes, -3)
	EndIf
	DllStructSetData($tPrevState, "Attributes", $iAttributes)
	If Not _Security__AdjustTokenPrivileges($hToken, False, $pPrevState, $iPrevState, $pCurrState, $pRequired) Then Return SetError(-3, @error, False)
	Return True
EndFunc
Func _Security__ImpersonateSelf()
	Local $aResult = DllCall("advapi32.dll", "bool", "ImpersonateSelf", "int", 2)
	If @error Then Return SetError(@error, @extended, False)
	Return $aResult[0]
EndFunc
Func _Security__OpenThreadToken($iAccess, $hThread, $fOpenAsSelf)
	If $hThread = 0 Then $hThread = DllCall("kernel32.dll", "handle", "GetCurrentThread")
	If @error Then Return SetError(@error, @extended, 0)
	Local $aResult = DllCall("advapi32.dll", "bool", "OpenThreadToken", "handle", $hThread[0], "dword", $iAccess, "int", $fOpenAsSelf, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetError(0, $aResult[0], $aResult[4]);Token
EndFunc
Func _Security__OpenThreadTokenEx($iAccess)
	Local $hToken = _Security__OpenThreadToken($iAccess, 0, False)
	If $hToken = 0 Then
		If _WinAPI_GetLastError() <> 1008 Then Return SetError(-3, _WinAPI_GetLastError(), 0)
		If Not _Security__ImpersonateSelf() Then Return SetError(-1, _WinAPI_GetLastError(), 0)
		$hToken = _Security__OpenThreadToken($iAccess, 0, False)
		If $hToken = 0 Then Return SetError(-2, _WinAPI_GetLastError(), 0)
	EndIf
	Return $hToken
EndFunc
Func __Mem_OpenProcess($iAccess, $fInherit, $iProcessID, $fDebugPriv)
	; Attempt to open process with standard security priviliges
	Local $aResult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iAccess, "bool", $fInherit, "dword", $iProcessID)
	If @error Then Return SetError(@error, @extended, 0)
	If $aResult[0] Then Return $aResult[0]
	If Not $fDebugPriv Then Return 0
	; Enable debug privileged mode
	Local $hToken = _Security__OpenThreadTokenEx(40)
	If @error Then Return SetError(@error, @extended, 0)
	_Security__SetPrivilege($hToken, "SeDebugPrivilege", True)
	Local $iError = @error
	Local $iLastError = @extended
	Local $iRet = 0
	If Not @error Then
		; Attempt to open process with debug privileges
		$aResult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iAccess, "bool", $fInherit, "dword", $iProcessID)
		$iError = @error
		$iLastError = @extended
		If $aResult[0] Then $iRet = $aResult[0]
		; Disable debug privileged mode
		_Security__SetPrivilege($hToken, "SeDebugPrivilege", False)
		If @error Then
			$iError = @error
			$iLastError = @extended
		EndIf
	EndIf
	DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hToken)
	Return SetError($iError,  $iLastError, $iRet)
EndFunc
Func _MemInit($hWnd, $iSize, ByRef $tMemMap)
	Local $aResult = DllCall("User32.dll", "dword", "GetWindowThreadProcessId", "hwnd", $hWnd, "dword*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Local $iProcessID = $aResult[2]
	If $iProcessID = 0 Then Return SetError(1, 0, 0)	; Invalid window handle
	Local $iAccess = 56
	Local $hProcess = __Mem_OpenProcess($iAccess, False, $iProcessID, True)
	Local $iAlloc = 12288
	Local $pMemory = _MemVirtualAllocEx($hProcess, 0, $iSize, $iAlloc, 0x00000004)
	If $pMemory = 0 Then Return SetError(2, 0, 0)	; Unable to allocate memory
	$tMemMap = DllStructCreate("handle hProc;ulong_ptr Size;ptr Mem")
	DllStructSetData($tMemMap, "hProc", $hProcess)
	DllStructSetData($tMemMap, "Size", $iSize)
	DllStructSetData($tMemMap, "Mem", $pMemory)
	Return $pMemory
EndFunc
#cs
Func _WinAPI_GetWindowThreadProcessId($hWnd, ByRef $iPID)
	Local $aResult = DllCall("user32.dll", "dword", "GetWindowThreadProcessId", "hwnd", $hWnd, "dword*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	$iPID = $aResult[2]
	Return $aResult[0]
EndFunc
Func _WinAPI_InProcess($hWnd, ByRef $hLastWnd)
	If $hWnd = $hLastWnd Then Return True
	For $iI = $__gaInProcess_WinAPI[0][0] To 1 Step -1
		If $hWnd = $__gaInProcess_WinAPI[$iI][0] Then
			If $__gaInProcess_WinAPI[$iI][1] Then
				$hLastWnd = $hWnd
				Return True
			Else
				Return False
			EndIf
		EndIf
	Next
	Local $iProcessID
	_WinAPI_GetWindowThreadProcessId($hWnd, $iProcessID)
	Local $iCount = $__gaInProcess_WinAPI[0][0] + 1
	If $iCount >= 64 Then $iCount = 1
	$__gaInProcess_WinAPI[0][0] = $iCount
	$__gaInProcess_WinAPI[$iCount][0] = $hWnd
	$__gaInProcess_WinAPI[$iCount][1] = ($iProcessID = @AutoItPID)
	Return $__gaInProcess_WinAPI[$iCount][1]
EndFunc
#ce
Func _GUICtrlIpAddress_GetEx($hWnd)
;~ 	If $Debug_IP Then __UDF_ValidateClassName($hWnd, "SysIPAddress32")
	Local $tIP = DllStructCreate("byte Field4;byte Field3;byte Field2;byte Field1")
	Local $pIP = DllStructGetPtr($tIP)
	If @error Then Return SetError(1, 1, "")
	;If _WinAPI_InProcess($hWnd, $_ip_ghIPLastWnd) Then
		_SendMessage($hWnd, 1126, 0, $pIP, 0, "wparam", "ptr")
	;Else
	;	Local $iIP = DllStructGetSize($tIP)
	;	Local $tMemMap
	;	Local $pMemory = _MemInit($hWnd, $iIP, $tMemMap)
	;	_SendMessage($hWnd, 1126, 0, $pMemory, 0, "wparam", "ptr")
	;	_MemRead($tMemMap, $pMemory, $pIP, $iIP)
	;	_MemFree($tMemMap)
	;EndIf
	Return $tIP
EndFunc
Func _GUICtrlIpAddress_Get($hWnd)
;~ 	If $Debug_IP Then __UDF_ValidateClassName($hWnd, "SysIPAddress32")
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
;~ 	If $Debug_IP Then __UDF_ValidateClassName($hWnd, "SysIPAddress32")
	If $iState <> @SW_HIDE And $iState <> @SW_SHOW Then Return SetError(1, 1, 0)
	Return _WinAPI_ShowWindow($hWnd, $iState) <> 0
EndFunc
Func _WinAPI_MakeLong($iLo, $iHi)
	Return BitOR(BitShift($iHi, -16), BitAND($iLo, 0xFFFF))
EndFunc
Func _GUICtrlIpAddress_SetEx($hWnd, $tIP)
;~     If $Debug_IP Then __UDF_ValidateClassName($hWnd, $tIP)
    _SendMessage($hWnd, 1125, 0, _WinAPI_MakeLong(BitOR(DllStructGetData($tIP, "Field4"), 0x100 * DllStructGetData($tIP, "Field3")), BitOR(DllStructGetData($tIP, "Field2"), 0x100 * DllStructGetData($tIP, "Field1"))))
EndFunc
Func _WinAPI_GetClassName($hWnd)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	Local $aResult = DllCall("user32.dll", "int", "GetClassNameW", "hwnd", $hWnd, "wstr", "", "int", 4096)
	If @error Then Return SetError(@error, @extended, False)
	Return SetExtended($aResult[0], $aResult[2])
EndFunc
Func _WinAPI_IsClassName($hWnd, $sClassName)
	Local $sSeparator = Opt("GUIDataSeparatorChar")
	Local $aClassName = StringSplit($sClassName, $sSeparator)
	If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
	Local $sClassCheck = _WinAPI_GetClassName($hWnd) ; ClassName from Handle
	; check array of ClassNames against ClassName Returned
	For $x = 1 To UBound($aClassName) - 1
		If StringUpper(StringMid($sClassCheck, 1, StringLen($aClassName[$x]))) = StringUpper($aClassName[$x]) Then Return True
	Next
	Return False
EndFunc
Func _GUICtrlIpAddress_Set($hWnd, $sAddress)
;~ 	If $Debug_IP Then __UDF_ValidateClassName($hWnd, "SysIPAddress32")
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
#cs
Func _WinAPI_SetFont($hWnd, $hFont, $fRedraw = True)
	_SendMessage($hWnd, 0x0030, $hFont, $fRedraw, 0, "hwnd")
EndFunc
#ce
Func _WinAPI_GetStockObject($iObject)
	Local $aResult = DllCall("gdi32.dll", "handle", "GetStockObject", "int", $iObject)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aResult[0]
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
	; used all control ids
	#cs L'HO MESSO IO, OCIO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	If $_UDF_GlobalIDs_Used[$iUsedIndex][1] = 10000 + 55535 Then
		; check if control has been deleted, if so use that index in array
		For $iIDIndex = 2 To UBound($_UDF_GlobalIDs_Used, 2) - 1
			If $_UDF_GlobalIDs_Used[$iUsedIndex][$iIDIndex] = 0 Then
				$nCtrlID = ($iIDIndex - 2) + 10000
				$_UDF_GlobalIDs_Used[$iUsedIndex][$iIDIndex] = $nCtrlID
				Return $nCtrlID
			EndIf
		Next
		Return SetError(-1, 55535, 0) ; we have used up all available control ids
	EndIf
	#ce
	; new control id
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
	;_WinAPI_SetFont($hIPAddress, _WinAPI_GetStockObject(17))
	Return $hIPAddress
EndFunc
;#include <Misc.au3>
Global Const $tagSECURITY_ATTRIBUTES = "dword Length;ptr Descriptor;bool InheritHandle"
Func _WinAPI_GetLastError($curErr=@error, $curExt=@extended)
	Local $aResult = DllCall("kernel32.dll", "dword", "GetLastError")
	Return SetError($curErr, $curExt, $aResult[0])
EndFunc   ;==>_WinAPI_GetLastError
Func _Singleton($sOccurenceName, $iFlag = 0)
	Local $pSecurityAttributes = 0
	If BitAND($iFlag, 2) Then
		; The size of SECURITY_DESCRIPTOR is 20 bytes.  We just
		; need a block of memory the right size, we aren't going to
		; access any members directly so it's not important what
		; the members are, just that the total size is correct.
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
				Local $structSecurityAttributes = DllStructCreate($tagSECURITY_ATTRIBUTES)
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