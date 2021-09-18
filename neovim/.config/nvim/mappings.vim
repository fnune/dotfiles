let mapleader=" "

map 0 ^
imap <c-x><c-l> <plug>(fzf-complete-line)
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
nnoremap Q <nop>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>F :Rg<space>
nnoremap <leader>g :Git<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>p :Format<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>wq :wq!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap j gj
nnoremap k gk
" <Ctrl-u> and <Ctrl-d> also center the screen
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
" Toggle between the last and the current buffer
nnoremap <silent> <leader>< <C-^>
" Go to file in a vertical split
nnoremap vgf <C-w>v gf
" GD (uppercase) from an imported variable to go to the file that defines it
nnoremap gF gd/'<CR>:noh<CR>gf
" Visual select last pasted text
nnoremap gp `[v`]
" Use <leader>l to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>l :nohlsearch<CR>
" Navigate the completion list with <C-jk> in addition to <C-NP>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
" Reload the config
nnoremap <leader>rc :source $MYVIMRC<CR>

" Checkout a branch in fzf
function! s:open_branch_fzf(line)
  let l:parser = split(a:line)
  let l:branch = l:parser[0]
  if l:branch ==? '*'
    let l:branch = l:parser[1]
  endif
  execute '!git checkout ' . l:branch
endfunction

command! -bang -nargs=0 GCheckout
  \ call fzf#vim#grep(
  \   'git branch --sort=-committerdate', 0,
  \   {
  \     'sink': function('s:open_branch_fzf')
  \   },
  \   <bang>0
  \ )

" Make a PR from the current branch,
" based on an fzf-selected branch
function! s:pull_request_branch_fzf(line)
  let l:parser = split(a:line)
  let l:branch = l:parser[0]
  if l:branch ==? '*'
    let l:branch = l:parser[1]
  endif
  execute 'Git pull-request -e -o -b ' . l:branch
endfunction

command! -bang -nargs=0 GPullRequest
  \ call fzf#vim#grep(
  \   'git branch --sort=-committerdate', 0,
  \   {
  \     'sink': function('s:pull_request_branch_fzf')
  \   },
  \   <bang>0
  \ )

autocmd Filetype fugitive call SetFugitiveMappings()
function SetFugitiveMappings()
  nnoremap <silent> <buffer> bb :GCheckout<cr>
  nnoremap <buffer> pr :GPullRequest<cr>
  nnoremap <buffer> Fu :Git pull<cr>
  nnoremap <buffer> pp :Git push<cr>
  nnoremap <buffer> p-fp :Git push -f<cr>
  nnoremap <buffer> gr :Git sync<cr>
  nnoremap <buffer> fa :Git fetch --all<cr>
  nnoremap <buffer> bc :Git checkout -b<space>
endfunction

noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <silent> <M-0> :tablast<cr>

nnoremap <leader>n :NnnPicker<CR>
nnoremap <leader>N :NnnPicker %:p:h<CR>

" https://github.com/vim/vim/issues/4738
nnoremap <silent> gx :call netrw#BrowseX(netrw#GX(),0)<cr>
