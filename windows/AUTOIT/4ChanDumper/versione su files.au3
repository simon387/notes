#include "HTTP.au3"

Global Const $host = "boards.4chan.org"
Global Const $port = 80
Global $section = "gif"
Global $page = "/" & $section & "/"

ConsoleWriteDedug("Script started")
HotKeySet("{ESC}", "ExitScript")
For $i = 0 To 15
	If $i == 0 Then
		$string = ""
	Else
		$string = $i
	EndIf
	ConsoleWriteDedug("Connecting to " & $host & " on port " & $port)
	$socket = _HTTPConnect($host, $port)
	If $socket <> -1 Then
		ConsoleWriteDedug("Connected, socket number: " & $socket)
	Else
		ExitScript(" - Unable to connect")
	EndIf
	ConsoleWriteDedug("Requesting page " & $host & $page & $string)
	ConsoleWriteDedug("Bytes sent: " & _HTTPGet($host, $page & $string, $socket))
	$text = _HTTPRead($socket)
	_HTTPClose($socket)
	If @error == 0 Then
		$fhandle = FileOpen("page_" & $string & ".html", 2)
		FileWrite($fhandle, $text)
		FileClose($fhandle)
		ConsoleWriteDedug(FileGetSize("page_" & $string & ".html") & " bytes received and written in page_" & $string & ".html")
		$fhandle = FileOpen("page_" & $string & ".html", 0)
		$array = StringRegExp(FileRead($fhandle), '<a href="res/(\d*?)">', 3)
		for $c = 0 To UBound($array) - 1
			ConsoleWriteDedug("Connecting to " & $host & " on port " & $port)
			$socket = _HTTPConnect($host, $port)
			If $socket <> -1 Then
				ConsoleWriteDedug("Connected, socket number: " & $socket)
			Else
				ExitScript(" - Unable to connect")
			EndIf
			ConsoleWriteDedug("Requesting page " & $host & $page & "res/" & $array[$c])
			ConsoleWriteDedug("Bytes sent: " & _HTTPGet($host, $page & "res/" & $array[$c], $socket))
			$text = _HTTPRead($socket)
			_HTTPClose($socket)
			If @error == 0 Then
				$fhandle2 = FileOpen("thread_" & $c & "_page_" & $i & ".html", 2)
				FileWrite($fhandle2, $text)
				FileClose($fhandle2)
				ConsoleWriteDedug(FileGetSize("thread_" & $c & "_page_" & $i & ".html") & " bytes received and written in thread_" & $c & "_page_" & $i & ".html")
				$fhandle2 = FileOpen("thread_" & $c & "_page_" & $i & ".html", 0)
				$array2 = StringRegExp(FileRead($fhandle2), '<a href="http://images.4chan.org/' & $section & '/src/(\d*?).' & $section & '" target=_blank><img', 3)
				DirCreate(@ScriptDir & "\Download")
				For $d = 0 To UBound($array2) - 1
					ConsoleWriteDedug("Downloading http://images.4chan.org/" & $section & "/src/" & $array2[$d] & '.' & $section)
					InetGet("http://images.4chan.org/" & $section & "/src/" & $array2[$d] & "." & $section, @ScriptDir & "\Download\" & $array2[$d] & "." & $section, 0, 1)
				Next
			Else
				ExitScript(" - HTTPread failed")
			EndIf
		Next
	Else
		ExitScript(" - HTTPread failed")
	EndIf
Next

Func ConsoleWriteDedug($string)
	ConsoleWrite("[" & @Hour & ":" & @Min & ":" & @Sec & "] " & $string & @CRLF)
EndFunc

Func ExitScript($string = "")
	ConsoleWriteDedug("Script ended" & $string)
	Exit
EndFunc