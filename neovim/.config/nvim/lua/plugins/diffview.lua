local constants = require("plugins.constants")

require('diffview').setup {
  hooks = {
    diff_buf_read = function(_)
      vim.g.blamer_enabled = 0
    end,
  },
  enhanced_diff_hl = true,
  use_icons = true,
  file_panel = {
    win_config = {
      width = constants.file_explorer_width_chars,
    },
  },
}
