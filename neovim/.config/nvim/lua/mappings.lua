vim.g.mapleader = ' '

local map = require("utils").map
local nmap = require("utils").nmap

nmap('0', '^')
nmap('Q', '<nop>')
nmap('j', 'gj')
nmap('k', 'gk')

-- <Ctrl-u> and <Ctrl-d> also center the screen
nmap('<C-u>', '<C-u>zz')
nmap('<C-d>', '<C-d>zz')

-- Visual select last pasted text
nmap('gp', '`[v`]')

-- Use <leader>l to clear the highlighting of :set hlsearch
nmap('<leader>l', '<cmd>nohlsearch<cr>')

-- Exit insert mode in a terminal
map('t', '<C-t><esc>', '<C-\\><C-n>')
