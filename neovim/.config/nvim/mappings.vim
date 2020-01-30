let mapleader=" "

map 0 ^
imap <c-x><c-l> <plug>(fzf-complete-line)
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>F :Ag<SPACE>
nnoremap <Leader>g :Gstatus<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w!<CR>
nnoremap <Leader>wq :wq!<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap j gj
nnoremap k gk
" <Ctrl-u> and <Ctrl-d> also center the screen
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
" Comfy mappings for buffer-previous and buffer-next
nnoremap <silent> <Leader>> :bn<CR>
nnoremap <silent> <Leader>< :b#<CR>
" Go to file in a vertical split
nnoremap vgf <C-w>v gf
" GD (uppercase) from an imported variable to go to the file that defines it
nnoremap gF gd/'<CR>:noh<CR>gf
" Visual select last pasted text
nnoremap gp `[v`]
" Use <Leader>l to clear the highlighting of :set hlsearch.
nnoremap <silent> <Leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" https://github.com/tomhoule/gitmoji-selector
nmap <Leader>e "=system('gitmoji-selector')<C-M>P<Paste>

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
