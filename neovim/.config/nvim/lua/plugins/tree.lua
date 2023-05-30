local constants = require("constants")
return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  opts = {
    view = { width = constants.file_explorer_width_chars, },
    diagnostics = { enable = false },
    renderer = { group_empty = true },
  },
  init = function()
    local m = require("mapx")

    m.nmap("<leader>e", ":NvimTreeToggle<cr>", "Toggle the file explorer view")
    m.nmap("<leader>E", ":NvimTreeFindFile<cr>", "Find the current file in the explorer")
  end
}
