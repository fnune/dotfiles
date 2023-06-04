local constants = require("constants")
return {
  "sindrets/diffview.nvim",
  lazy = true,
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    file_panel = {
      win_config = {
        width = constants.file_explorer_width_chars,
      },
    },
  },
  init = function()
    local m = require("mapx")

    m.nname("<leader>D", "Diff and blame")
    m.nmap("<leader>Dq", ":DiffviewClose<cr>", { silent = true }, "Close diff view")
    m.nmap("<leader>Do", ":call DiffviewOpenCommitUnderCursor()<cr>", { silent = true },
      "Open a diff for the commit under the cursor")
    m.nmap("<leader>Dh", ":call DiffviewFileHistoryFromCommitUnderCursor()<cr>", { silent = true },
      "Open a file history starting from the commit under the cursor")

    -- See https://github.com/sindrets/diffview.nvim/issues/196#issuecomment-1244133866
    vim.cmd([[
      function DiffviewOpenCommitUnderCursor()
        exe 'norm! 0"xyiw' | wincmd l | exe 'DiffviewOpen ' . getreg("x") . '^!'
      endfunction

      function DiffviewFileHistoryFromCommitUnderCursor()
        exe 'norm! 0"xyiw' | wincmd l | exe 'DiffviewFileHistory % --range=' . getreg("x")
      endfunction
    ]])
  end
}
