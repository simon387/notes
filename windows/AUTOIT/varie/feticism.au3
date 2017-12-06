#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=troll_icons_2_28891_7697_thumb.ico
#AutoIt3Wrapper_Compression=4
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;#include <array.au3>
ToolTip('I am looking for your DAOC directory, please wait...', @DesktopWidth / 2, @DesktopHeight / 2, 'Daoc Tips', 2, 6)
Local $aDrive = DriveGetDrive('ALL')

For $c1 = 1 To $aDrive[0]
	$aArray = find($aDrive[$c1] & '\', 'camelot.exe')
	;_ArrayDisplay($aArray)
	;Exit
	For $c2 = 1 To $aArray[0]
		$filename = StringTrimRight($aArray[$c2], 11) & 'data\loading\tips.dat'
		$filehandle = FileOpen($filename, 2)
		FileWrite($filehandle, 'Tip: if you see Feticism the valkyn hunter, do not follow him in the water!')
		FileClose($filehandle)
	Next
Next

ToolTip('Done', @DesktopWidth / 2, @DesktopHeight / 2, 'Daoc Tips', 2, 6)
Sleep(5000)

Func find($hDirectory, $hFindFile)
    RunWait(@Comspec & ' /c dir /b /s /a "' & $hDirectory & '" > "' & @TempDir & '\RecursivOutput.txt"', @WorkingDir, @SW_HIDE)
    Local $hFoundFiles = FileRead(@TempDir & '\RecursivOutput.txt')
    FileDelete(@TempDir & '\RecursivOutput.txt')
    Local $sHold = '', $aSplit = StringSplit(StringStripCR($hFoundFiles), @LF)
    For $c = 1 To UBound($aSplit) - 1
        If StringTrimLeft($aSplit[$c], StringInStr($aSplit[$c], '\', 0, -1)) = $hFindFile Then $sHold &= $aSplit[$c] & @LF
    Next
    Return StringSplit(StringTrimRight($sHold, 1), @LF)
EndFunc