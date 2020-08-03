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
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-swap'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

" Language-specific
Plug 'ianks/vim-tsx'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()

let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-yaml', 'coc-eslint', 'coc-tslint-plugin', 'coc-rust-analyzer', 'coc-tsserver', 'coc-git', 'coc-smartf', 'coc-svelte']
