local nmap = require("utils").nmap

local constants = require("constants")

require('nvim-tree').setup {
  view = { width = constants.file_explorer_width_chars, },
  diagnostics = { enable = true, show_on_dirs = true },
  renderer = { group_empty = true },
}

vim.api.nvim_create_autocmd('BufEnter', {
  command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  nested = true,
})

nmap('<leader>e', ':NvimTreeToggle<cr>')
nmap('<leader>E', ':NvimTreeFindFile<cr>')
