vim.cmd 'packadd paq-nvim'

require 'paq' {
  { "savq/paq-nvim", opt = true },
  { "AndrewRadev/tagalong.vim" },
  { "editorconfig/editorconfig-vim" },
  { "tpope/vim-abolish" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
}

vim.o.timeoutlen = 500
vim.o.lazyredraw = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.g.mapleader = " "

vim.cmd("xmap gc <Plug>VSCodeCommentary")
vim.cmd("nmap gc <Plug>VSCodeCommentary")
vim.cmd("omap gc <Plug>VSCodeCommentary")
vim.cmd("nmap gcc <Plug>VSCodeCommentaryLine")

vim.cmd("nnoremap 0 ^")
vim.cmd("nnoremap <leader>l :nohl<CR>")

local function vscmap(mapping, action)
  vim.cmd(mapping .. " <Cmd>call VSCodeNotify('" .. action .. "')<CR>")
end
vscmap("nnoremap <leader>q", "workbench.action.closeActiveEditor")
vscmap("nnoremap <leader>f", "workbench.action.quickOpen")
vscmap("nnoremap <leader>F", "workbench.view.search")
vscmap("nnoremap <leader>e", "workbench.view.explorer")
vscmap("nnoremap <leader>p", "editor.action.formatDocument")
vscmap("nnoremap <leader>a", "editor.action.codeAction")
vscmap("nnoremap <leader>j", "editor.action.marker.nextInFiles")
vscmap("nnoremap <leader>k", "editor.action.marker.prevInFiles")
