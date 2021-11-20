vim.opt.timeoutlen = 500
vim.opt.shortmess = vim.opt.shortmess + "I"

lvim.colorscheme = "falcon"
lvim.leader = "space"

-- https://githubmemory.com/repo/ChristianChiarulli/LunarVim/issues/1705
lvim.format_on_save = false
lvim.autocommands.custom_groups = {
  {
    "BufWritePre",
    "*",
    ":silent lua vim.lsp.buf.formatting_seq_sync()",
  },
}

lvim.builtin.dashboard.active = false
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.telescope.defaults.prompt_prefix = " "
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "toml",
  "typescript",
  "yaml",
}

lvim.plugins = {
    { "AndrewRadev/tagalong.vim" },
    { "christoomey/vim-tmux-navigator" },
    { "felipec/vim-sanegx", event = "BufRead" },
    { "fenetikm/falcon" },
    { "rcarriga/vim-ultest" },
    { "tpope/vim-abolish" },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround", keys = {"c", "d", "y"} },
    { "vim-test/vim-test" },
}

vim.list_extend(lvim.lsp.override, { "pyright", "pylsp" })

local opts = {
  settings = {
    pylsp = {
      plugins = {
        pylsp_mypy = { enabled = true },
        pylsp_black = { enabled = true },
      }
    },
  }
}
-- https://github.com/LunarVim/LunarVim/issues/1978
require("lspconfig")["pylsp"].setup(opts)

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
  { exe = "isort", filetypes = { "python" } },
  { exe = "prettierd" },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8" },
  { exe = "eslint_d" },
}
