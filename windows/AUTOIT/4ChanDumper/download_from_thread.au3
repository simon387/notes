;#NoTrayIcon
#include 'HTTP_edited.au3'

Global Const $string = InputBox('4ChanThreadDumper', 'paste the thread''s link', 'http://boards.chan.org'), $host = 'boards.4chan.org', $dld = @ScriptDir & '\Download\'

If StringRegExp($string, '^http://boards.4chan.org/[a-zA-Zאעטישל]+/res/[0-9]{1,}', 0) == 0 Then Exitp('Error on the URL entered')
;Returns 1 (matched) or 0 (no match)
Global const $section = '/' & StringRegExpReplace(StringRegExpReplace($string, 'http://boards.4chan.org/', ''), '/res/[0-9]+' ,'') & '/', $socket = TCPConnect(TCPNameToIP($host), 80)

If $socket == -1 Then exitp('Connection socket error')

TCPSend($socket, 'GET ' & $section & 'res/' & StringRegExpReplace($string, 'http://boards.4chan.org/[a-zA-Zאעטישל]+/res/', '') & ' HTTP/1.1' & @CRLF & 'Host: ' & $host & @CRLF & 'User-Agent: n/a' & @CRLF & 'Connection: close' & @CRLF & '' & @CRLF)
$body = _HTTPRead($socket)

TCPCloseSocket($socket)

If @error == 0 Then
	$a1 = StringRegExp($body, '<a href="http://images.4chan.org' & $section & 'src/(\d*?.\w*)" target=_blank><img', 3)
	$u2 = UBound($a1) - 1
	DirCreate($dld)
	ToolTip($u2 & ' images found')
	For $c2 = 0 To $u2
		;ToolTip('downloading image ' & $c2 & '/' & $u2 + 1)
		ConsoleWrite('downloading image ' & $c2 + 1 & '/' & $u2 + 1 & @CRLF)

		;InetGet('http://images.4chan.org' & $section & 'src/' & $a1[$c2], $dld & $a1[$c2], 9, 0);0get from cache, 1 //

		;Run("test.exe " & 'http://images.4chan.org' & $section & 'src/' & $a1[$c2] & " " & $dld & $a1[$c2] & " 9 1 " & $c2 & '/' & $u2 + 1)
		ShellExecute('http://images.4chan.org' & $section & 'src/' & $a1[$c2])
		;Sleep(200)
		;While InetGetInfo() >= 8 ; download simultanei
		;	Sleep(1000);GUICtrlSetData($Label_8, "Pausing, simultaneous downloads: " & InetGetInfo())
		;WEnd
	Next
	exitp('script correctly ended')
Else
	exitp('error on tcp protocol')
EndIf

Func exitp($string)
	;ToolTip($string, @DesktopWidth / 2, @DesktopHeight / 2, 'Important Message')
	MsgBox(0, 'Important Message', $string)
	Sleep(5000)
	Exit
EndFunc

While InetGetInfo() > 0 ; download simultanei
	Sleep(1000);GUICtrlSetData($Label_8, "Pausing, simultaneous downloads: " & InetGetInfo())
WEnd;http://boards.4chan.org/gif/res/4183592