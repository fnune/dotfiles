vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd('hi link xmlEndTag xmlTag')

require('rose-pine').setup({
  variant = 'auto',
  dark_variant = 'main',
  disable_italics = true,
})

vim.cmd('colorscheme rose-pine')
vim.cmd('highlight Comment cterm=italic gui=italic')
