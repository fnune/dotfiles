vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd('colorscheme rose-pine')
vim.cmd('hi link xmlEndTag xmlTag')
vim.cmd('highlight Comment cterm=italic gui=italic')

-- A manually-darkened version of colors.normal.red
vim.cmd('highlight DiffDelete guifg=#5c2c4b')

