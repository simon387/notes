While ProcessExists("game.dll") + ProcessExists("login.dll") <> 0
	ProcessClose("game.dll")
	ProcessClose("login.dll")
WEnd