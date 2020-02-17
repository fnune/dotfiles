set laststatus=2

" Show the full relative path of the file in the current buffer
set statusline+=%{expand('%:~:.')}

" Subsequent concatenations will be pushed to the far right
set statusline+=%=

" Filetype
set statusline+=\ %y
" Position as a percentage
set statusline+=\ %p%%
" Line and column
set statusline+=\ %l:%c

