#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Simone Celia

 Script Function:
	Macro per vamp per peelare

#ce ----------------------------------------------------------------------------

Global Const $trigger = 'u'			;tasto start/stop
;Global Const $anytime =	'{f8}'		;tasto stile anytime
Global Const $back    = '{f7}'		;tasto stile di back
Global Const $side    = '{f10}'		;tasto stile di side
Global Const $putback = 'h'			;tasto riponi arma
Global Const $deelay1 =  5			;millisecondi tra uno stile e l'altro
Global Const $deelay2 =  500		;millisecondi tra un ciclo e l'altro
Global $flag 		  =  False		;variabile globale di triggering

HotKeySet($trigger, 'trigger')

While True
	If $flag Then
		If $flag Then
			Send($back)
			Sleep($deelay1)
		EndIf
		If $flag Then
			Send($side)
			Sleep($deelay2)
		EndIf
	EndIf
WEnd

Func trigger()
	$flag = Not $flag
	If Not $flag Then
		Send($putback)
	EndIf
EndFunc