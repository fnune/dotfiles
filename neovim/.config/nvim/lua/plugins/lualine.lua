local lualine = require("lualine")

local colors = require("vscode.colors").get_colors()
local theme = require("lualine.themes.vscode")

theme.normal.a.bg = colors.vscMediumBlue
theme.normal.b.fg = colors.vscMediumBlue
theme.normal.c.bg = colors.vscBlack

lualine.setup({
  options = {
    component_separators = { "│", "│" },
    globalstatus = true,
    section_separators = { "", "" },
    theme = theme,
  }
})
