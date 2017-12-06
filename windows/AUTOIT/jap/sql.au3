#include <colib.au3>
Global $sMsg

;~ exec("DROP TABLE italian;")
exec("CREATE TABLE IF NOT EXISTS italian(id INTEGER PRIMARY KEY, string TEXT, meaning TEXT);")

exec("INSERT INTO italian(string) VALUES ('gatto');")
exec("INSERT INTO italian(string) VALUES ('gatto');")
exec("INSERT INTO italian(string) VALUES ('gatto');")

quer("SELECT * FROM italian;")
While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
	$sMsg &= $aRow[0] & $aRow[1]
WEnd
MsgBox(0, "SQLite", $sMsg)

drop()

