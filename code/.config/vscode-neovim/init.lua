vim.cmd 'packadd paq-nvim'

require 'paq' {
  { "AndrewRadev/tagalong.vim" },
  { "editorconfig/editorconfig-vim" },
  { "savq/paq-nvim", opt = true },
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
vim.cmd("nnoremap j gj")
vim.cmd("nnoremap k gk")
vim.cmd("nnoremap <c-u> <c-u>zz")
vim.cmd("nnoremap <c-d> <c-d>zz")

local function vscmap(mapping, action)
  vim.cmd(mapping .. " <Cmd>call VSCodeNotify('" .. action .. "')<CR>")
end
vscmap("nnoremap <leader>q", "workbench.action.closeActiveEditor")
vscmap("nnoremap <leader>f", "workbench.action.quickOpen")
vscmap("nnoremap <leader>F", "workbench.view.search")
vscmap("nnoremap <leader>e", "workbench.view.explorer")
vscmap("nnoremap <leader>p", "editor.action.formatDocument")
vscmap("nnoremap <leader>a", "editor.action.sourceAction")
vscmap("nnoremap <leader>j", "editor.action.marker.nextInFiles")
vscmap("nnoremap <leader>k", "editor.action.marker.prevInFiles")
vscmap("nnoremap <leader>r", "editor.action.rename")
vscmap("nnoremap <s-h>", "workbench.action.previousEditor")
vscmap("nnoremap <s-l>", "workbench.action.nextEditor")

vim.cmd("nnoremap <m-k> <Cmd>call VSCodeCallVisual('editor.action.moveLinesUpAction',1)<CR>")
vim.cmd("nnoremap <m-j> <Cmd>call VSCodeCallVisual('editor.action.moveLinesDownAction',1)<CR>")
vim.cmd("xnoremap <m-k> <Cmd>call VSCodeCallVisual('editor.action.moveLinesUpAction',1)<CR>")
vim.cmd("xnoremap <m-j> <Cmd>call VSCodeCallVisual('editor.action.moveLinesDownAction',1)<CR>")
