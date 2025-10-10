return {
  init_options = {
    licenceKey = (os.getenv('INTELEPHENSE_LICENSE_KEY') or ''),
  },
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          -- NOTE: this needs to be setup separately; is a separate Laravel install w/ stubs
          os.getenv('HOME') .. '/Code/laravel-stubs'
        }
      }
    }
  }
}
