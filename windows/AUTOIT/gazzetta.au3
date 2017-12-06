#include <IRC_old.au3>

HotKeySet("{esc}","esc")
Global Const $server = "antonella.boing-irc.it"
Global Const $port = 6667
Global Const $nick = "uykki"
Global Const $channel = "#BOiNG"
;~ Global Const $channel = "#FUSION"

;~ While 1
;~ 	ConsoleWrite(generaSaluto()&@CRLF)
;~ 	Sleep(333)
;~ WEnd

;main
TCPStartup()
Global Const $sock = _IRCConnect($server, $port, $nick); Connects to IRC and Identifies its Nickname

While 1
	Local $recv = TCPRecv($sock, 8192);8192); Recieve things from server
	ConsoleWrite($recv)
	If @error Then Exit MsgBox(1, "IRC Example", "Server has errored or disconnected"); If you can't recieve then the server must have died.
	Local $sData = StringSplit($recv, @CRLF); Splits the messages, sometimes the server groups them
	For $i = 1 To $sData[0] Step 1; Does each message seperately
		Local $sTemp = StringSplit($sData[$i], " "); Splits the message by spaces
		If $sTemp[1] = "" Then ContinueLoop; If its empty, Continue!
		If $sTemp[1] = "PING" Then _IRCPing($sTemp[2]); Checks for PING replys (There smaller then usual messages so its special!
		If $sTemp[0] <= 2 Then ContinueLoop; Useless messages for the most part
		Switch $sTemp[2]; Splits the command msg
			Case "266"; It's what I use as an indictator to show when its done sending you info.
				p(_IRCJoinChannel($sock, $channel))
				p(_IRCSendMessage($sock, generaSaluto(), $channel))
				p(_IRCChangeMode ($sock, "+i", $nick))

;~ 				p(_IRCSendMessage($sock, "/msg FuSiOn|EdIcOlA|Quotidiani xdcc send #9"))
				p(_IRCSendMessage($sock, "/ctcp BNG|GIORNALI|001 xdcc send #18"))
				#cs
					aggiungere il codice per la richiesta del download qui

					uscire

					gestire naming
					trasferire su dropbox
				#ce
		EndSwitch
	Next
WEnd

Func p($string = "")
	ConsoleWrite($string & @CRLF)
EndFunc

Func esc()
	If MsgBox(1, "hack", "ok per quittare") = 1 Then Exit
EndFunc

Func generaSaluto()
	Local $array[24] = ["Ciao!", "Ciao a tutti", "ciao a tutti xD", "Ciao a tutti..", "ciao a tutti..", _
	"Ciao a Tutti ;)", "salve", "Salve", "salve..", "Salve..", "ciao ^^", "ciao ^_^", "CiAo a TuTTi ^^", _
	"ciao a tt", "ciao a tutti", "salve a tutti ^^", "ciau ^^", "ciau ^-^", "ciau xD", "Ciau :D", "Ciao :D", _
	"Ciao a tutti :D", "Ciao a tutti xD", "ciao a tutto il canale"]
	Return $array[Random(0, 23, 1)]
EndFunc