vim.opt.laststatus = 2

-- Show the path to the file in the current buffer
vim.opt.statusline = vim.opt.statusline + '%F'

-- Subsequent concatenations will be pushed to the far right
vim.opt.statusline = vim.opt.statusline + '%='

-- CoC.vim support
vim.opt.statusline = vim.opt.statusline + '%{coc#status()}%{get(b:,"coc_current_function","")}'

-- Filetype
vim.opt.statusline = vim.opt.statusline + ' %y'

-- Position as a percentage
vim.opt.statusline = vim.opt.statusline + ' %p%%'

-- Line and column
vim.opt.statusline = vim.opt.statusline + ' %l:%c'
