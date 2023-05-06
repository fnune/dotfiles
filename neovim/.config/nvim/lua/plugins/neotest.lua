return {
  { "nvim-neotest/neotest-jest",   lazy = true },
  { "nvim-neotest/neotest-python", lazy = true },
  { "rouge8/neotest-rust",         lazy = true },
  {
    "nvim-neotest/neotest",
    lazy = true,
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

      vim.cmd("hi! link NeotestAdapterName Macro")
      vim.cmd("hi! link NeotestDir Normal")
      vim.cmd("hi! link NeotestExpandMarker StatusLine")
      vim.cmd("hi! link NeotestFailed DiagnosticError")
      vim.cmd("hi! link NeotestFile Normal")
      vim.cmd("hi! link NeotestFocused Underlined")
      vim.cmd("hi! link NeotestIndent StatusLine")
      vim.cmd("hi! link NeotestMarked DiagnosticHint")
      vim.cmd("hi! link NeotestNamespace Macro")
      vim.cmd("hi! link NeotestPassed DiagnosticOk")
      vim.cmd("hi! link NeotestRunning DiagnosticWarn")
      vim.cmd("hi! link NeotestSkipped StatusLine")
      vim.cmd("hi! link NeotestTarget Macro")
      vim.cmd("hi! link NeotestTest Boolean")
      vim.cmd("hi! link NeotestWinSelect Macro")
      vim.cmd("hi! link NeotestUnknown StatusLine")
    end
  },
}
