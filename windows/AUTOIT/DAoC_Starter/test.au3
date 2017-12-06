HotKeySet('q', 'quit')

Global $sPath		= 'C:\DA\camelot.exe'
Global $sIP			= '63.117.29.225'
Global $sPort		= '10622'
Global $sAccount	= ' '
Global $sPassword	= ' '

MsgBox(0,0,Random(0,7,1))
Exit

;FileInstall("C:\Users\Simone\Dropbox\AUTOIT\DAoC_Starter\dolloader.exe", @TempDir & "\dolloader.exe")
FileInstall("C:\Users\Simone\Dropbox\AUTOIT\DAoC_Starter\login.dll", @TempDir & "\login.dll")

MsgBox(0,0,"""" & StringReplace($sPath, "camelot.exe", "game.dll") & """ " & $sIP & " " & $sPort & " 1 " & $sAccount & " " & $sPassword, StringReplace($sPath, "\camelot.exe", ""))

ShellExecute(@TempDir & "\login.dll ", """" & StringReplace($sPath, "camelot.exe", "game.dll") & """ " & $sIP & " " & $sPort & " 20 " & $sAccount & " " & $sPassword, StringReplace($sPath, "\camelot.exe", ""))

ConsoleWrite(@CRLF)

Func printf($sTemp = '')
	ConsoleWrite(@CRLF & $sTemp)
EndFunc

Func quit()
	Exit
EndFunc

;to do list:
	;scelta pg intelligente
	;database risoluzioni