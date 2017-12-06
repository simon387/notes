;#NoTrayIcon

#include 'HTTP_edited.au3'

Global Const $host = 'www.myip.it'
Global Const $iNick[2] = [982, 519]
Global Const $iPassword[2] = [994, 563]
Global Const $sTitle = "goalunited - il gioco del calcio di nuova generazione - Opera"
Global Const $sNick = " "
Global Const $sPassword = ""

Sleep(30000);30000

ShellExecute("http://game.global.goalunited.org/loader.php")

Sleep(5000)

WinActivate($sTitle)
WinWaitActive($sTitle)
Sleep(1000)
Send("{F5}")
Sleep(10000)
MouseClick("left", $iNick[0], $iNick[1], 2, 0)
Sleep(1000)
Send($sNick)
Sleep(1000)
MouseClick("left", $iPassword[0], $iPassword[1], 2, 0)
Sleep(1000)
Send($sPassword)
Sleep(1000)
Send("{enter}")
Sleep(1000)

$hFile = FileOpen("log.txt", 1)
FileWriteLine($hFile, @MDAY & "/" & @MON & "/" & @YEAR & "@" & @HOUR & ":" & @MIN & ":" & @SEC & " - Done" & @CRLF)
FileClose($hFile)

$socket = TCPConnect(TCPNameToIP($host), 80)
TCPSend($socket, 'GET http://www.myip.it/'  & ' HTTP/1.1' & @CRLF & 'Host: ' & $host & @CRLF & 'User-Agent: n/a' & @CRLF & 'Connection: close' & @CRLF & '' & @CRLF)
$body = _HTTPRead($socket)
TCPCloseSocket($socket)
$h = FileOpen("body.txt", 1)
FileWrite($h, $body)
FileClose($h)

screen()
Sleep(60000)

Shutdown(1)

Func screen()
	Send("{PRINTSCREEN}")
	Sleep(999)
	Run("mspaint.exe")
	Sleep(999)
	Send("^v")
	Sleep(999)
	Send("!f4")
	Sleep(999)
	Send("s")
	Sleep(999)
	Send("C:\Users\Simone\Dropbox\AUTOIT\gu_login\" & @MDAY & "_" & @MON & "_" & @YEAR & "_" & @HOUR & "_" & @MIN & "_" & @SEC )
	Sleep(999)
	Send("{enter}")
EndFunc