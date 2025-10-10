return {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = (os.getenv('NVM_BIN') or '') .. '/../lib/@vue/typescript-plugin',
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },
}
