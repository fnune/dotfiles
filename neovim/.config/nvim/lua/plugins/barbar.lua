local m = require("mapx")

require('bufferline').setup {
  animation = false,
  clickable = false,
  icons = {
    buffer_index = true,
    button = false,
    filetype = { enabled = true },
    pinned = { button = '車', filename = true },
  },
}

vim.api.nvim_create_autocmd('ExitPre', {
  command = "lua require('dapui').close()",
  nested = true,
})

m.nmap("<S-h>", "<cmd>BufferPrevious<cr>", "Previous buffer")
m.nmap("<S-l>", "<cmd>BufferNext<cr>", "Next buffer")

m.nmap("<leader><", "<cmd>BufferMovePrevious<cr>", "Shift buffer left")
m.nmap("<leader>>", "<cmd>BufferMoveNext<cr>", "Shift buffer right")

m.nmap("<M-p>", "<cmd>BufferPin<cr>", "Pin buffer")

m.nmap("<M-1>", "<cmd>BufferGoto 1<cr>", "Open buffer 1")
m.nmap("<M-2>", "<cmd>BufferGoto 2<cr>", "Open buffer 2")
m.nmap("<M-3>", "<cmd>BufferGoto 3<cr>", "Open buffer 3")
m.nmap("<M-4>", "<cmd>BufferGoto 4<cr>", "Open buffer 4")
m.nmap("<M-5>", "<cmd>BufferGoto 5<cr>", "Open buffer 5")
m.nmap("<M-6>", "<cmd>BufferGoto 6<cr>", "Open buffer 6")
m.nmap("<M-7>", "<cmd>BufferGoto 7<cr>", "Open buffer 7")
m.nmap("<M-8>", "<cmd>BufferGoto 8<cr>", "Open buffer 8")
m.nmap("<M-9>", "<cmd>BufferGoto 9<cr>", "Open buffer 9")
m.nmap("<M-0>", "<cmd>BufferLast<cr>")

m.nmap("<leader>q", ":quit<cr>", "Quit")

m.nname("<leader>b", "Buffers")
m.nmap("<leader>bq", "<cmd>BufferClose<cr>", "Close buffer")
m.nmap("<leader>bQ", "<cmd>BufferCloseAllButCurrent<cr> <cmd>BufferClose<cr>", "Close all buffers")
m.nmap("<leader>be", "<cmd>BufferCloseAllButCurrentOrPinned<cr>", "Close all buffers but pinned or current")
