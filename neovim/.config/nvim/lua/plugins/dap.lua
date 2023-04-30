local dap = require("dap")

vim.keymap.set('n', '<leader>do', function() require('dapui').toggle() end)
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>cB', function()
  require('dap').set_breakpoint(vim.fn.input(('Breakpoint condition: ')))
end)
vim.keymap.set('n', '<leader>mB', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input(('Logpoint message: ')))
end)
vim.keymap.set({ 'n', 'v' }, '<leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<leader>dp', function()
  require('dap.ui.widgets').preview()
end)

local dapvt = require("nvim-dap-virtual-text")
dapvt.setup {}

local dapui = require("dapui")
dapui.setup {
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
}

vim.keymap.set('n', '<F1>', function() require('dap').disconnect() end)
vim.keymap.set('n', '<F4>', function() require('dap').run_last() end)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').pause() end)
vim.keymap.set('n', '<F7>', function() require('dap').terminate() end)
vim.keymap.set('n', '<F9>', function() require('dap').step_back() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = 'ﳁ', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticHint', linehl = 'CursorLine', numhl = 'CursorLine' })

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
