vim.opt.termguicolors = true
vim.opt.background = 'dark'

local colors = require('vscode.colors').get_colors()

require('vscode').setup({
  group_overrides = {
    ["@comment"] = { fg = colors.vscGray, italic = true },
    Comment = { fg = colors.vscGray, italic = true },
  }
})

require('vscode').load()
