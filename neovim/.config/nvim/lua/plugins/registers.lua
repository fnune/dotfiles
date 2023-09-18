return {
  "tversteeg/registers.nvim",
  name = "registers",
  keys = {
    { "\"",    mode = { "n", "v" } },
    { "<C-R>", mode = "i" }
  },
  cmd = "Registers",
  config = function()
    local constants = require("constants")
    local registers = require("registers")

    registers.setup({
      window = {
        border = constants.floating_border,
        transparency = 0,
        highlight_cursorline = false,
      },
    })
  end,
}
