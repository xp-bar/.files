require('ibl').setup({
  scope = {
    enabled = true,
    exclude = {
      language = {
        'css', 'scss', 'sass'
      }
    }
  },
  indent = {
    char = '▏',
  },
  exclude = {
    filetypes = {
      --defaults
      'lspinfo',
      'packer',
      'checkhealth',
      'help',
      'man',
      'gitcommit',
      'TelescopePrompt',
      'TelescopeResults',
      -- additions
      'startify',
      'markdown',
      'xxx'
    }
  },
})
