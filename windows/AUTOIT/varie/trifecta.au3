#region - variables
	Dim $text[6]			= ['Midgard', 'Draco''Dun Bolg', 'Reveal the first card', 'Reveal the second card', 'Reveal the final card']
	Global $windowTitle		= 'Dark Age of Camelot © 2001-2011 Electronic Arts Inc. All Rights Reserved.'
	Dim $trifecta[2]		= [644,  527]
	Dim $token[2]			= [23 ,  55 ]
	Dim $buyButton[2]		= [44 ,  666]
	Dim $inv_bag_0[2]		= [1271, 315]
	Dim $inv_bag_1[2]		= [1271, 343]
	Dim $inv_bag_2[2]		= [1271, 368]
	Dim $inv_bag_3[2]		= [1271, 393]
	Dim $inv_bag_4[2]		= [1271, 419]
	Dim $inv_slot_0[2]		= [1112, 308]
	Dim $inv_slot_1[2]		= [1112, 323]
	Dim $inv_slot_2[2]		= [1112, 341]
	Dim $inv_slot_3[2]		= [1112, 358]
	Dim $inv_slot_4[2]		= [1112, 376]
	Dim $inv_slot_5[2]		= [1112, 392]
	Dim $inv_slot_6[2]		= [1112, 410]
	Dim $inv_slot_7[2]		= [1112, 427]
;~ 	Dim $invetory_loc[4]	= [1109, 308, 1272, 431]
	Global $bag				= 0
	Global $slot			= 0
	Global $delay			= 750
	Dim	   $colors			= fotografaInventario()
#EndRegion

;~ Exit

HotKeySet("q", "exitnow")
;~ HotKeySet("s", "fai")

WinActivate($windowTitle)
WinWaitActive($windowTitle)

;~ While 1
;~ 	Sleep(1000)
;~ WEnd

For $c = 0 To 10
	fai()
Next

Func exitnow()
	Exit
EndFunc

Func fai()
	compra()
	selezionaUltimoSlot()
	consegna()
	parla()
EndFunc

Func parla()
	For $c = 0 To 5
		Sleep($delay)
;~ 		Send()
;~ 		Sleep(50)
		Send("{enter}" & "/s " & $text[$c] & "{enter}")
;~ 		Send()
	Next
EndFunc

Func consegna()
	$array = coordinateBiglietto()
	Sleep($delay)
	MouseClick('left', $array[0], $array[1], 1, 0)
	Sleep($delay)
	MouseClick('left', $array[2], $array[3], 1 ,0)
	Sleep($delay)
	MouseClick('left', $trifecta[0], $trifecta[1], 1, 0)
	Sleep($delay)
EndFunc

Func coordinateBiglietto()
	Dim $array[4] = [0, 0, 0, 0]
	Switch $bag
		Case 0
			$array[0] = $inv_bag_0[0]
			$array[1] = $inv_bag_0[1]
		Case 1
			$array[0] = $inv_bag_1[0]
			$array[1] = $inv_bag_1[1]
		Case 2
			$array[0] = $inv_bag_2[0]
			$array[1] = $inv_bag_2[1]
		Case 3
			$array[0] = $inv_bag_3[0]
			$array[1] = $inv_bag_3[1]
		Case 4
			$array[0] = $inv_bag_4[0]
			$array[1] = $inv_bag_4[1]
	EndSwitch
	Switch $slot
		case 0
			$array[2] = $inv_slot_0[0]
			$array[3] = $inv_slot_0[1]
		case 1
			$array[2] = $inv_slot_1[0]
			$array[3] = $inv_slot_1[1]
		case 2
			$array[2] = $inv_slot_2[0]
			$array[3] = $inv_slot_2[1]
		case 3
			$array[2] = $inv_slot_3[0]
			$array[3] = $inv_slot_3[1]
		case 4
			$array[2] = $inv_slot_4[0]
			$array[3] = $inv_slot_4[1]
		case 5
			$array[2] = $inv_slot_5[0]
			$array[3] = $inv_slot_5[1]
		case 6
			$array[2] = $inv_slot_6[0]
			$array[3] = $inv_slot_6[1]
		case 7
			$array[2] = $inv_slot_7[0]
			$array[3] = $inv_slot_7[1]
	EndSwitch
	Return $array
EndFunc

Func compra()
	Sleep($delay)
	MouseClick('right', $trifecta[0], $trifecta[1], 1, 0)
	Sleep($delay)
	MouseClick('left', $token[0], $token[1], 1, 0)
	Sleep($delay)
	MouseClick('left', $buyButton[0], $buyButton[1], 1, 0)
	Sleep($delay)
EndFunc

Func selezionaUltimoSlot()

;~ 	$slot = 0
;~ 	$bag = 0
;~ 	Return

	Sleep($delay)
	Dim $prima = $colors
	Dim $dopo = fotografaInventario()
	Local $flag = False
	For $c = 0 to 7
		If Abs($prima[$c] - $dopo[$c]) > 10 Then
			$slot = $c
			$flag = True
			ExitLoop
		EndIf
	Next
	If $flag == False Then
		$bag += 1
		$slot = 0
	EndIf
EndFunc

Func fotografaInventario()
	Dim $colors[8]
	$colors[0] = PixelGetColor($inv_slot_0[0], $inv_slot_0[1])
	$colors[1] = PixelGetColor($inv_slot_1[0], $inv_slot_1[1])
	$colors[2] = PixelGetColor($inv_slot_2[0], $inv_slot_2[1])
	$colors[3] = PixelGetColor($inv_slot_3[0], $inv_slot_3[1])
	$colors[4] = PixelGetColor($inv_slot_4[0], $inv_slot_4[1])
	$colors[5] = PixelGetColor($inv_slot_5[0], $inv_slot_5[1])
	$colors[6] = PixelGetColor($inv_slot_6[0], $inv_slot_6[1])
	$colors[7] = PixelGetColor($inv_slot_7[0], $inv_slot_7[1])
	Return $colors
EndFunc
