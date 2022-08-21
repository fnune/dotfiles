if not vim.fn.executable('node') then
  os.execute('volta install node')
end

if not vim.fn.executable('yarn') then
  os.execute('volta install yarn')
end

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('APZelos/blamer.nvim')
Plug('AndrewRadev/tagalong.vim')
Plug('Raimondi/delimitMate')
Plug('airblade/vim-gitgutter')
Plug('christoomey/vim-tmux-navigator')
Plug('editorconfig/editorconfig-vim')
Plug('farmergreg/vim-lastplace')
Plug('junegunn/fzf', { dir = '~/.fzf' })
Plug('junegunn/fzf.vim')
Plug('junegunn/goyo.vim')
Plug('machakann/vim-swap')
Plug('markonm/traces.vim')
Plug('matze/vim-move')
Plug('mhartington/formatter.nvim')
Plug('mkitt/tabline.vim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/completion-treesitter')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = '<cmd>TSUpdate' })
Plug('rose-pine/neovim')
Plug('rrethy/vim-hexokinase', { ['do'] = 'make hexokinase' })
Plug('tmhedberg/matchit')
Plug('tpope/vim-abolish')
Plug('tpope/vim-commentary')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-repeat')
Plug('tpope/vim-rhubarb')
Plug('tpope/vim-surround')
Plug('tversteeg/registers.nvim')

-- Intellisense
Plug('L3MON4D3/LuaSnip')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('nvim-lua/popup.nvim')
Plug('RishabhRD/lspactions')

vim.call('plug#end')

vim.g.blamer_delay = 750
vim.g.blamer_enabled = 1
vim.g.blamer_relative_time = 1

vim.g.gitgutter_grep = 'rg'

vim.g.traces_abolish_integration = 1
