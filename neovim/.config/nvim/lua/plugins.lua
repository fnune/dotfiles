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
Plug('lewis6991/gitsigns.nvim')
Plug('christoomey/vim-tmux-navigator')
Plug('editorconfig/editorconfig-vim')
Plug('farmergreg/vim-lastplace')
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
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('tpope/vim-dadbod')
Plug('kristijanhusak/vim-dadbod-ui')
Plug('LnL7/vim-nix')
Plug('jxnblk/vim-mdx-js')
Plug('folke/which-key.nvim')
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('vimwiki/vimwiki')
Plug('sindrets/diffview.nvim')
Plug('tyru/open-browser.vim')
Plug('tyru/open-browser-github.vim')

vim.call('plug#end')

vim.g.blamer_delay = 750
vim.g.blamer_enabled = 1
vim.g.blamer_relative_time = 1

vim.g.traces_abolish_integration = 1

require('bufferline').setup {
  animation = false,
  closable = false,
  clickable = false,
  icons = 'both',
}

require('nvim-tree').setup {}
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')
local function get_tree_size()
  return require('nvim-tree.view').View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)
nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

require("auto-session").setup { log_level = 'error' }

-- https://github.com/kdheepak/lazygit.nvim
vim.cmd([[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
]])

vim.cmd([[
  let wiki = {}
  let wiki.path = '~/.journal'
  let wiki.diary_rel_path = 'notes'
  let wiki.syntax = 'markdown'
  let wiki.ext = '.md'
  let wiki.auto_diary_index = 1
  let wiki.auto_tags = 1

  let g:vimwiki_list = [wiki]

  function! ConfigureMarkdownVimwiki() abort
    set number
    set textwidth=74
    set wrapmargin=0
    set formatoptions+=t
    set linebreak
  endfunction

  autocmd FileType markdown call ConfigureMarkdownVimwiki()
  autocmd FileType vimwiki  call ConfigureMarkdownVimwiki()
]])

require("which-key").setup {}

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { ".git/*", ".cache/*" },
  },
}
require('telescope').load_extension('fzf')

require('diffview').setup {}

require('gitsigns').setup {}
