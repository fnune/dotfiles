local nmap = require("utils").nmap

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { ".git/*", ".cache/*" },
  },
  pickers = {
    find_files = { hidden = true },
    live_grep = { additional_args = { "--hidden" } },
  },
}

require('telescope').load_extension('fzf')

nmap('<leader>f', ':Telescope find_files theme=ivy<CR>')
nmap('<leader>F', ':Telescope live_grep theme=ivy<CR>')
