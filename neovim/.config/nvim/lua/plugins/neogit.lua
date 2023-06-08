return {
  "CKolkey/neogit",
  lazy = true,
  cmd = "Neogit",
  opts = {
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    integrations = { diffview = true },
    kind = "vsplit",
    -- These could become defaults https://github.com/TimUntersberger/neogit/issues/497
    ignored_settings = {
      "NeogitCommitPopup--allow-empty",
      "NeogitCommitPopup--no-verify",
      "NeogitPushPopup--force",
      "NeogitPushPopup--force-with-lease",
    },
  },
  init = function()
    local m = require("mapx")

    m.nmap("<leader>g", ":Neogit<cr>", { silent = true }, "Open neogit")
  end
}
