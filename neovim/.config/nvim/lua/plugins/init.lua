return {
  "antoinemadec/FixCursorHold.nvim",
  "b0o/SchemaStore.nvim",
  "christoomey/vim-tmux-navigator",
  { "folke/todo-comments.nvim", opts = {} },
  "folke/trouble.nvim",
  "hrsh7th/vim-vsnip",
  "machakann/vim-swap",
  "matze/vim-move",
  "mbbill/undotree",
  "nvim-tree/nvim-web-devicons",
  {
    "smjonas/inc-rename.nvim",
    dependencies = { "stevearc/dressing.nvim" },
    config = function()
      local inc_rename = require("inc_rename")
      inc_rename.setup({ input_buffer_type = "dressing" })

      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })
    end,
  },
  "tpope/vim-abolish",
  "tpope/vim-dadbod",
  "tpope/vim-eunuch",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "windwp/nvim-ts-autotag",
  { "folke/neodev.nvim",        opts = {}, priority = 51 },
  {
    "b0o/mapx.nvim",
    priority = 51,
    opts = {
      whichkey = true }
  },
  { "folke/which-key.nvim",         opts = { window = { border = "single", padding = { 0, 0, 0, 0 } } } },
  { "kevinhwang91/nvim-bqf",        lazy = true,                                                        ft = "qf" },
  { "kristijanhusak/vim-dadbod-ui", lazy = true,                                                        cmd = "DBUI" },
  { "lewis6991/gitsigns.nvim",      config = true },
  { "nvim-lua/plenary.nvim",        priority = 51 },
  { "ray-x/lsp_signature.nvim",     opts = {} },
  { "tversteeg/registers.nvim",     lazy = true },
}
