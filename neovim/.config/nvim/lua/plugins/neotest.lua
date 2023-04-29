local nmap = require("utils").nmap

nmap('<leader>ts', ':lua require("neotest").run.run()<cr>')
nmap('<leader>ta', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>')

nmap('<leader>ds', ':lua require("neotest").run.run({ strategy = "dap" })<cr>')

nmap('<leader>T', ':lua require("neotest").summary.toggle()<cr>')
