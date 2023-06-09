return {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("hlslens").setup()

    local opts = { noremap = true, silent = true }

    local m = require("mapx")
    m.nmap("n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
    m.nmap("N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
    m.nmap("*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
    m.nmap("#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
    m.nmap("g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
    m.nmap("g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
  end,
}
