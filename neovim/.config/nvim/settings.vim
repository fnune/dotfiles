set t_Co=256
set background=dark
let base16colorspace=256
colorscheme base16-horizon-dark

syntax enable
filetype plugin indent on
hi Normal guibg=NONE ctermbg=NONE
hi link xmlEndTag xmlTag
highlight Comment cterm=italic gui=italic
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set autoindent
set autoread
set backupcopy=yes
set cursorline
set encoding=utf-8
set expandtab
set exrc
set hidden
set hlsearch
set ignorecase smartcase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set list
set noshowmode
set number
set scrolloff=6
set secure
set shiftwidth=2
set shortmess+=c
set shortmess=I
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
set updatetime=300
set wildmenu
set wrap
set number relativenumber
set nu rnu

