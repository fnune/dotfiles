function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

set laststatus=2

" Show the full relative path of the file in the current buffer
set statusline+=%{expand('%:~:.')}

" Lsp progress
set statusline+=\ %{LspStatus()}

" Subsequent concatenations will be pushed to the far right
set statusline+=%=

" Filetype
set statusline+=\ %y
" Position as a percentage
set statusline+=\ %p%%
" Line and column
set statusline+=\ %l:%c
