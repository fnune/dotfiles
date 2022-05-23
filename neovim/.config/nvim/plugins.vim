if !executable('node')
  !volta install node
endif

if !executable('yarn')
  !volta install yarn
endif

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Generic
Plug 'APZelos/blamer.nvim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'rose-pine/neovim'
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-swap'
Plug 'markonm/traces.vim'
Plug 'matze/vim-move'
Plug 'mcchrish/nnn.vim'
Plug 'mhartington/formatter.nvim'
Plug 'mkitt/tabline.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tversteeg/registers.nvim'

" Treesitter
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

let g:vim_svelte_plugin_load_full_syntax = 1
let g:nnn#command = 'nnn -H'
let g:nnn#layout = { 'window': { 'width': 0.6, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = { '<c-x>': 'split', '<c-v>': 'vsplit', '<c-t>': 'tab split' }
let test#strategy = "tslime"
let test#filename_modifier = ':p'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:tslime_autoset_pane = 1
let g:gitgutter_grep = 'rg'
let g:traces_abolish_integration = 1
let g:fugitive_git_executable = 'hub'
let g:blamer_enabled = 1
let g:blamer_delay = 750
let g:blamer_relative_time = 1
