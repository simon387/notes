Func _SetGamma ( $vRed=128, $vGreen=128, $vBlue=128 )
    Local $n_ramp, $rVar, $gVar, $bVar, $Ret, $i, $dc
    If $vRed < 0 Or $vRed > 386 Then Return -1
    If $vGreen < 0 Or $vGreen > 386 Then Return -1
    If $vBlue < 0 Or $vBlue > 386 Then Return -1
    $dc = DLLCall ( "user32.dll", "int", "GetDC","hwnd", 0 )
    $n_ramp = DllStructCreate ( "short[" & ( 256*3 ) & "]" )
    For $i = 0 to 256
    $rVar = $i * ( $vRed + 128 )
    If $rVar > 65535 Then $rVar = 65535
    $gVar = $i * ( $vGreen + 128 )
    If $gVar > 65535 Then $gVar = 65535
    $bVar = $i * ( $vBlue + 128 )
    If $bVar > 65535 Then $bVar = 65535
    DllStructSetData ( $n_ramp, 1, Int ( $rVar ), $i  ) ; red
    DllStructSetData ( $n_ramp, 1, Int ( $gVar ), $i+256 ) ; green
    DllStructSetData ( $n_ramp, 1, Int ( $bVar ), $i+512 ) ; blue
    Next
    $ret = DLLCall ( "gdi32.dll", "int", "SetDeviceGammaRamp", "int", $dc[0], "ptr", DllStructGetPtr ( $n_Ramp ) )
    $dc = 0
    $n_Ramp = 0
EndFunc ;==> _SetGamma ( )


$var = 385

_SetGamma($var, $var, $var)