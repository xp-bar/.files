-- Look and feel configuration

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { XP_PURPLE, XP_CYAN, XP_PURPLE, XP_CYAN, XP_PURPLE },
                angle = 45,
            },
            inactive_border = XP_CHARCOAL_2,
        },
    },
    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = XP_RED,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 0,
        active_opacity = 0.95,
        inactive_opacity = 0.55,
        fullscreen_opacity = 1,
        blur = {
            size = 5,
            passes = 5,
            special = true,
        },
    },
})
