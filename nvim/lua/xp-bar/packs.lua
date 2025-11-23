vim.g.sessions_dir = '~/vim-sessions/'

local packs = {
    'xp-session',
    'xp-where',
    'xp-text-casing',
    'xp-changed',
    'xp-hidden',
    'xp-unjoin',
}

for index, pack in ipairs(packs) do
    -- vim.pack.add() is only available in nightly currently
    vim.cmd('packadd! ' .. pack)
end
