return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    local colors = require('vscode.colors').get_colors()

    require('vscode').setup({
      disable_nvimtree_bg = true,
      group_overrides = {
        ["@comment"] = { fg = colors.vscGray, italic = true },
        Comment = { fg = colors.vscGray, italic = true },
      }
    })

    require('vscode').load()
  end,
  init = function()
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
  end
}
