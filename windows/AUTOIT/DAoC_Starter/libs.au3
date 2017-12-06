#include-once; 1 cripta; 0 decripta ;#include <_ControlHover.au3>
;#include <ComboConstants.au3>;Global Const $CBS_DROPDOWNLIST = 0x3;Global Const $CBS_AUTOHSCROLL = 0x40;#include <EditConstants.au3>;Global Const $GUI_SS_DEFAULT_INPUT = 128;Global Const $ES_CENTER = 1;Global Const $ES_NUMBER = 8192;#include <GUIConstantsEx.au3>;#include <StaticConstants.au3>;Global Const $SS_CENTER = 0x1;#include <WindowsConstants.au3>;#include <GUIListBox.au3>
Global Const $GUI_CHECKED = 1
Global Const $GUI_HIDE = 32
Global Const $GUI_UNCHECKED = 4
Global Const $GUI_SHOW = 16
Global Const $GUI_EVENT_CLOSE = -3
Global Const $GUI_ENABLE = 64
Global Const $GUI_DISABLE = 128
Global Const $GUI_EVENT_MINIMIZE = -4;#include <string.au3>

Func _StringEncrypt($i_Encrypt, $s_EncryptText);, $i_EncryptLevel = 1);If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then	SetError(1, 0, '')	ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then	SetError(1, 0, '')	Else	If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
	Local $s_EncryptPassword = "Dark Age of Camelot"
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

Func _GUICtrlIpAddress_Get($hWnd)
	Local $tIP = DllStructCreate("byte Field4;byte Field3;byte Field2;byte Field1")
	Local $pIP = DllStructGetPtr($tIP)
	_SendMessage($hWnd, 1126, 0, $pIP, 0, "wparam", "ptr")
	Return StringFormat("%d.%d.%d.%d", DllStructGetData($tIP, "Field1"), DllStructGetData($tIP, "Field2"), DllStructGetData($tIP, "Field3"), DllStructGetData($tIP, "Field4"))
EndFunc

Func _WinAPI_ShowWindow($hWnd, $iCmdShow)
	Local $aResult = DllCall("user32.dll", "bool", "ShowWindow", "hwnd", $hWnd, "int", $iCmdShow)
	Return $aResult[0]
EndFunc

;~ Func _GUICtrlIpAddress_ShowHide($hWnd, $iState);If $iState <> @SW_HIDE And $iState <> @SW_SHOW Then Return SetError(1, 1, 0)
;~ 	Return _WinAPI_ShowWindow($hWnd, $iState); <> 0
;~ EndFunc

Func _GUICtrlIpAddress_Set($hWnd, $sAddress)
	Local $aAddress = StringSplit($sAddress, ".")
	If $aAddress[0] = 4 Then
		Local $tIP = DllStructCreate("byte Field4;byte Field3;byte Field2;byte Field1")
		For $x = 1 To 4
			DllStructSetData($tIP, "Field" & $x, $aAddress[$x])
		Next
		_SendMessage($hWnd, 1125, 0, BitOR(BitShift(BitOR(DllStructGetData($tIP, "Field2"), 0x100 * DllStructGetData($tIP, "Field1")), -16), BitAND(BitOR(DllStructGetData($tIP, "Field4"), 0x100 * DllStructGetData($tIP, "Field3")), 0xFFFF)))
	EndIf
EndFunc

Func _SendMessage($hWnd, $iMsg, $wParam = 0, $lParam = 0, $iReturn = 0, $wParamType = "wparam", $lParamType = "lparam")
	Local $aResult = DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $hWnd, "uint", $iMsg, $wParamType, $wParam, $lParamType, $lParam)
	If @error Then Return SetError(@error, @extended, "")
	If $iReturn >= 0 And $iReturn <= 4 Then Return $aResult[$iReturn]
	Return $aResult
EndFunc

