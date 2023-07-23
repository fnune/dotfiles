return {
  { "nvim-treesitter/playground" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = { disable_italics = true, disable_float_background = true },
    enabled = false,
    init = function()
      vim.opt.termguicolors = true

      vim.cmd.colorscheme("rose-pine-moon")

      vim.cmd([[hi! link EndOfBuffer BufferOffset]]) -- Hide ~ end-of-buffer characters

      -- Manually control italics:
      vim.cmd([[highlight @keyword.operator cterm=italic gui=italic]])
      vim.cmd([[highlight Comment cterm=italic gui=italic]])
      vim.cmd([[highlight Conditional cterm=italic gui=italic]])
      vim.cmd([[highlight Include cterm=italic gui=italic]])
      vim.cmd([[highlight Keyword cterm=italic gui=italic]])
      vim.cmd([[highlight Repeat cterm=italic gui=italic]])
    end
  },
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    enabled = true,
    config = function()
      vim.opt.termguicolors = true

      local colors = require("vscode.colors").get_colors()
      local vscode = require("vscode")

      local function italic(color)
        return { fg = color, bg = "NONE", italic = true }
      end

      vscode.setup({
        disable_nvimtree_bg = true,
        group_overrides = {
          ["@comment"] = italic(colors.vscGray),
          ["@conditional"] = italic(colors.vscPink),
          ["@include"] = italic(colors.vscPink),
          ["@keyword"] = italic(colors.vscPink),
          ["@keyword.operator"] = italic(colors.vscBlue),
          ["@repeat"] = italic(colors.vscPink),
          ["Comment"] = italic(colors.vscGray),
          ["Conditional"] = italic(colors.vscPink),
          ["Include"] = italic(colors.vscPink),
          ["Keyword"] = italic(colors.vscPink),
          ["Pmenu"] = { fg = colors.vscPopupFront, bg = "NONE" },
          ["Repeat"] = italic(colors.vscPink),
          ["SpecialComment"] = italic(colors.vscGray),
        },
      })

      vscode.load()
    end,
  }
}
