local constants = require("constants")
return {
  "LunarVim/bigfile.nvim",
  "antoinemadec/FixCursorHold.nvim",
  "b0o/SchemaStore.nvim",
  "christoomey/vim-tmux-navigator",
  "folke/trouble.nvim",
  "hrsh7th/vim-vsnip",
  "jxnblk/vim-mdx-js",
  "machakann/vim-swap",
  "matze/vim-move",
  "mbbill/undotree",
  "nvim-tree/nvim-web-devicons",
  "tpope/vim-abolish",
  "tpope/vim-dadbod",
  "tpope/vim-eunuch",
  "tpope/vim-repeat",
  { "folke/todo-comments.nvim", opts = {} },
  "tpope/vim-rhubarb",
  "tpope/vim-surround",
  "windwp/nvim-ts-autotag",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = true,
    init = function()
      vim.cmd [[highlight IndentBlanklineChar guifg=#242424 gui=nocombine]]
    end
  },
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
  {
    "kevinhwang91/nvim-bqf",
    lazy = true,
    ft = "qf",
    opts = {
      preview = { winblend = 0 } }
  },
  { "kristijanhusak/vim-dadbod-ui", lazy = true,  cmd = "DBUI" },
  { "nvim-lua/plenary.nvim",        priority = 51 },
  { "tversteeg/registers.nvim",     lazy = true },
}
