set t_Co=256
set background=dark
set termguicolors

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

syntax enable
syntax sync minlines=10000
filetype plugin indent on
hi Normal guibg=NONE ctermbg=NONE
hi link xmlEndTag xmlTag
let &fcs='eob: '
highlight Comment cterm=italic gui=italic
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
set autoindent
set autoread
set cmdheight=2
set nobackup
set nowritebackup
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
set nu rnu
set redrawtime=10000

