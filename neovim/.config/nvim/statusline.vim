set laststatus=2

" Show the full relative path of the file in the current buffer
set statusline+=%{expand('%:~:.')}
" CoC status
set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}

" Subsequent concatenations will be pushed to the far right
set statusline+=%=

" Filetype
set statusline+=\ %y
" Position as a percentage
set statusline+=\ %p%%
" Line and column
set statusline+=\ %l:%c
