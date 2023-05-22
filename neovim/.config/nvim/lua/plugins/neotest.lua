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
        quickfix = { open = false },
        output = { open_on_run = false },
      })
    end,
    init = function()
      local m = require("mapx")

      local function prompt_args()
        local args = {}
        for arg in string.gmatch(vim.fn.input("Extra arguments: "), "[^%s]+") do
          table.insert(args, arg)
        end
        return args
      end

      m.nname("<leader>t", "Tests")
      m.nmap("<leader>ts", function() require("neotest").run.run() end, { silent = true }, "Run the closest test")
      m.nmap("<leader>ta", function() require("neotest").run.run(vim.fn.expand("%")) end, { silent = true },
        "Run all tests")
      m.nmap("<leader>tS", function() require("neotest").run.run({ extra_args = prompt_args() }) end,
        { silent = true },
        "Run the closest test with extra arguments")
      m.nmap("<leader>tA",
        function() require("neotest").run.run({ vim.fn.expand("%"), extra_args = prompt_args() }) end,
        { silent = true },
        "Run all tests with extra arguments")
      m.nmap("<leader>ds", function() require("neotest").run.run({ strategy = "dap" }) end, { silent = true },
        "Debug the closest test")
      m.nmap("<leader>to", function() require("neotest").output_panel.toggle() end, { silent = true },
        "Toggle the test output panel")

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
