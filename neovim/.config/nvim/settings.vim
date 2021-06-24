set t_Co=256
set background=dark
set termguicolors

let g:falcon_inactive = 1
colorscheme falcon

syntax enable
syntax sync minlines=10000
filetype plugin indent on
hi link xmlEndTag xmlTag
let &fcs='eob: '
highlight Comment cterm=italic gui=italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set autoindent
set smartindent
set autoread
set cmdheight=2
set nobackup
set nowritebackup
set noundofile
set noswapfile
" This is OK if noswapfile is 1 because we won't be writing to the swap file
" the whole time, ruining the SSD.
set updatetime=100
set cursorline
set encoding=utf-8
set expandtab
set exrc
set hidden
set hlsearch
set ignorecase smartcase
set incsearch
set lazyredraw
set linebreak
set list
set noshowmode
set number
set scrolloff=6
set secure
set shiftwidth=2
set shortmess+=c
" set shortmess=I
set showcmd
set showmatch
set signcolumn=yes
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set ttimeout
set ttimeoutlen=100
set wildmenu
set wrap
set nu
set redrawtime=10000

