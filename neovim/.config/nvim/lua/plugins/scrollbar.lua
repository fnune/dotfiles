return {
  "petertriho/nvim-scrollbar",
  config = function()
    local colors = require("vscode.colors").get_colors()
    require("scrollbar").setup(
      {
        handle = {
          color = colors.vscGray,
        },
        marks = {
          Search = { color = colors.vscYellowOrange },
          Error = { color = colors.vscRed },
          Warn = { color = colors.vscOrange },
          Info = { color = colors.vscLightBlue },
          Hint = { color = colors.vscBlue },
          Misc = { color = colors.vscViolet },
        }
      }
    )
  end,
}
