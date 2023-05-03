return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    init = function()
      local m = require("mapx")
      local dap = require("dap")
      local dap_widgets = require("dap.ui.widgets")

      local dap_mason = require("mason-nvim-dap")
      dap_mason.setup({
        ensure_installed = { "python", }
      })

      local dapvt = require("nvim-dap-virtual-text")
      dapvt.setup {}

      m.nname("<leader>d", "Debugging")
      m.nmap("<leader>db", function() dap.toggle_breakpoint() end, "Toggle breakpoint")
      m.nmap("<leader>dc", function() dap.set_breakpoint(vim.fn.input(("Breakpoint condition: "))) end,
        "Add a conditional breakpoint")
      m.nmap("<leader>dm", function() dap.set_breakpoint(nil, nil, vim.fn.input(("Log-point message: "))) end,
        "Add a log-point message")
      m.nmap("<leader>dh", function() dap_widgets.hover() end, "Show value")
      m.nmap("<leader>dp", function() dap_widgets.preview() end, "Preview value")

      m.nmap("<F1>", function() dap.disconnect() end, "Debugger: disconnect")
      m.nmap("<F4>", function() dap.run_last() end, "Debugger: run last")
      m.nmap("<F5>", function() dap.continue() end, "Debugger: continue")
      m.nmap("<F6>", function() dap.pause() end, "Debugger: pause")
      m.nmap("<F7>", function() dap.terminate() end, "Debugger: terminate")
      m.nmap("<F9>", function() dap.step_back() end, "Debugger: step back")
      m.nmap("<F10>", function() dap.step_over() end, "Debugger: step over")
      m.nmap("<F11>", function() dap.step_into() end, "Debugger: step into")
      m.nmap("<F12>", function() dap.step_out() end, "Debugger: step out")

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped",
        { text = "", texthl = "DiagnosticHint", linehl = "CursorLine", numhl = "CursorLine" })
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = " F1",
          play = " F5",
          pause = " F6",
          terminate = " F7",
          run_last = " F4",
          step_back = " F9",
          step_over = " F10",
          step_into = " F11",
          step_out = " F12",
        }
      }
    },
    init = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      local m = require("mapx")
      m.nmap("<leader>dd", function() dapui.toggle() end, "Toggle debugging view")

      vim.cmd('hi! link DapUIPlayPauseNC StatusLine')
      vim.cmd('hi! link DapUIRestartNC StatusLine')
      vim.cmd('hi! link DapUIStepBackNC StatusLine')
      vim.cmd('hi! link DapUIStepIntoNC StatusLine')
      vim.cmd('hi! link DapUIStepOutNC StatusLine')
      vim.cmd('hi! link DapUIStepOverNC StatusLine')
      vim.cmd('hi! link DapUIStopNC StatusLine')

      vim.cmd('hi! link DapUIPlayPause DiagnosticOk')
      vim.cmd('hi! link DapUIRestart DiagnosticOk')
      vim.cmd('hi! link DapUIStepBack Macro')
      vim.cmd('hi! link DapUIStepInto Macro')
      vim.cmd('hi! link DapUIStepOut Macro')
      vim.cmd('hi! link DapUIStepOver Macro')
      vim.cmd('hi! link DapUIStop DiagnosticError')
      vim.cmd('hi! link DapUIType Macro')
      vim.cmd('hi! link DapUIWinSelect DiagnosticHint')
    end
  },
  { "mfussenegger/nvim-dap-python",    lazy = true, dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text", lazy = true, dependencies = { "mfussenegger/nvim-dap" } },
}
