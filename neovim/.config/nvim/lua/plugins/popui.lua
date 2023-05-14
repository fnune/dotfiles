return {
  "hood/popui.nvim",
  config = function()
    vim.ui.select = require("popui.ui-overrider")
    vim.g.popui_border_style = "rounded"
  end,
}
