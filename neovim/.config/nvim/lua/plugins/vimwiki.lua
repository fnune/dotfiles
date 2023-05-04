return {
  "vimwiki/vimwiki",
  init = function()
    vim.cmd([[
      let wiki = {}
      let wiki.path = '~/.journal'
      let wiki.diary_rel_path = 'notes'
      let wiki.syntax = 'markdown'
      let wiki.ext = '.md'
      let wiki.auto_diary_index = 1

      let g:vimwiki_list = [wiki]

      function! ConfigureMarkdownVimwiki() abort
        set number
        set textwidth=74
        set wrapmargin=0
        set formatoptions+=t
        set linebreak
      endfunction

      autocmd FileType markdown call ConfigureMarkdownVimwiki()
      autocmd FileType vimwiki  call ConfigureMarkdownVimwiki()
    ]])
  end,
}
