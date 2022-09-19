vim.g.mapleader = ' '

local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

nmap('0', '^')
nmap('Q', '<nop>')
nmap('j', 'gj')
nmap('k', 'gk')

nmap('<leader>f', '<cmd>FZF<cr>')
nmap('<leader>F', '<cmd>Rg<cr>')
nmap('<leader>g', '<cmd>LazyGit<cr>')

-- <Ctrl-u> and <Ctrl-d> also center the screen
nmap('<C-u>', '<C-u>zz')
nmap('<C-d>', '<C-d>zz')

-- Visual select last pasted text
nmap('gp', '`[v`]')

-- Use <leader>l to clear the highlighting of :set hlsearch
nmap('<leader>l', '<cmd>nohlsearch<cr>')

-- Use <leader><esc> to exit insert mode in a terminal
map('t', '<leader><esc>', '<C-\\><C-n>')

-- Tabs with barbar
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
nmap('<leader>be', '<cmd>BufferCloseAllButCurrent<cr>')

nmap('<leader>bb', '<cmd>BufferOrderByBufferNumber<cr>')
nmap('<leader>bd', '<cmd>BufferOrderByDirectory<cr>')
nmap('<leader>bl', '<cmd>BufferOrderByLanguage<cr>')
nmap('<leader>bw', '<cmd>BufferOrderByWindowNumber<cr>')

-- Toggle neovim-tree
nmap('<leader>e', ':NvimTreeToggle<cr>')
nmap('<leader>E', ':NvimTreeFindFile<cr>')
