return {
  { "nvim-neotest/neotest-jest" },
  { "nvim-neotest/neotest-python" },
  { "rouge8/neotest-rust" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require('neotest-jest')({}),
          require('neotest-python')({}),
          require('neotest-rust')({}),
        },
      })
    end,
    init = function()
      local m = require("mapx")

      m.nname("<leader>t", "Tests")
      m.nmap("<leader>ts", ":lua require('neotest').run.run()<cr>", { silent = true }, "Run the closest test")
      m.nmap("<leader>ta", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { silent = true }, "Run all tests")
      m.nmap("<leader>ds", ":lua require('neotest').run.run({ strategy = 'dap' })<cr>", { silent = true },
        "Debug the closest test")
      m.nmap("<leader>T", ":lua require('neotest').summary.toggle()<cr>", { silent = true },
        "Toggle the test summary view")
    end
  },
}
