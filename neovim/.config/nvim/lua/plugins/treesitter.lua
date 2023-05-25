return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      local treesitter_configs = require("nvim-treesitter.configs")

      treesitter_configs.setup {
        ensure_installed = "all",
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },                                       -- See windwp/nvim-ts-autotag
        context_commentstring = { enable = true, enable_autocmd = false }, -- See nvim-ts-context-commentstring
      }
    end,
  },
  { "nvim-treesitter/completion-treesitter", dependencies = { "nvim-treesitter/nvim-treesitter" } },
}
