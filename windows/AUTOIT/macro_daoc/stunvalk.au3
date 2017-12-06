#RequireAdmin				;forza lo script a "girare bene" sotto vista

If Not IsAdmin() Then MsgBox(0, "Info", "Non hai diritti di admin!")

Global Const $trigger = 'u'			;tasto start/stop
Global Const $style1  = '{f7}'		;tasto stile1
Global Const $style2  = '{f8}'		;tasto stile2
Global Const $putback = 'h'			;tasto riponi arma
Global Const $deelay1 =  5			;millisecondi tra uno stile e l'altro
Global Const $deelay2 =  500		;millisecondi tra un ciclo e l'altro
Global $flag 		  =  False		;variabile globale di triggering

HotKeySet($trigger, 'trigger')

While True
	If $flag Then
		#cs - comment start
		If $flag Then
			Send($style2)
			ConsoleWrite("stile2" & @CRLF)
			Sleep($deelay1)
		EndIf
		If $flag Then
			Send($style2)
			ConsoleWrite("stile2" & @CRLF)
			Sleep($deelay1)
		EndIf
		#ce - comment end
		If $flag Then
			Send($style2)
;~ 			ConsoleWrite("stile2" & @CRLF)
			Sleep($deelay1)
		EndIf
		If $flag Then
			Send($style1)
;~ 			ConsoleWrite("stile1" & @CRLF)
			Sleep($deelay2)
		EndIf
	EndIf
WEnd

Func trigger()
	$flag = Not $flag
	If Not $flag Then
		Send($putback)
;~ 		ConsoleWrite("ritiro arma" & @CRLF)
	EndIf
EndFunc