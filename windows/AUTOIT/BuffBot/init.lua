--
-- Testmodule initialisation, this script is called via autoload mechanism when the
-- TeamSpeak 3 client starts.
--

require("ts3init")            -- Required for ts3RegisterModule
require("BuffBot/events")  -- Forwarded TeamSpeak 3 callbacks
--require("TauntBot/demo")    -- Some demo functions callable from TS3 client chat input

-- Define which callbacks you want to receive in your module. Callbacks not mentioned
-- here will not be called. To avoid function name collisions, your callbacks should
-- be put into an own package.
local registeredEvents = {
--	onConnectStatusChangeEvent = testmodule_events.onConnectStatusChangeEvent,
--	onNewChannelEvent = testmodule_events.onNewChannelEvent,
--	onTalkStatusChangeEvent = testmodule_events.onTalkStatusChangeEvent,
	onTextMessageEvent = testmodule_events.onTextMessageEvent
}

-- Register your callback functions with a unique module name.
ts3RegisterModule("BuffBot", registeredEvents)