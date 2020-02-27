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
nnoremap <leader>F :Ag<SPACE>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>q :q<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>p :Prettier<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>wq :wq!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap j gj
nnoremap k gk
" <Ctrl-u> and <Ctrl-d> also center the screen
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
" Comfy mappings for buffer-previous and buffer-next
nnoremap <silent> <leader>> :bn<CR>
nnoremap <silent> <leader>< :b#<CR>
" Go to file in a vertical split
nnoremap vgf <C-w>v gf
" GD (uppercase) from an imported variable to go to the file that defines it
nnoremap gF gd/'<CR>:noh<CR>gf
" Visual select last pasted text
nnoremap gp `[v`]
" Use <leader>l to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"******* Specific to coc.nvim ********"

" Use <c-space> to trigger completion
nnoremap <silent> <space>j :<C-u>call       CocActionAsync('diagnosticNext',     'error')<CR>
nnoremap <silent> <space>k :<C-u>call       CocActionAsync('diagnosticPrevious', 'error')<CR>
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position
" Coc only does snippet and additional edit on confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
  execute 'Git pull-request -b ' . l:branch
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
  nnoremap <buffer> Fu :Gpull<cr>
  nnoremap <buffer> pp :Gpush<cr>
  nnoremap <buffer> p-fp :Gpush -f<cr>
  nnoremap <buffer> gr :Git sync<cr>
  nnoremap <buffer> fa :Git fetch --all<cr>
  nnoremap <buffer> bc :Git checkout -b<space>
endfunction
