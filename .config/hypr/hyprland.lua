-- MODIFIED CachyOS Hyprland Configuration

-- Add symlinked path
package.path = package.path
.. ';' .. os.getenv('HOME') .. '/.files/.config/hypr/?.lua'
.. ';' .. os.getenv('HOME') .. '/.files/.config/hypr/?/init.lua'

require("config.animations")
require("config.autostart")
require("config.colors")
require("config.decorations")
require("config.variables")
require("config.environment")
require("config.inputs")
require("config.binds")
require("config.misc")
require("config.monitors")
require("config.windowrules")
require("config.workspaces")
