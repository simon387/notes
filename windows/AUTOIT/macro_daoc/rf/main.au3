#include <array.au3>
#include <ScreenCapture.au3>
;testare di salvare anche le pos delle finestre
#cs
***************************************************************************************************
* Selezionare la finestra dell'sb prima di far partire questo script                              *
***************************************************************************************************
* Mettere la finestra dell'accept ress in alto al massimo a sinistra, 111px 111px                 *
* è la distanza relativa del pulsante accept dall'origine                                         *
***************************************************************************************************
* cleric: 1) pbaoe   | 2) stand | 3) sit | 4) ress | 5) target1 | 6) target2 | 7) attack |0) face *
* sb    : 1) anytime | 0) face  |                                                                 *
***************************************************************************************************
#ce
HotKeySet("{esc}", "quit")

Global Const $actionDeelay = 500
Global Const $sb           = "0"
Global Const $cleric1      = "1"
Global Const $cleric2      = "2"
Global Const $cleric3      = "3"
Global Const $lastAttacker = "^{F10}"
Global Const $face         = "0"
Global Const $anytime      = "1"
Global Const $riponi       = "n"
Global Const $avanti       = "{w down}"
Global Const $stop         = "{w up}"
Global Const $ress         = "4"
Global Const $target1      = "5"
Global Const $target2      = "6"
Global Const $faceloc      = "7" ; 100.000 50.000083
Global Const $loot         = "^{h}"
Global Const $offset       = 111
Global Const $offsetArma[2] = [643, 275]
Global Const $nearest      = "{tab}"
Global Const $attack       = "8"
Global Const $rhand        = "i"
Global Const $2hand        = "p"
Global Const $salto        = "{space}"
global Const $sprint       = "v"
Global Const $title        = "Dark Age of Camelot © 2001-2012 Electronic Arts Inc. All Rights Reserved."
Global $tempA[4]
Global $array[4][3]
;             ^  0 : handle useless
;             |  1 : coo x  + $offset
;             |  2 : coo yy + $offset
;			  accounts number, 0 = sb, other = cleric


;resetter
WinSetTitle ("0", "", $title)
WinSetTitle ("1", "", $title)
WinSetTitle ("2", "", $title)
WinSetTitle ("3", "", $title);/resetter

Sleep(3000)
;setta i nomi delle finestre e ne cattura le posizioni
For $i = 0 To (UBound($array) - 1)
;~ 	Sleep(1000)
	$array[$i][0] = WinGetHandle($title)
	$tempA = WinGetPos($title)
	If IsArray($tempA) Then
	   $array[$i][1] = $tempA[0] + $offset
	   $array[$i][2] = $tempA[1] + $offset
	EndIf
;~ 	WinActivate($title)
;~ 	MouseMove($array[$i][1], $array[$i][2], 0)
	WinSetTitle ($title, "", $i)
Next

;~ _ArrayDisplay($array)

Global $contatore = 1
While True
	For $i = 1 To 8 Step 1
		ToolTip("[" & $contatore & "]giro: " & $i & "/" & 8, 1000, 500)
		faiTutto()
;~ 		FileDelete("C:\Users\Simone\Dropbox\Public\farm.jpg")
;~ 		Sleep(500)
;~ 	 	_ScreenCapture_Capture("C:\Users\Simone\Dropbox\Public\farm.jpg")
		$contatore = $contatore + 1
		sleepSickness()
	Next
;~ 	sleepAntiBan()
WEnd

Func sleepAntiBan()
	Local $c = 0
	Local $m = 45 * 60 ; secondi
	While True
		ToolTip("[antiban] secondi passati: " & $c & "/" & $m, 1000, 500)
		Sleep(1000)
		$c = $c + 1
		If $c = $m Then ExitLoop
	WEnd
	ToolTip("")
EndFunc

Func sleepSickness()
	Local $c = 0
	Local $m = 200 + (20 * 60);20minuti
	While True
		ToolTip("[sickness] secondi passati: " & $c & "/" & $m, 1000, 500)
		Sleep(1000)
		$c = $c + 1
		If $c = $m Then ExitLoop
	WEnd
	ToolTip("")
EndFunc

Func faiTutto()
	fai(1, 2)
	fai(2, 3)
	fai(3, 1)
	giroDiRessDiSicurezza()
;~ 	antiWeaponBugSystem()
	nonFareCrashareHealer()
;~ 	nonFareCrashareBot()
EndFunc

