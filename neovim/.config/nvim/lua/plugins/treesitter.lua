return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    config = function()
      local treesitter_configs = require("nvim-treesitter.configs")

      treesitter_configs.setup {
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
      }
    end,
  },
  { "nvim-treesitter/completion-treesitter", lazy = true, dependencies = { "nvim-treesitter/nvim-treesitter" } },
}
