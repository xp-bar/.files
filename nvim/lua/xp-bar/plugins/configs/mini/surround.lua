require('mini.surround').setup({
    mappings = {
        add = 'S',
        delete = 'Sd',
        find = 'Sf',
        find_left = 'SF',
        highlight = 'Sh',
        replace = 'Sr',
        suffix_last = 'l',
        suffix_next = 'n',
    },
    search_method = 'cover_or_next',
    respect_selection_type = true,
    silent = true,
})
