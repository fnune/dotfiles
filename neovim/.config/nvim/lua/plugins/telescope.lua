return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    opts = {
      defaults = {
        file_ignore_patterns = { "%.git/*", "%.cache/*", "%.yarn/*" },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = { additional_args = { "--hidden" } },
        colorscheme = { enable_preview = true },
      },
      extensions = {
        smart_open = { match_algorithm = "fzf" },
      },
    },
    init = function()
      local m = require("mapx")
      m.nmap("<leader>f", ":Telescope find_files theme=ivy<CR>", { silent = true }, "Find files")
      m.nmap("<leader>F", ":Telescope live_grep theme=ivy<CR>", { silent = true }, "Find text in files")
      m.nmap("<leader>s", ":Telescope lsp_document_symbols theme=ivy<CR>", { silent = true },
        "Find symbols in the document")
      m.nmap("<leader>S", ":Telescope lsp_dynamic_workspace_symbols theme=ivy<CR>", { silent = true },
        "Find symbols across the workspace")
    end,
  },
}
