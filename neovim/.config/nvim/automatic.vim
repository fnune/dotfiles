au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au CursorHold * silent call CocActionAsync('highlight')
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
