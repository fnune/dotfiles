local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('APZelos/blamer.nvim')
Plug('AndrewRadev/tagalong.vim')
Plug('Mofiqul/vscode.nvim')
Plug('christoomey/vim-tmux-navigator')
Plug('editorconfig/editorconfig-vim')
Plug('farmergreg/vim-lastplace')
Plug('folke/which-key.nvim')
Plug('jxnblk/vim-mdx-js')
Plug('kdheepak/lazygit.nvim')
Plug('kristijanhusak/vim-dadbod-ui')
Plug('kyazdani42/nvim-tree.lua')
Plug('kyazdani42/nvim-web-devicons')
Plug('lewis6991/gitsigns.nvim')
Plug('machakann/vim-swap')
Plug('markonm/traces.vim')
Plug('matze/vim-move')
Plug('mbbill/undotree')
Plug('mfussenegger/nvim-dap')
Plug('mfussenegger/nvim-dap-python')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/completion-treesitter')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('rcarriga/nvim-dap-ui')
Plug('rmagatti/auto-session')
Plug('romgrk/barbar.nvim')
Plug('rose-pine/neovim')
Plug('sindrets/diffview.nvim')
Plug('theHamsta/nvim-dap-virtual-text')
Plug('tpope/vim-abolish')
Plug('tpope/vim-commentary')
Plug('tpope/vim-dadbod')
Plug('tpope/vim-eunuch')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('tversteeg/registers.nvim')
Plug('tyru/open-browser-github.vim')
Plug('tyru/open-browser.vim')
Plug('vimwiki/vimwiki')

vim.call('plug#end')

require("plugins.auto-session")
require("plugins.barbar")
require("plugins.blamer")
require("plugins.coc")
require("plugins.dap")
require("plugins.diffview")
require("plugins.gitsigns")
require("plugins.lazygit")
require("plugins.telescope")
require("plugins.traces")
require("plugins.tree")
require("plugins.treesitter")
require("plugins.which-key")
