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
Plug 'AndrewRadev/tagalong.vim'
Plug 'airblade/vim-gitgutter'
Plug 'brooth/far.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'fnune/base16-vim'
Plug 'jgdavey/tslime.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-swap'
Plug 'markonm/traces.vim'
Plug 'mcchrish/nnn.vim'
Plug 'mkitt/tabline.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'

" Technology-specific
Plug 'jparise/vim-graphql'
Plug 'evanleck/vim-svelte'
Plug 'pantharshit00/vim-prisma'

call plug#end()

let g:coc_global_extensions = [
  \'coc-actions',
  \'coc-css',
  \'coc-eslint',
  \'coc-html',
  \'coc-json',
  \'coc-pairs',
  \'coc-prettier',
  \'coc-prisma',
  \'coc-pyright',
  \'coc-rust-analyzer',
  \'coc-sh',
  \'coc-styled-components',
  \'coc-svelte',
  \'coc-tslint-plugin',
  \'coc-tsserver',
  \'coc-yaml',
\]

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
