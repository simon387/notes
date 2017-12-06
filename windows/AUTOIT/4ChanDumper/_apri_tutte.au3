#NoTrayIcon
#include 'HTTP_edited.au3'

Global Const $host = 'boards.4chan.org'
Global $clip = 'http://boards.chan.org'
;HotKeySet("{esc}", "quit")

While True
	While True
		If StringRegExp(ClipGet(), '^http://boards.4chan.org/[a-zA-Zאעטישל]+/res/[0-9]{1,}', 0) == 1 Then $clip = ClipGet()
		$string = InputBox('4ChanThreadDumper', 'paste the thread''s link', $clip)
		If @error == 1 Then Exit
		If StringRegExp($string, '^http://boards.4chan.org/[a-zA-Zאעטישל]+/res/[0-9]{1,}', 0) == 0 Then
			ExitLoop
			MsgBox(0, 'Error', 'Error on the URL entered')
		Else
			ExitLoop
		EndIf
	WEnd
	;ConsoleWrite("ok")
	Local $section = '/' & StringRegExpReplace(StringRegExpReplace($string, 'http://boards.4chan.org/', ''), '/res/[0-9]+' ,'') & '/', _
	$socket = TCPConnect(TCPNameToIP($host), 80)
	TCPSend($socket, 'GET ' & $section & 'res/' & StringRegExpReplace($string, 'http://boards.4chan.org/[a-zA-Zאעטישל]+/res/', '') _
	& ' HTTP/1.1' & @CRLF & 'Host: ' & $host & @CRLF & 'User-Agent: n/a' & @CRLF & 'Connection: close' & @CRLF & '' & @CRLF)
	$body = _HTTPRead($socket)
	TCPCloseSocket($socket)
	If @error == 0 Then
		$array = StringRegExp($body, '<a href="//images.4chan.org' & $section & 'src/(\d*?.\w*)" target', 3)
		For $c = 0 To UBound($array) - 1
			ToolTip('Opening image ' & $c + 1 & '/' & UBound($array), 1, 1)
			ShellExecute('http://images.4chan.org' & $section & 'src/' & $array[$c])
			Sleep(100);100
		Next
		ToolTip('')
	EndIf
WEnd

Func quit()
	Exit
EndFunc