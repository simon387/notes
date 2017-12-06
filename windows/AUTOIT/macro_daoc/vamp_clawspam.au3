#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Simone Celia

 Script Function:
	Macro per vamp claw spam

#ce ----------------------------------------------------------------------------

Global Const $trigger = 'y'			;tasto start/stop
Global Const $anytime =	'{f8}'		;tasto stile anytime
Global Const $back    = '{f7}'		;tasto stile di back
Global Const $claw    = '{f9}'		;tasto della claw
Global Const $putback = 'h'			;tasto riponi arma
Global Const $deelay1 =  5			;millisecondi tra uno stile e l'altro
Global Const $deelay2 =  500		;millisecondi tra un ciclo e l'altro
Global $flag 		  =  False		;variabile globale di triggering

HotKeySet($trigger, 'trigger')

While True
	If $flag Then
		If $flag Then
			Send($claw)
			Sleep($deelay1)
		EndIf
		If $flag Then
			Send($back)
			Sleep($deelay1)
		EndIf
		If $flag Then
			Send($anytime)
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