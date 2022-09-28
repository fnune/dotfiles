let g:coc_global_extensions = [
  \'coc-clangd',
  \'coc-db',
  \'coc-docker',
  \'coc-eslint',
  \'coc-jest',
  \'coc-json',
  \'coc-prettier',
  \'coc-pyright',
  \'coc-rust-analyzer',
  \'coc-sh',
  \'coc-sql',
  \'coc-sumneko-lua',
  \'coc-toml',
  \'coc-tsserver',
  \'coc-vimlsp',
  \'coc-yaml',
\]

" Trigger completion using <tab>
inoremap <silent><expr> <tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><S-tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <cr> accept the selected completion item
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Trigger completion using <c-space>
inoremap <silent><expr> <c-space> coc#refresh()

" Use <leader>{k,j} to navigate diagnostics
nmap <leader>k <Plug>(coc-diagnostic-prev)
nmap <leader>j <Plug>(coc-diagnostic-next)

" Go-to code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in a preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename a symbol
nmap <silent><leader>r <Plug>(coc-rename)

" Format a file
nmap <silent><leader>p :call CocActionAsync('runCommand', 'editor.action.formatDocument')<cr>

" Add a command to organize imports of the current buffer
nmap <silent><C-M-o> :call CocActionAsync('runCommand', 'editor.action.organizeImport')<cr>

nmap <silent><leader>c :CocList commands<cr>

" Code actions
nmap <silent><leader>al <Plug>(coc-codeaction-line)
xmap <silent><leader>ac v<Plug>(coc-codeaction-selected)
nmap <silent><leader>ac v<Plug>(coc-codeaction-selected)
nmap <silent><leader>aq <Plug>(coc-fix-current)
nmap <silent><leader>aL <Plug>(coc-codelens-action)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll floating windows/popups
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
