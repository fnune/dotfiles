local nmap = require("utils").nmap

-- https://github.com/kdheepak/lazygit.nvim
vim.cmd([[
  if has('nvim') && executable('nvr')
    let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
  endif
]])

nmap('<leader>g', '<cmd>LazyGit<cr>')