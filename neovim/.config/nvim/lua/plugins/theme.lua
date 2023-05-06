return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = { disable_italics = true },
    init = function()
      vim.cmd([[colorscheme rose-pine]])
    end
  }
}
