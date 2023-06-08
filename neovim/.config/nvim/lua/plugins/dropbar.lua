return {
  "Bekaboo/dropbar.nvim",
  enabled = function()
    return vim.fn.has("nvim-0.10.0") == 1
  end,
  opts = {
    icons = {
      ui = {
        bar = { separator = "  " },
      },
    },
  },
}