Func _WinAPI_GetModuleHandle()
	Local $aResult = DllCall("kernel32.dll", "handle", "GetModuleHandleW", "ptr", 0)
	Return $aResult[0]
EndFunc

;~ Func _WinAPI_CreateWindowEx($iExStyle, $sClass, $sName, $iStyle, $iX, $iY, $iWidth, $iHeight, $hParent, $hMenu)
;~ 	Local $aResult = DllCall("user32.dll", "hwnd", "CreateWindowExW", "dword", $iExStyle, "wstr", $sClass, "wstr", $sName, "dword", $iStyle, "int", $iX, "int", $iY, "int", $iWidth, "int", $iHeight, "hwnd", $hParent, "handle", $hMenu, "handle", _WinAPI_GetModuleHandle(), "ptr", 0)
;~ 	Return $aResult[0]
;~ EndFunc

Func __UDF_GetNextGlobalID($hWnd)
	Local $nCtrlID, $iUsedIndex = -1, $fAllUsed = True; check if window still exists
	If Not WinExists($hWnd) Then Return SetError(-1, -1, 0); check that all slots still hold valid window handles
	For $iIndex = 0 To 15
		If $_UDF_GlobalIDs_Used[$iIndex][0] <> 0 Then; window no longer exist, free up the slot and reset the control id counter
			If Not WinExists($_UDF_GlobalIDs_Used[$iIndex][0]) Then
				For $x = 0 To UBound($_UDF_GlobalIDs_Used, 2) - 1
					$_UDF_GlobalIDs_Used[$iIndex][$x] = 0
				Next
				$_UDF_GlobalIDs_Used[$iIndex][1] = 10000
				$fAllUsed = False
			EndIf
		EndIf
	Next; check if window has been used before with this function
	For $iIndex = 0 To 15
		If $_UDF_GlobalIDs_Used[$iIndex][0] = $hWnd Then
			$iUsedIndex = $iIndex
			ExitLoop ; $hWnd has been used before
		EndIf
	Next; window hasn't been used before, get 1st un-used index
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

Func _GUICtrlIpAddress_Create($hWnd, $iX, $iY, $iWidth, $iHeight);, $iStyles = 0x00000000, $iExstyles = 0x00000000);If Not IsHWnd($hWnd) Then Return SetError(1, 0, 0) ; Invalid Window handle for _GUICtrlIpAddress_Create 1st parameter
	Local $tICCE = DllStructCreate('dword dwSize;dword dwICC')
	DllStructSetData($tICCE, "dwSize", DllStructGetSize($tICCE))
	DllStructSetData($tICCE, "dwICC", 0x0800)
	DllCall('comctl32.dll', 'bool', 'InitCommonControlsEx', 'struct*', $tICCE)
	If @error Then Return SetError(@error, @extended, 0)
	Local $nCtrlID = __UDF_GetNextGlobalID($hWnd)
	If @error Then Return SetError(@error, @extended, 0)
	Local $aResultX = DllCall("user32.dll", "hwnd", "CreateWindowExW", "dword", 0x00000000, "wstr", 'SysIPAddress32', "wstr", "", "dword", 1342242816, "int", $iX, "int", $iY, "int", $iWidth, "int", $iHeight, "hwnd", $hWnd, "handle", $nCtrlID, "handle", _WinAPI_GetModuleHandle(), "ptr", 0)
	Local $hIPAddress = $aResultX[0]
;~ 	Local $hIPAddress = _WinAPI_CreateWindowEx(0x00000000, 'SysIPAddress32', "", 1342242816, $iX, $iY, $iWidth, $iHeight, $hWnd, $nCtrlID)
	Local $aResult = DllCall("gdi32.dll", "handle", "GetStockObject", "int", 17)
	_SendMessage($hIPAddress, 48, $aResult[0], True, 0, "hwnd")
	Return $hIPAddress
EndFunc;#include <Misc.au3>

