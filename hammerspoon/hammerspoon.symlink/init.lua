-- Main Configuration
hs.window.animationDuration = 0         -- Do not animate window movements
hs.mainModifierKeys = {"ctrl", "cmd"}   -- Variable that holds the main modifier keys !!IMPORTANT!!

-- Load custom Modules
require('modules/windows')
require('modules/caffeine/caffeine')

-- Reload function
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
