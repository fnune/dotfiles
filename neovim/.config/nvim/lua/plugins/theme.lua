return {
  { "nvim-treesitter/playground" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = { disable_italics = true, disable_float_background = true },
    init = function()
      vim.opt.termguicolors = true
      vim.cmd([[colorscheme rose-pine-moon]])

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
}
