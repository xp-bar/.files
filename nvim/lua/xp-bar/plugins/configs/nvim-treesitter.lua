local M = {}

M.languages = {
  "css",
  "diff",
  "html",
  "blade",
  "gdscript",
  "javascript",
  "lua",
  "markdown",
  "markdown_inline",
  "php",
  "phpdoc",
  "query",
  "ruby",
  "scss",
  "sql",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
}

M.custom_languages = {
  "erb",
}

M.update_callback = function ()
    require('nvim-treesitter.parsers').erb = {
        install_info = {
            path = "~/.config/nvim/dependencies/tree-sitter-embedded-template/", -- local path or git repo
            -- url = "git@github.com:tree-sitter/tree-sitter-embedded-template.git", -- git URL
            generate = false, -- repo contains src/parser.c, no need to generate
            generate_from_json = false, -- repo contains src/grammar.json, no need to generate
            queries = 'queries/neovim', -- symlink queries from given directory
        },
    }

    vim.treesitter.language.register('erb', { 'eruby' })
end

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install(M.languages);

return M