Func antiWeaponBugSystem()
	selezionaCleric($cleric1)
	selezionaCleric($cleric2)
	selezionaCleric($cleric3)
	MouseClick("left", $array[1][1] - $offset + $offsetArma[0], $array[1][2] - $offset + $offsetArma[1], 2, 0)
	Sleep(499)
	MouseClick("left", $array[2][1] - $offset + $offsetArma[0], $array[2][2] - $offset + $offsetArma[1], 2, 0)
	Sleep(499)
	MouseClick("left", $array[3][1] - $offset + $offsetArma[0], $array[3][2] - $offset + $offsetArma[1], 2, 0)
	Sleep(499)
EndFunc

Func giroDiRessDiSicurezza()
	selezionaCleric($cleric1)
	ressa()
	accettaRess()
	selezionaCleric($cleric2)
	ressa()
	accettaRess()
	selezionaCleric($cleric3)
	ressa()
	accettaRess()
EndFunc

Func salta()
	daocsend($salto, 10)
EndFunc

Func switchRhand()
	daocsend($rhand, 200, 1000)
EndFunc

Func switch2hand()
	daocsend($2hand, 200, 1000)
EndFunc

Func fai($cleric, $nextCleric)
	selezionaCleric($cleric)
	attaccaSB()
	selezionaSB()
	attaccaCleric()
	selezionaCleric($cleric)
	buttati()
	selezionaCleric($nextCleric)
	ressa()
;~ 	If $cleric == 1 Then $nextCleric = 2
;~ 	If $cleric == 2 Then $nextCleric = 1
;~ 	If $cleric == 3 Then $nextCleric = 1
;~
	selezionaCleric($cleric)
	accettaRess($cleric)
EndFunc

Func nonFareCrashareHealer()
	selezionaFinestra("healer")
	daocSend(1, 0, $actionDeelay)
	selezionaSB()
EndFunc

Func nonFareCrashareBot()
	selezionaFinestra("bot")
	daocSend(1, 0, $actionDeelay)
	selezionaSB()
EndFunc

Func accettaRess($n = 1)
	Sleep(6000)
;~ 	MouseClick("left", $array[$n][1], $array[$n][2], 1, 0)
	MouseClick("left", $array[1][1], $array[1][2], 1, 0)
	Sleep(499)
	MouseClick("left", $array[2][1], $array[2][2], 1, 0)
	Sleep(499)
	MouseClick("left", $array[3][1], $array[3][2], 1, 0)
	Sleep(499)
EndFunc

Func facelocca()
	daocSend($faceloc)
EndFunc

Func ressa()
	alzati()
	daocSend($target1)
	face()
	salta()
	daocSend($ress, 0, 0)
	daocSend($target2)
	face()
	salta()
	daocSend($ress, 0, 0)
EndFunc

Func attaccaSB()
	alzati()
	nearestEnemy()
;~ 	pbaoe()
	face()
	attacca()
	siediti()
EndFunc

Func attacca()
	daocsend($attack)
EndFunc

Func buttati()
	facelocca()
	daocSend($avanti)
	daocSend($stop, 2000)
EndFunc

Func nearestEnemy()
	daocsend($nearest)
EndFunc

Func attaccaCleric()
;	Sleep($actionDeelay)
	getLastAttacker()
	face()
;~ 	switchRhand()
;~ 	switch2hand()
	swinga()
	riponiArma()
	perdiTarget()
EndFunc

Func perdiTarget()
	daocSend($loot)
EndFunc

Func riponiArma()
	daocsend($riponi, $actionDeelay * 2)
EndFunc

Func swinga()
	daocSend($anytime)
EndFunc

Func siediti()
	daocSend("3")
EndFunc

Func alzati()
	daocSend("2")
EndFunc

Func quit()
	Exit
EndFunc

Func getLastAttacker()
	daocSend($lastAttacker)
EndFunc

Func pbaoe()
	daocSend("1")
EndFunc

Func selezionaSB()
	Sleep($actionDeelay)
	selezionaFinestra($sb)
EndFunc

Func selezionaCleric($numero)
	Sleep($actionDeelay)
	If $numero == 1 Then selezionaFinestra("1")
	If $numero == 2 Then selezionaFinestra("2")
	If $numero == 3 Then selezionaFinestra("3")
	If $numero == 4 Then selezionaFinestra("4")
EndFunc

Func selezionaFinestra($name)
   WinActivate($name)
   WinWaitActive($name)
EndFunc

Func face()
   daocSend($face)
 EndFunc

Func daocSend($string = "", $preDeelay = $actionDeelay, $postDeelay = 0)
   If $preDeelay == "" Or $preDeelay == 0 Then $preDeelay = $actionDeelay
   Sleep($preDeelay)
   If $string    <> "" Then Send($string)
   If $postDeelay <> 0  Then Sleep($postDeelay)
EndFunc
