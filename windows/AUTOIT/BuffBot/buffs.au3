#include <libs.au3>

If $cmdLine[0] <> 2 Then Exit 0

TLred()

setupBuffCall($cmdLine[1])

Switch $cmdLine[2]
	Case 0 ; allbuffs
		buff(1);acume
		buff(2);strcon
		buff(3);dq
		buff(4);str
		buff(5);con
		buff(6);dex
		buff(7);specAF
		buff(8);haste
	Case 1 ; tankbuffs
		buff(2);strcon
		buff(3);dq
		buff(4);str
		buff(5);con
		buff(6);dex
		buff(7);specAF
		buff(8);haste
	Case 2 ; casterbuffs
		buff(1);acume
		buff(2);strcon
		buff(3);dq
		buff(5);con
		buff(6);dex
		buff(7);specAF
	Case 3 ; specstank
		buff(2);strcon
		buff(3);dq
		buff(7);specAF
		buff(8);haste
	Case 4 ; specscaster
		buff(1);acume
		buff(2);strcon
		buff(3);dq
		buff(7);specAF
	Case 5 ; acuity
		buff(1);acume
	Case 6 ; strcon
		buff(2);strcon
	Case 7 ; dexqui
		buff(3);dq
	Case 8 ; specaf
		buff(7);specAF
	Case 9 ; basedex
		buff(6);dex
	Case 10 ; basestr
		buff(4);str
	Case 11 ; basecon
		buff(5);con
	Case 12 ; haste
		buff(8);haste
	Case 13 ; curers
		buff(9);rs
		Sleep(8000)
	Case 14 ; buffpet
		Send('{ENTER}/assist{ENTER}')
		buff(2);strcon
		buff(3);dq
		buff(4);str
		buff(5);con
		buff(6);dex
	Case 15 ; fullbuffs
		buff(1);acume
		buff(2);strcon
		buff(3);dq
		buff(4);str
		buff(5);con
		buff(6);dex
		buff(7);specAF
		buff(8);haste
		buff(0);af
EndSwitch
Sleep(500)

TLgreen()