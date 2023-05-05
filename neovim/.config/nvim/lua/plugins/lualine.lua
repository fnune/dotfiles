return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "Mofiqul/vscode.nvim" },
  opts = {
  },
  config = function()
    local lualine = require("lualine")
    local theme = require("lualine.themes.vscode")

    lualine.setup({
      options = {
        component_separators = { "│", "│" },
        globalstatus = true,
        section_separators = { "", "" },
        theme = theme,
      },
      -- See defaults: https://github.com/nvim-lualine/lualine.nvim#default-configuration
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'g:coc_status', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    })
  end,
  init = function()
    local colors = require("vscode.colors").get_colors()
    local theme = require("lualine.themes.vscode")

    theme.normal.a.bg = colors.vscMediumBlue
    theme.normal.b.fg = colors.vscMediumBlue
    theme.normal.c.bg = colors.vscBlack
  end
}
