local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.setup({
    config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
            php = {
                command = {'php', '-r'}
            },
            lua = {
                command = {'lua'}
            }
        },
        repl_open_cmd = view.bottom(40),
    }
})
