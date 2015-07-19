-- Main Configuration
hs.window.animationDuration = 0         -- Do not animate window movements
hs.mainModifierKeys = {"alt", "cmd"}   -- Variable that holds the main modifier keys !!IMPORTANT!!

-- Load Extensions
local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local keycodes = require "hs.keycodes"
local fnutils = require "hs.fnutils"
local alert = require "hs.alert"
local screen = require "hs.screen"
local grid = require "hs.grid"
local hints = require "hs.hints"
local appfinder = require "hs.appfinder"

-- Load custom Modules
require('modules/windows')
require('modules/shortcuts')
-- require('modules/caffeine/caffeine')

-- Hotkey Hints
hotkey.bind(hs.mainModifierKeys,"s",hints.windowHints)

-- URL Example
-- This alert can be triggered by opening following url: `open -g hammerspoon://someAlert`
hs.urlevent.bind("someAlert", function(eventName, params)
    hs.alert.show("Received someAlert")
end)

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
