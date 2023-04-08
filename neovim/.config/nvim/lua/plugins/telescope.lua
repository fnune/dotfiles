local nmap = require("utils").nmap

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { ".git/*", ".cache/*" },
  },
}

require('telescope').load_extension('fzf')

nmap('<leader>f', ':Telescope find_files hidden=true<CR>')
nmap('<leader>F', ':Telescope live_grep<CR>')