Func _Singleton($sOccurenceName);, $iFlag = 0)
	;Local $pSecurityAttributes = 0
	#cs If BitAND($iFlag, 2) Then; The size of SECURITY_DESCRIPTOR is 20 bytes.  We just need a block of memory the right size, we aren't going to access any members directly so it's not important what the members are, just that the total size is correct.
		Local $tSecurityDescriptor = DllStructCreate("dword[5]")
		Local $pSecurityDescriptor = DllStructGetPtr($tSecurityDescriptor); Initialize the security descriptor.
		Local $aRet = DllCall("advapi32.dll", "bool", "InitializeSecurityDescriptor", "ptr", $pSecurityDescriptor, "dword", 1)
		If @error Then Return SetError(@error, @extended, 0)
		If $aRet[0] Then; Add the NULL DACL specifying access to everybody.
			$aRet = DllCall("advapi32.dll", "bool", "SetSecurityDescriptorDacl", "ptr", $pSecurityDescriptor, "bool", 1, "ptr", 0, "bool", 0)
			If @error Then Return SetError(@error, @extended, 0)
			If $aRet[0] Then; Create a SECURITY_ATTRIBUTES structure.
				Local $structSecurityAttributes = DllStructCreate("dword Length;ptr Descriptor;bool InheritHandle"); Assign the members.
				DllStructSetData($structSecurityAttributes, 1, DllStructGetSize($structSecurityAttributes))
				DllStructSetData($structSecurityAttributes, 2, $pSecurityDescriptor)
				DllStructSetData($structSecurityAttributes, 3, 0); Everything went okay so update our pointer to point to our structure.
				$pSecurityAttributes = DllStructGetPtr($structSecurityAttributes)
			EndIf
		EndIf
	EndIf
	#ce
	Local $handle = DllCall("kernel32.dll", "handle", "CreateMutexW", "ptr", 0, "bool", 1, "wstr", $sOccurenceName)
	If @error Then Return SetError(@error, @extended, 0)
	Local $lastError = DllCall("kernel32.dll", "dword", "GetLastError")
	If @error Then Return SetError(@error, @extended, 0)
	If $lastError[0] = 183 Then
		;If BitAND(0, 1) Then
		;	Return SetError($lastError[0], $lastError[0], 0)
		;Else
			Exit -1
		;EndIf
	EndIf
	;Return $handle[0]	// modificato io
EndFunc
#cs
Func _WinAPI_RegisterWindowMessage($sMessage)
	Local $aResult = DllCall("user32.dll", "uint", "RegisterWindowMessageW", "wstr", $sMessage)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aResult[0]
EndFunc   ;==>_WinAPI_RegisterWindowMessage
#ce
;~ #include <WinAPI.au3>
#cs
	Title:   		File System Monitoring UDF Library for AutoIt3
	Filename:  		FileSystemMonitor.au3
	Description: 	A collection of functions for monitoring the Windows File System
	Author:   		seangriffin
	Version:  		V0.4
	Last Update: 	02/05/10
	Requirements: 	AutoIt3 3.2 or higher
	Changelog:		---------02/05/10---------- v0.4
					Updated "FileSystemMonitor example.au3" to include an $event_id check and filter for unexpected events.
					Fixed "FileSystemMonitor Explorer example.au3" to exclude the "_GUICtrlListView_SetUnicodeFormat" call.
					Fixed "$LVN_ENDLABELEDIT" to be "$LVN_ENDLABELEDITA" in "FileSystemMonitor Explorer example.au3" for better compatibility.

					---------01/05/10---------- v0.3
					Removed the $shell_gui param from functions.  Not required, now managed internally.
					Updated "FileSystemMonitor Explorer example.au3" to select drive "C" if the currently selected drive is disconnected.
					Fixed error in "FileSystemMonitor Explorer example.au3" when an inactive drive is selected.
					Updated "FileSystemMonitor Explorer example.au3" to use $scroll_checkbox.
					Updated "FileSystemMonitor Explorer example.au3" to allow file/folder rename (F2) and deletion (Delete).

					---------01/05/10---------- v0.2
					Removed unused external UDF references.
					Updated remarks to indicate that the user must create _FileSysMonActionEvent.
					Removed the use of $old_Filename (a failed attempt to hide duplicate events).
					Fixed a bug where _FileSysMonSetDirMonPath() was still reporting the next change in the previous path.

					---------29/04/10---------- v0.1
					Initial release.

