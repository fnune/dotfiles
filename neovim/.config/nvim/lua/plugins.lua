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
Plug('kyazdani42/nvim-web-devicons')
Plug('kdheepak/lazygit.nvim')
Plug('romgrk/barbar.nvim')
Plug('kyazdani42/nvim-tree.lua')
Plug('rmagatti/auto-session')
Plug('chentoast/marks.nvim')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('tpope/vim-dadbod')
Plug('kristijanhusak/vim-dadbod-ui')
Plug('jxnblk/vim-mdx-js')

vim.call('plug#end')

vim.g.blamer_delay = 750
vim.g.blamer_enabled = 1
vim.g.blamer_relative_time = 1

vim.g.gitgutter_grep = 'rg'

vim.g.traces_abolish_integration = 1

require('bufferline').setup {
  animation = false,
  closable = false,
  clickable = false,
  icons = 'both',
}

require('nvim-tree').setup {}
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')
local function get_tree_size()
  return require('nvim-tree.view').View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_state.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('Resize', function()
  bufferline_state.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('TreeClose', function()
  bufferline_state.set_offset(0)
end)

require("auto-session").setup {}

-- https://github.com/kdheepak/lazygit.nvim
vim.cmd([[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
]])

require("marks").setup {}
