vim.g.mapleader = ' '

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

nmap('0', '^')
nmap('Q', '<nop>')
nmap('j', 'gj')
nmap('k', 'gk')

nmap('<leader>f', '<cmd>FZF<cr>')
nmap('<leader>F', '<cmd>Rg<space>')
nmap('<leader>g', '<cmd>Git<cr>')
nmap('<leader>q', '<cmd>q<cr>')
nmap('<leader>p', '<cmd>Format<cr>')

-- <Ctrl-u> and <Ctrl-d> also center the screen
nmap('<C-u>', '<C-u>zz')
nmap('<C-d>', '<C-d>zz')

-- Visual select last pasted text
nmap('gp', '`[v`]')

-- Use <leader>l to clear the highlighting of :set hlsearch.
nmap('<leader>l', '<cmd>nohlsearch<cr>')

nmap('<M-1>', '1gt')
nmap('<M-2>', '2gt')
nmap('<M-3>', '3gt')
nmap('<M-4>', '4gt')
nmap('<M-5>', '5gt')
nmap('<M-6>', '6gt')
nmap('<M-7>', '7gt')
nmap('<M-8>', '8gt')
nmap('<M-9>', '9gt')
nmap('<M-0>', '<cmd>tablast<cr>')
