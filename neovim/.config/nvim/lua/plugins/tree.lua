local m = require("mapx")
local tree = require("nvim-tree")
local constants = require("constants")

tree.setup({
  view = { width = constants.file_explorer_width_chars, },
  diagnostics = { enable = true, show_on_dirs = true },
  renderer = { group_empty = true },
})

m.nmap("<leader>e", ":NvimTreeToggle<cr>", "Toggle the file explorer view")
m.nmap("<leader>E", ":NvimTreeFindFile<cr>", "Find the current file in the explorer")
