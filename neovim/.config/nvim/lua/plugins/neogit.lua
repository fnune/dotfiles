local neogit = require('neogit')
local nmap = require("utils").nmap

neogit.setup {
  disable_builtin_notifications = true,
  integrations = { diffview = true },
  kind = "vsplit",
  -- These could become defaults https://github.com/TimUntersberger/neogit/issues/497
  ignored_settings = {
    "NeogitPushPopup--force-with-lease",
    "NeogitPushPopup--force",
    "NeogitCommitPopup--allow-empty",
  },
}

nmap('<leader>g', '<cmd>Neogit<cr>')
