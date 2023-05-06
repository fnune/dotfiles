return {
  "romgrk/barbar.nvim",
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    animation = false,
    clickable = false,
    icons = {
      buffer_index = true,
      button = false,
      filetype = { enabled = true },
      pinned = { button = '車', filename = true },
    },
  },
  init = function()
    vim.g.barbar_auto_setup = false

    vim.cmd('hi! link TabLineFill BufferInactive')

    local m = require("mapx")

    vim.api.nvim_create_autocmd('ExitPre', {
      command = "lua require('dapui').close()",
      nested = true,
    })

    m.nmap("<S-h>", ":BufferPrevious<cr>", { silent = true }, "Previous buffer")
    m.nmap("<S-l>", ":BufferNext<cr>", { silent = true }, "Next buffer")

    m.nmap("<leader><", ":BufferMovePrevious<cr>", { silent = true }, "Shift buffer left")
    m.nmap("<leader>>", ":BufferMoveNext<cr>", { silent = true }, "Shift buffer right")

    m.nmap("<M-p>", ":BufferPin<cr>", { silent = true }, "Pin buffer")

    m.nmap("<M-1>", ":BufferGoto 1<cr>", "Open buffer 1")
    m.nmap("<M-2>", ":BufferGoto 2<cr>", "Open buffer 2")
    m.nmap("<M-3>", ":BufferGoto 3<cr>", "Open buffer 3")
    m.nmap("<M-4>", ":BufferGoto 4<cr>", "Open buffer 4")
    m.nmap("<M-5>", ":BufferGoto 5<cr>", "Open buffer 5")
    m.nmap("<M-6>", ":BufferGoto 6<cr>", "Open buffer 6")
    m.nmap("<M-7>", ":BufferGoto 7<cr>", "Open buffer 7")
    m.nmap("<M-8>", ":BufferGoto 8<cr>", "Open buffer 8")
    m.nmap("<M-9>", ":BufferGoto 9<cr>", "Open buffer 9")
    m.nmap("<M-0>", ":BufferLast<cr>")

    m.nmap("<leader>q", ":quit<cr>", { silent = true }, "Quit")

    m.nname("<leader>b", "Buffers")
    m.nmap("<leader>bq", ":BufferClose<cr>", { silent = true }, "Close buffer")
    m.nmap("<leader>bQ", ":BufferCloseAllButCurrent<cr> :BufferClose<cr>", { silent = true }, "Close all buffers")
    m.nmap("<leader>be", ":BufferCloseAllButCurrentOrPinned<cr>", { silent = true },
      "Close all buffers but pinned or current")
  end
}
