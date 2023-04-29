local neogit = require('neogit')
local nmap = require("utils").nmap

neogit.setup {
  disable_builtin_notifications = true,
  integrations = { diffview = true },
  kind = "vsplit",
}

nmap('<leader>g', '<cmd>Neogit<cr>')
