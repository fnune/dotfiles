local constants = require("plugins.constants")

require('nvim-tree').setup {
  view = { width = constants.file_explorer_width_chars, },
  diagnostics = { enable = true, show_on_dirs = true },
  renderer = { group_empty = true },
}

