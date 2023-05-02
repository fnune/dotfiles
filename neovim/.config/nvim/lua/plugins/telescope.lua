local m = require("mapx")
local telescope = require("telescope")

telescope.setup {
  defaults = {
    file_ignore_patterns = { ".git/*", ".cache/*" },
  },
  pickers = {
    find_files = { hidden = true },
    live_grep = { additional_args = { "--hidden" } },
  },
}

telescope.load_extension("fzf")

m.nmap("<leader>f", ":Telescope find_files theme=ivy<CR>", "Find files")
m.nmap("<leader>F", ":Telescope live_grep theme=ivy<CR>", "Find text in files")
