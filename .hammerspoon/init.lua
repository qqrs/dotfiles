hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

hs.loadSpoon("Cherry")
spoon.Cherry:bindHotkeys({start = {{"cmd", "alt"}, "P"}})

hs.loadSpoon("Chimer")

-- Launch new iTerm window on current desktop
hs.hotkey.bind({"cmd", "alt"}, "T", function()
	if hs.application.find("iTerm") then
		hs.applescript.applescript([[
			tell application "iTerm"
				create window with default profile
			end tell
		]])
	else
		hs.application.open("iTerm")
	end
end)


-- Launch Google Chrome
hs.hotkey.bind({"cmd", "alt"}, "E", function()
	if hs.application.find("Google Chrome") then
		hs.applescript.applescript([[
			tell application "Google Chrome"
				make new window
			end tell
		]])
	else
		hs.application.open("Google Chrome")
	end
end)


-- Launch Finder
hs.hotkey.bind({"cmd", "alt"}, "F", function()
	if hs.application.find("Finder") then
		hs.applescript.applescript([[
			tell application "Finder"
				make new Finder window
				activate
			end tell
		]])
	else
		hs.application.open("Finder")
	end
end)


-- Launch or focus KeepassXC
hs.hotkey.bind({"cmd", "alt"}, "K", function()
	hs.application.launchOrFocus("KeepassXC")
end)
