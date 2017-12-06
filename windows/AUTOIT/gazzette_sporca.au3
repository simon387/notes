Global Const $webAddress = "http://www.boing-irc.it/bng/"

ShellExecuteWait($webAddress)
Sleep(5000)
Send("{tab}")
Sleep(400)
Send("la gazzetta dello sport")
Sleep(400)
Send("{enter}")
Sleep(5000)
For $i = 1 To 6
	Send("{tab}")
	Sleep(333)
Next
Sleep(400)
Send("{enter}")