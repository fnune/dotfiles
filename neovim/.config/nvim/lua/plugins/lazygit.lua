return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitConfig" },
  enabled = false, -- Using neogit for now.
  init = function()
    local m = require("mapx")

    m.nmap("<leader>g", ":LazyGit<cr>", { silent = true }, "Open lazygit")

    vim.cmd([[
      if has('nvim') && executable('nvr')
        let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
      endif
    ]])
  end,
}
