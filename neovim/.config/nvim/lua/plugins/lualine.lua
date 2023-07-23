return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        component_separators = { "│", "│" },
        globalstatus = true,
        section_separators = { "", "" },
        theme = "vscode",
      },
      -- See defaults: https://github.com/nvim-lualine/lualine.nvim#default-configuration
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
    })
  end,
}
