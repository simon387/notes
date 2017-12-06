#include <IE.au3>
#include "WinHttp.au3"

;~ Global $MD5 = HttpPost('ht 
;~ MsgBox(64, "MD5", $MD5)

;~ Exit

Global Const $sUser = " "
Global Const $sPass = " "
Global Const $sAddress = ' /'
Global Const $sQs = ""

$Header = "Content-Type: application/x-www-form-urlencoded"
;~ $Host = "brihar7.freehostia.com"
;~ $File = "/register.php"
$URL = ' /'
;~ $URL = "https://cp.tophost.it/dnsjump.php"
$PostData = " "


$o_IE = _IECreate ("about:blank",0,1)
$o_IE.navigate($URL, 0, 0, $PostData ,$Header)



;~ username
;~ password