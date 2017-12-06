HotKeySet("{esc}", "quit")

Global Const $title 	= "Dark Age of Camelot © 2001"
Global Const $deelayc	= 150 * 1000	;146
Global Const $deelay	= 1000
Global Const $xs 		= 1745
Global Const $ys		= 284
Global Const $steps		= 18
Global Const $yb		= 548
Global Const $xp		= 1908
Global Const $yp		= 299
Global Const $stepp		= 22

WinActivate($title)
WinWaitActive($title)

For $ip = 0 To $stepp * 4 Step $stepp
	For $is = 0 To $steps * 7 Step $steps
		MouseClick("left", $xp, $yp + $ip, 1, 0)
		Sleep($deelay)
		MouseClick("right", $xs, $ys + $is, 1, 0)
		Sleep($deelay)
		MouseClick("left", $xs, $yb, 1, 0)
		Sleep($deelayc)
	Next
Next

Shutdown(13);non testato, attenzione

Func quit()
	Exit
EndFunc