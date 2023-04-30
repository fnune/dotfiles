local nmap = require("utils").nmap
local constants = require("constants")

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

nmap('<leader>Dq', ':DiffviewClose<cr>')
nmap('<leader>Do', ':call DiffviewOpenCommitUnderCursor()<cr>')
nmap('<leader>Dh', ':call DiffviewFileHistoryFromCommitUnderCursor()<cr>')

-- See https://github.com/sindrets/diffview.nvim/issues/196#issuecomment-1244133866
vim.cmd([[
  function DiffviewOpenCommitUnderCursor()
    exe 'norm! 0"xyiw' | wincmd l | exe 'DiffviewOpen ' . getreg("x") . '^!'
  endfunction

  function DiffviewFileHistoryFromCommitUnderCursor()
    exe 'norm! 0"xyiw' | wincmd l | exe 'DiffviewFileHistory % --range=' . getreg("x")
  endfunction
]])
