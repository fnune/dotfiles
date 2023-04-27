local nmap = require("utils").nmap

require('bufferline').setup {
  animation = false,
  clickable = false,
  sidebar_filetypes = {
    NvimTree = true,
    undotree = true,
  },
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

nmap('<S-h>', '<cmd>BufferPrevious<cr>')
nmap('<S-l>', '<cmd>BufferNext<cr>')

nmap('<leader><<', '<cmd>BufferMovePrevious<cr>')
nmap('<leader>>>', '<cmd>BufferMoveNext<cr>')

nmap('<M-p>', '<cmd>BufferPin<cr>')

nmap('<M-1>', '<cmd>BufferGoto 1<cr>')
nmap('<M-2>', '<cmd>BufferGoto 2<cr>')
nmap('<M-3>', '<cmd>BufferGoto 3<cr>')
nmap('<M-4>', '<cmd>BufferGoto 4<cr>')
nmap('<M-5>', '<cmd>BufferGoto 5<cr>')
nmap('<M-6>', '<cmd>BufferGoto 6<cr>')
nmap('<M-7>', '<cmd>BufferGoto 7<cr>')
nmap('<M-8>', '<cmd>BufferGoto 8<cr>')
nmap('<M-9>', '<cmd>BufferGoto 9<cr>')
nmap('<M-0>', '<cmd>BufferLast<cr>')

nmap('<leader>q', ':quit<cr>')
nmap('<leader>bq', '<cmd>BufferClose<cr>')
nmap('<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr> <cmd>BufferClose<cr>')
nmap('<leader>be', '<cmd>BufferCloseAllButCurrentOrPinned<cr>')

nmap('<leader>bb', '<cmd>BufferOrderByBufferNumber<cr>')
nmap('<leader>bd', '<cmd>BufferOrderByDirectory<cr>')
nmap('<leader>bl', '<cmd>BufferOrderByLanguage<cr>')
nmap('<leader>bw', '<cmd>BufferOrderByWindowNumber<cr>')
