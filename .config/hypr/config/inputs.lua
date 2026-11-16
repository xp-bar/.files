-- Input configuration

hl.config({
    input = {
        -- accel_profile = "flat",
        accel_profile = "adaptive",
        sensitivity = 0.3,
        repeat_delay = 240,
        repeat_rate = 40,

        touchpad = {
            disable_while_typing = true,
            natural_scroll = true,
            middle_button_emulation = true,
            -- this one is nice - now I'm not randomly moving the cursor while typing anymore
            tap_to_click = false,
        },
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    -- cursor = {
    --     no_hardware_cursors = 1,
    -- },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
-- hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })
