local constants = require("constants")
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
  "tpope/vim-abolish",
  "tpope/vim-dadbod",
  "tpope/vim-eunuch",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "windwp/nvim-ts-autotag",
  { "folke/neodev.nvim",        opts = { library = { plugins = { "neotest" }, types = true } }, priority = 51 },
  {
    "b0o/mapx.nvim",
    priority = 51,
    opts = { whichkey = false },
  },
  {
    "folke/which-key.nvim",
    enabled = false,
    opts = {
      window = { border = constants.floating_border, padding = { 0, 0, 0, 0 } } }
  },
  { "kevinhwang91/nvim-bqf",        lazy = true,                                                     ft = "qf" },
  { "kristijanhusak/vim-dadbod-ui", lazy = true,                                                     cmd = "DBUI" },
  { "lewis6991/gitsigns.nvim",      config = true },
  { "nvim-lua/plenary.nvim",        priority = 51 },
  { "ray-x/lsp_signature.nvim",     opts = { handler_opts = { border = constants.floating_border } } },
  { "tversteeg/registers.nvim",     lazy = true },
}
