return {
  "NeogitOrg/neogit",
  lazy = true,
  cmd = "Neogit",
  opts = {
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    kind = "split",
  },
  init = function()
    local m = require("mapx")

    m.nmap("<leader>g", ":Neogit<cr>", { silent = true }, "Open neogit")
  end
}
