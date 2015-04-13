local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setIcon("modules/caffeine/icons/active.png")
    else
        caffeine:setIcon("modules/caffeine/icons/inactive.png")
    end
end

-- Only sleep on battery power
function batt_power_source()
  if hs.battery.powerSource() == "AC Power" then
    hs.caffeinate.set("displayIdle", true, false)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
  end
  if hs.battery.powerSource() == "Battery Power" then
    hs.caffeinate.set("displayIdle", false, false)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
  end
end

-- Run the battery watcher
hs.battery.watcher.new(batt_power_source):start()
