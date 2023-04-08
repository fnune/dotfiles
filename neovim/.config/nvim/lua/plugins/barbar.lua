local nmap = require("utils").nmap

require('bufferline').setup {
  animation = false,
  clickable = false,
  icons = {
    buffer_index = true,
    filetype = { enabled = true },
    button = false,
  },
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(tbl)
    local set_offset = require('bufferline.api').set_offset

    local bufwinid
    local last_width
    local autocmd = vim.api.nvim_create_autocmd('WinScrolled', {
      callback = function()
        bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)

        local width = vim.api.nvim_win_get_width(bufwinid)
        if width ~= last_width then
          set_offset(width, 'FileTree')
          last_width = width
        end
      end,
    })

    vim.api.nvim_create_autocmd('BufWipeout', {
      buffer = tbl.buf,
      callback = function()
        vim.api.nvim_del_autocmd(autocmd)
        set_offset(0)
      end,
      once = true,
    })
  end,
  pattern = 'NvimTree',
})

nmap('<S-h>', '<cmd>BufferPrevious<cr>')
nmap('<S-l>', '<cmd>BufferNext<cr>')

nmap('<leader><<', '<cmd>BufferMovePrevious<cr>')
nmap('<leader>>>', '<cmd>BufferMoveNext<cr>')

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

nmap('<leader>q', ':close<cr>')
nmap('<leader>bq', '<cmd>BufferClose<cr>')
nmap('<leader>bQ', '<cmd>BufferCloseAllButCurrent<cr> <cmd>BufferClose<cr>')
nmap('<leader>be', '<cmd>BufferCloseAllButCurrent<cr>')

nmap('<leader>bb', '<cmd>BufferOrderByBufferNumber<cr>')
nmap('<leader>bd', '<cmd>BufferOrderByDirectory<cr>')
nmap('<leader>bl', '<cmd>BufferOrderByLanguage<cr>')
nmap('<leader>bw', '<cmd>BufferOrderByWindowNumber<cr>')
