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
command! -nargs=0 Format :call CocAction('format')
nnoremap <leader>p :Format<CR>
command! -nargs=0 OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <leader>o :OrganizeImports<CR>
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

"******* Specific to coc.nvim ********"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> <space>j :<C-u>call       CocActionAsync('diagnosticNext',     'error')<CR>
nnoremap <silent> <space>k :<C-u>call       CocActionAsync('diagnosticPrevious', 'error')<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>re <Plug>(coc-refactor)
nmap <leader>c :CocCommand<CR>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Scroll the floating diagnostic window
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position
" Coc only does snippet and additional edit on confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <silent> <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <silent> <leader>af  <Plug>(coc-fix-current)

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
