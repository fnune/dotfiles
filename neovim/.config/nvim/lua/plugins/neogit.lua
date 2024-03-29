return {
  "NeogitOrg/neogit",
  lazy = true,
  cmd = "Neogit",
  opts = {
    disable_commit_confirmation = true,
    disable_builtin_notifications = true,
    kind = "vsplit",
    integrations = {
      telescope = false, -- https://github.com/NeogitOrg/neogit/issues/727
      diffview = true,
    },
    ignored_settings = {
      "NeogitCommitPopup--allow-empty",
      "NeogitPullPopup--rebase",
      "NeogitPushPopup--force",
      "NeogitPushPopup--force-with-lease",
      "NeogitRevertPopup--no-edit",
      "NeogitRevertPopup--no-verify",
    },
  },
  init = function()
    local m = require("mapx")

    m.nmap("<leader>g", ":Neogit<cr>", { silent = true }, "Open neogit")

    local colors = require("vscode.colors").get_colors()

    -- Signs for line highlighting
    vim.cmd("hi def NeogitDiffHeader guibg=" .. colors.vscBack .. " guifg=" .. colors.vscSplitLight)
    vim.cmd("hi def NeogitHunkHeader guibg=" .. colors.vscDiffGreenDark .. " guifg=" .. colors.vscSplitLight)
    vim.cmd("hi def NeogitDiffContext guibg=" .. colors.vscLeftDark .. " guifg=" .. colors.vscPopupFront)
    vim.cmd("hi def NeogitDiffAdd guibg=" .. colors.vscDiffGreenDark .. " guifg=" .. colors.vscGitAdded)
    vim.cmd("hi def NeogitDiffDelete guibg=" .. colors.vscDiffRedDark .. " guifg=" .. colors.vscGitDeleted)

    -- Signs for line highlighting current context
    vim.cmd("hi def NeogitDiffHeaderHighlight guibg=" .. colors.vscBack .. " guifg=" .. colors.vscSplitLight)
    vim.cmd("hi def NeogitHunkHeaderHighlight guibg=" .. colors.vscDiffGreenDark .. " guifg=" .. colors.vscSplitLight)
    vim.cmd("hi def NeogitDiffContextHighlight guibg=" .. colors.vscLeftMid .. " guifg=" .. colors.vscPopupFront)
    vim.cmd("hi def NeogitDiffAddHighlight guibg=" .. colors.vscDiffGreenLight .. " guifg=" .. colors.vscGitAdded)
    vim.cmd("hi def NeogitDiffDeleteHighlight guibg=" .. colors.vscDiffRedLight .. " guifg=" .. colors.vscGitDeleted)
  end,
}