#ce
#EndRegion Header
#Region Global Variables and Constants
;Global $pDirEvents, $hDir, $pOverLapped, $tFNI, $pBuffer, $Filename, $register, $iBufferSize, $tOverLapped
;Global $tBuffer, $tDirEvents, $iDirEvents, $hEvent, $fsm_shell_mon_gui = GUICreate("")
#EndRegion Global Variables and Constants
#Region Core functions
; #FUNCTION# ;===============================================================================
;
; Name...........:	_FileSysMonSetup()
; Description ...:	Setup File System Montioring.
; Syntax.........:	_FileSysMonSetup($monitor_type = 3, $dir_monitor_path = "C:\", $shell_monitor_path = "")
; Parameters ....:	$monitor_type		- Optional: The type of monitoring to use.
;											1 = directory monitoring only
;											2 = shell monitoring only
;											3 = both directory and shell monitoring
;					$dir_monitor_path	- Optional: The path to use for directory monitoring.
;											The path "C:\" is used if one isn't provided.
;					$shell_monitor_path	- Optional: The path to use for shell monitoring.
;											The blank path is used if one isn't provided. This
;											denotes that system-wide shell events will be monitored.
; Return values .: 	On Success			- Returns True.
;                 	On Failure			- Returns False.
;
; Author ........:	seangriffin
; Modified.......:
; Remarks .......:	A call to this function should be inserted in a script prior to calling other
;					functions in this UDF.  Ideally the function should be placed before
;					the main message loop in a GUI-based script.
;
; Related .......:
; Link ..........:
; Example .......:	Yes
;
; ;==========================================================================================
#cs
func _FileSysMonSetup($monitor_type = 3, $dir_monitor_path = "C:\", $shell_monitor_path = "")

	if $monitor_type = 1 or $monitor_type = 3 Then

		; Setup the Directory Event Handler

		$sdir = $dir_monitor_path
		$tBuffer = DllStructCreate("byte[4096]")
		$pBuffer = DllStructGetPtr($tBuffer)
		$iBufferSize = DllStructGetSize($tBuffer)
		$tFNI = 0
		$hDir = DllCall("kernel32.dll", "hwnd", "CreateFile", "Str", $sdir, "Int", 0x1, "Int", BitOR(0x1, 0x4, 0x2), "ptr", 0, "int", 0x3, "int", BitOR(0x2000000, 0x40000000), "int", 0)
		$hDir = $hDir[0]
		$tReadLen = DllStructCreate("dword ReadLen")
		$tOverLapped = DllStructCreate("Uint OL1;Uint OL2; Uint OL3; Uint OL4; hwnd OL5")

		For $i = 1 To 5

			DllStructSetData($tOverLapped, $i, 0)
		Next

		$pOverLapped = DllStructGetPtr($tOverLapped)
		$iOverLappedSize = DllStructGetSize($tOverLapped)
		$tDirEvents = DllStructCreate("hwnd DirEvents")
		$pDirEvents = DllStructGetPtr($tDirEvents)
		$iDirEvents = DllStructGetSize($tDirEvents)
		$hEvent = DllCall("kernel32.dll", "hwnd", "CreateEvent", "UInt", 0, "Int", True, "Int", False, "UInt", 0)
		DllStructSetData($tOverLapped, 5, $hEvent[0])
		DllStructSetData($tDirEvents, 1, $hEvent[0])
		$ret = DllCall("kernel32.dll", "Int", "ReadDirectoryChangesW", "hwnd", $hDir, "ptr", $pBuffer, "dword", $iBufferSize, "int", False, "dword", BitOR(0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x100), "Uint", 0, "Uint", $pOverLapped, "Uint", 0)
		$Filename = ""
	EndIf

	; Setup the Shell Event Handler

	if $monitor_type = 2 or $monitor_type = 3 Then

		; Register a window message to associate an AutoIT function with the change notification events
		$SHNOTIFY = _WinAPI_RegisterWindowMessage("shchangenotifymsg")
		GUIRegisterMsg($SHNOTIFY, "_FileSysMonShellEventHandler")

		; Setup the structure for registering the gui to receive shell notifications

		if StringCompare($shell_monitor_path, "") <> 0 Then

			$ppidl = DllCall("shell32.dll", "ptr", "ILCreateFromPath", "wstr", $shell_monitor_path)
		EndIf

		$shnotifystruct = DllStructCreate("ptr pidl; int fRecursive")

		if StringCompare($shell_monitor_path, "") <> 0 Then

			DllStructSetData($shnotifystruct, "pidl", $ppidl[0])
		Else

			DllStructSetData($shnotifystruct, "pidl", 0)
		EndIf

		DllStructSetData($shnotifystruct, "fRecursive", 0)

		; Register the gui to receive shell notifications
		$register = DllCall("shell32.dll", "int", "SHChangeNotifyRegister", "hwnd", $fsm_shell_mon_gui, "int", BitOR(0x0001, 0x0002), "long", 0x7FFFFFFF, "uint", $SHNOTIFY, "int", 1, "ptr", DllStructGetPtr($shnotifystruct))

		if StringCompare($shell_monitor_path, "") <> 0 Then

			DllCall("ole32.dll", "none", "CoTaskMemFree", "ptr", $ppidl[0])
		EndIf
	EndIf

	Return True
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........:	_FileSysMonSetDirMonPath()
; Description ...:	Change the path of Directory Monitoring
; Syntax.........:	_FileSysMonSetDirMonPath($dir_monitor_path = "C:\")
; Parameters ....:	$dir_monitor_path	- Optional: The path to use for directory monitoring.
;											The path "C:\" is used if one isn't provided.
; Return values .: 	On Success			- Returns True.
;                 	On Failure			- Returns False.
;
; Author ........:	seangriffin
; Modified.......:
; Remarks .......:	For an unknown reason, after this function is called the
;
; Related .......:
; Link ..........:
; Example .......:	Yes
;
; ;==========================================================================================
func _FileSysMonSetDirMonPath($dir_monitor_path = "C:\")

	$sdir = $dir_monitor_path
	$hDir = DllCall("kernel32.dll", "hwnd", "CreateFile", "Str", $sdir, "Int", 0x1, "Int", BitOR(0x1, 0x4, 0x2), "ptr", 0, "int", 0x3, "int", BitOR(0x2000000, 0x40000000), "int", 0)
	$hDir = $hDir[0]

	For $i = 1 To 5

		DllStructSetData($tOverLapped, $i, 0)
	Next

	$hEvent = DllCall("kernel32.dll", "hwnd", "CreateEvent", "UInt", 0, "Int", True, "Int", False, "UInt", 0)
	DllStructSetData($tOverLapped, 5, $hEvent[0])
	DllStructSetData($tDirEvents, 1, $hEvent[0])
	$ret = DllCall("kernel32.dll", "Int", "ReadDirectoryChangesW", "hwnd", $hDir, "ptr", $pBuffer, "dword", $iBufferSize, "int", False, "dword", BitOR(0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x100), "Uint", 0, "Uint", $pOverLapped, "Uint", 0)
	Return True
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........:	_FileSysMonSetShellMonPath()
; Description ...:	Change the path of Shell Monitoring
; Syntax.........:	_FileSysMonSetShellMonPath($dir_monitor_path = "")
; Parameters ....:	$dir_monitor_path	- Optional: The path to use for shell monitoring.
;											The path "" is used if one isn't provided.
; Return values .: 	On Success			- Returns True.
;                 	On Failure			- Returns False.
;
; Author ........:	seangriffin
; Modified.......:
; Remarks .......:
;
; Related .......:
; Link ..........:
; Example .......:	Yes
;
; ;==========================================================================================
func _FileSysMonSetShellMonPath($shell_monitor_path = "")

	; De-Register the gui from receiving shell notifications
	DllCall("shell32.dll", "int", "SHChangeNotifyDeregister", "ulong", $register[0])

	; Register a window message to associate an AutoIT function with the change notification events
	$SHNOTIFY = _WinAPI_RegisterWindowMessage("shchangenotifymsg")
	GUIRegisterMsg($SHNOTIFY, "_FileSysMonShellEventHandler")

	; Setup the structure for registering the gui to receive shell notifications

	if StringCompare($shell_monitor_path, "") <> 0 Then

		$ppidl = DllCall("shell32.dll", "ptr", "ILCreateFromPath", "wstr", $shell_monitor_path)
	EndIf

	$shnotifystruct = DllStructCreate("ptr pidl; int fRecursive")

	if StringCompare($shell_monitor_path, "") <> 0 Then

		DllStructSetData($shnotifystruct, "pidl", $ppidl[0])
	Else

		DllStructSetData($shnotifystruct, "pidl", 0)
	EndIf

	DllStructSetData($shnotifystruct, "fRecursive", 0)

	; Register the gui to receive shell notifications
	$register = DllCall("shell32.dll", "int", "SHChangeNotifyRegister", "hwnd", $fsm_shell_mon_gui, "int", BitOR(0x0001, 0x0002), "long", 0x7FFFFFFF, "uint", $SHNOTIFY, "int", 1, "ptr", DllStructGetPtr($shnotifystruct))

	if StringCompare($shell_monitor_path, "") <> 0 Then

		DllCall("ole32.dll", "none", "CoTaskMemFree", "ptr", $ppidl[0])
	EndIf

	Return True
EndFunc

; #FUNCTION# ;===============================================================================
;
; Name...........:	_FileSysMonDirEventHandler()
; Description ...:	Monitors the file system for changes to a given directory.  If a change event occurs,
;						the user-defined "_FileSysMonActionEvent" function is called.
; Syntax.........:	_FileSysMonDirEventHandler()
; Parameters ....:	none
; Return values .: 	On Success			- Returns True.
;                 	On Failure			- Returns False.
;
; Author ........:	seangriffin
; Modified.......:
; Remarks .......:	This function utilises the "ReadDirectoryChangesW" Win32 operating system function to
;					monitor the a directory for changes.
;
;					The ReadDirectoryChangesW function appears to queue events, such that whenever
;					it is called, all unprocessed events are retrieved one at a time.
;
;					The function "_FileSysMonSetup" must be called, with a $monitor_type
;					of either 1 or 3, prior to calling this	function.
;
;					A call to this function should be inserted within the main message loop of a GUI-based script.
;
;					A user-defined function to action the events is required to be created by the user
;					in the calling script, and must be defined as follows:
;
;					Func _FileSysMonActionEvent($event_type, $event_id, $event_value)
;
;					EndFunc
;
; Related .......:
; Link ..........:
; Example .......:	Yes
;
; ;==========================================================================================
func _FileSysMonDirEventHandler()

	Local $r, $iOffset, $nReadLen, $tStr, $iNext, $ff, $ret

	$r = DllCall("User32.dll", "dword", "MsgWaitForMultipleObjectsEx", "dword", 1, "ptr", $pDirEvents, "dword", 100, "dword", 0x4FF, "dword", 0x6)

	If $r[0] = 0 Then

		$iOffset = 0
		$nReadLen = 0
		DllCall("kernel32.dll", "Uint", "GetOverlappedResult", "hWnd", $hDir, "Uint", $pOverLapped, "UInt*", $nReadLen, "Int", True)

		While 1

			$tFNI = DllStructCreate("dword Next;dword Action;dword FilenameLen", $pBuffer + $iOffset)
			$tStr = DllStructCreate("wchar[" & DllStructGetData($tFNI, "FilenameLen") / 2 & "]", $pBuffer + $iOffset + 12)
			$Filename = DllStructGetData($tStr, 1)
			_FileSysMonActionEvent(0, DllStructGetData($tFNI, "Action"), $Filename)
			$iNext = DllStructGetData($tFNI, "Next")
			If $iNext = 0 Then ExitLoop
			$iOffset += $iNext
		WEnd

		$ff = DllStructGetData($tOverLapped, 5)
		DllCall("kernel32.dll", "Uint", "ResetEvent", "UInt", $ff)
		$ret = DllCall("kernel32.dll", "Int", "ReadDirectoryChangesW", "hwnd", $hDir, "ptr", $pBuffer, "dword", $iBufferSize, "int", False, "dword", BitOR(0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x100), "Uint", 0, "Uint", $pOverLapped, "Uint", 0)
	EndIf

	Return True
EndFunc


; #FUNCTION# ;===============================================================================
;
; Name...........:	_FileSysMonShellEventHandler()
; Description ...:	Monitors the file system for shell events.
; Syntax.........:	_FileSysMonShellEventHandler()
; Parameters ....:	$hWnd			- The Window handle of the GUI in which the message appears.
;					$Msg			- The Windows message ID.
;					$wParam			- The first message parameter as hex value.
;					$lParam			- The second message parameter as hex value.
; Return values .: 	On Success		- Returns True.
;                 	On Failure		- Returns False.
;
; Author ........:	seangriffin
; Modified.......:
; Remarks .......:	If a directory was provided in "_FileSysMonSetup" then only events in
;					that directory will be caught.  If no directory was provided, then
;					system-wide events will be caught.
;
;					This function utilises the "SHChangeNotifyRegister" Win32 operating system functionality
;					monitor a system or directory for changes relating to the Windows shell.
;
;					The function "_FileSysMonSetup" must be called, with a $monitor_type
;					of either 2 or 3, prior to calling this	function.
;
;					A call to this function is not required.  It is triggered automatically
;					for each new shell event.
;
;					A user-defined function to action the events is required to be created by the user
;					in the calling script, and must be defined as follows:
;
;					Func _FileSysMonActionEvent($event_type, $event_id, $event_value)
;
;					EndFunc
;
; Related .......:
; Link ..........:
; Example .......:	Yes
;
; ;==========================================================================================
Func _FileSysMonShellEventHandler($hWnd, $Msg, $wParam, $lParam)

	Local $path, $Destination, $ret, $wHighBit

    $path = DllStructCreate("dword dwItem1; dword dwItem2", $wParam)
    $ret = DllCall("shell32.dll", "int", "SHGetPathFromIDList", "ptr", DllStructGetData($path, "dwItem1"), "str", "")

	; Get the drive for which free space has changed
	if $lParam = 0x00040000 Then

		$Destination = DllStructCreate("long")
		DllCall("kernel32.dll", "none", "RtlMoveMemory", "ptr", DllStructGetPtr($Destination), "ptr", (DllStructGetData($path, "dwItem1")+2),"int", 4)	; CopyMemory
		$wHighBit = Int(Log(DllStructGetData($Destination, 1)) / Log(2))
		$ret[2] = Chr(65 + $wHighBit)
	EndIf

	if $lParam <> 0x00000002 And $lParam <> 0x00000004 Then ; FILE_ACTION_ADDED & FILE_ACTION_REMOVED skipped due to a deadlock with Directory_Event_Handler()

		_FileSysMonActionEvent(1, $lParam, $ret[2])
	EndIf

	Return True
EndFunc
#ce