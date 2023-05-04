return {
  "TimUntersberger/neogit",
  opts = {
    disable_builtin_notifications = true,
    integrations = { diffview = true },
    kind = "vsplit",
    -- These could become defaults https://github.com/TimUntersberger/neogit/issues/497
    ignored_settings = {
      "NeogitPushPopup--force-with-lease",
      "NeogitPushPopup--force",
      "NeogitCommitPopup--allow-empty",
    },
  },
  init = function()
    local m = require("mapx")

    m.nmap("<leader>g", ":Neogit<cr>", "Open neogit")
  end
}
