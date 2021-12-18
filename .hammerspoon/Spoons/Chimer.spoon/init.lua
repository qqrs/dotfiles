--- === Chimer ===
---
--- Chimer -- a 15 minute mindfulness chime for the menubar
--- (based on the Cherry spoon)
---
--- Download: TODO
---

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Chimer"
obj.version = "0.1"
obj.author = "TODO"
obj.license = "MIT"
obj.homepage = "TODO"

-- Settings

-- chime interval in minutes
obj.duration = 15

-- set this to true to always show the menubar item
obj.alwaysShow = true

-- duration in seconds for alert to stay on screen
-- set to 0 to turn off alert completely
obj.alertDuration = 2

-- Font size for alert
obj.alertTextSize = 27

-- set to nil to turn off notification when time's up or provide a hs.notify notification
obj.notification = nil
-- obj.notification = hs.notify.new({ title = "Done! 🍒", withdrawAfter = 0})

-- set to nil to turn off notification sound when time's up or provide a hs.sound
obj.sound = nil
-- obj.sound = hs.sound.getByFile("System/Library/PrivateFrameworks/ScreenReader.framework/Versions/A/Resources/Sounds")


function obj:init()
  self.menu = hs.menubar.new(self.alwaysShow)
  self:reset()
  self:start()
end


function obj:reset()
  local items = {
    { title = "Start", fn = function() self:start() end }
  }
  self.menu:setMenu(items)
  self.menu:setTitle("🔔")
  if not self.alwaysShow then
      self.menu:removeFromMenuBar()
  end
  if self.timer then
      self.timer:stop()
      self.timer = nil
  end
end


--- Chimer:chime()
--- Method
--- Popup an alert or notification when time is up.
---
--- Parameters:
---  * None
---
--- Returns:
---  * None
function obj:chime()
  hs.alert.show("Chime 🔔", { textSize = self.alertTextSize }, self.alertDuration)
  if self.notification then
    self.notification:send()
  end
  if self.sound then
    self.sound:play()
  end
end


--- Chimer:start()
--- Method
--- Starts the timer
---
--- Returns:
---  * None
function obj:start()
  self.timer = hs.timer.doAt(0, self.duration * 60, function() self:chime() end)
  local items = {
    { title = "Stop",  fn = function() self:reset() end }
  }
  self.menu:setMenu(items)
end


return obj
