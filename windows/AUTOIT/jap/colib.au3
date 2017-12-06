#include <SQLite.au3>
#include <SQLite.dll.au3>

Global Const $path = _SQLite_Startup()
Global $aRow, $hQuery, $dbH = _SQLite_Open("jap.db")

Func fetc()
	Return _SQLite_FetchData($hQuery, $aRow)
EndFunc

Func quer($string)
	_SQLite_Query($dbH, $string, $hQuery)
EndFunc

Func exec($string)
   _SQLite_Exec($dbH, $string)
EndFunc

Func drop()
   _SQLite_Close($dbH)
   _SQLite_Shutdown()
EndFunc