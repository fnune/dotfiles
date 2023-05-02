local m = require("mapx")
local neogit = require('neogit')

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

m.nmap("<leader>g", ":Neogit<cr>", "Open neogit")
