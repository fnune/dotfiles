return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local treesitter_configs = require("nvim-treesitter.configs")

      treesitter_configs.setup {
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        autotag = { enable = true }, -- See windwp/nvim-ts-autotag
      }
    end,
  },
  { "nvim-treesitter/completion-treesitter", dependencies = { "nvim-treesitter/nvim-treesitter" } },
}
