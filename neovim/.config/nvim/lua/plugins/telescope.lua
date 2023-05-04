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
      },
    },
    init = function()
      local m = require("mapx")

      m.nmap("<leader>f", ":Telescope find_files theme=ivy<CR>", { silent = true }, "Find files")
      m.nmap("<leader>F", ":Telescope live_grep theme=ivy<CR>", { silent = true }, "Find text in files")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
    init = function()
      local telescope = require("telescope")

      telescope.load_extension("fzf")
    end
  },
}
