-- Author: simon387@hotmail.it
sFID = "" sCHID = "" sName = "" sPath = string.gsub(ts3.getAppPath(), "\/", "\\") .. "plugins\\lua_plugin\\BuffBot\\"

function onTextMessageEvent(serverConnectionHandlerID, targetMode, toID, fromID, fromName, fromUniqueIdentifier, message, ffIgnored)
	sCHID = serverConnectionHandlerID sFID = fromID
	if targetMode ~= 1 then return 0 end
		if string.sub(message, 0, 9)	== "allbuffs "		then buff(string.sub(message, 10), 0)
	elseif string.sub(message, 0, 10)	== "tankbuffs "		then buff(string.sub(message, 11), 1)
	elseif string.sub(message, 0, 12)	== "casterbuffs "	then buff(string.sub(message, 13), 2)
	elseif string.sub(message, 0, 10)	== "specstank "		then buff(string.sub(message, 11), 3)
	elseif string.sub(message, 0, 12)	== "specscaster "	then buff(string.sub(message, 13), 4)
	elseif string.sub(message, 0, 7)	== "acuity "		then buff(string.sub(message, 8), 5)
	elseif string.sub(message, 0, 7)	== "strcon "		then buff(string.sub(message, 8), 6)
	elseif string.sub(message, 0, 7)	== "dexqui "		then buff(string.sub(message, 8), 7)
	elseif string.sub(message, 0, 7)	== "specaf "		then buff(string.sub(message, 8), 8)
	elseif string.sub(message, 0, 8)	== "basedex "		then buff(string.sub(message, 9), 9)
	elseif string.sub(message, 0, 8)	== "basestr "		then buff(string.sub(message, 9), 10)
	elseif string.sub(message, 0, 8)	== "basecon "		then buff(string.sub(message, 9), 11)
	elseif string.sub(message, 0, 6)	== "haste "			then buff(string.sub(message, 7), 12)
	elseif string.sub(message, 0, 7)	== "curers "		then buff(string.sub(message, 8), 13)
	elseif string.sub(message, 0, 8)	== "buffpet "		then buff(string.sub(message, 9), 14)
	elseif string.sub(message, 0, 10)	== "fullbuffs "		then buff(string.sub(message, 11), 15)
	elseif message == "shutdown" or message == "qtd" or message == "reset" then io.popen('"' .. sPath .. message .. '.au3"')
	elseif ts3.getClientSelfVariableAsString(sCHID, 0) ~= fromUniqueIdentifier then ts3.requestSendPrivateTextMsg(sCHID, "Lolwhat?", sFID)
	end
	return 0
end

function buff(sString, nNumber)
	fileHandle = io.open(sPath .. "busy.txt", "r")
	fileHandle:read()
	if tonumber(string.sub(fileHandle:read(), 3)) == 1 then
		ts3.requestSendPrivateTextMsg(sCHID, "Can't atm, I am buffing " .. sName .. "! retry later", sFID)
	else
		io.popen('"' .. sPath .. 'buffs.au3" ' .. sString .. ' ' .. nNumber)
		ts3.requestSendPrivateTextMsg(sCHID, "Ok, master", sFID)
		sName = sString
	end
	fileHandle:close()
end

testmodule_events = {onTextmsgEvent = onTextmsgEvent}