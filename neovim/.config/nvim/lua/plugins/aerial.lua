return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local m = require("mapx")
    m.nmap('<leader>T', '<cmd>AerialToggle!<cr>')

    local aerial = require("aerial")
    aerial.setup({})
  end,
}
