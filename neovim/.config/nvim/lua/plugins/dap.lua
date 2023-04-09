local dap, dapui = require("dap"), require("dapui")

dapui.setup {}

require("nvim-dap-virtual-text").setup {}

vim.keymap.set('n', '<leader>D', function() require('dapui').toggle() end)

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)

vim.keymap.set('n', '<leader>B', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>cB', function()
  require('dap').set_breakpoint(vim.fn.input(('Breakpoint condition: ')))
end)

vim.keymap.set({ 'n', 'v' }, '<leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<leader>dp', function()
  require('dap.ui.widgets').preview()
end)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = 'ﳁ', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticHint', linehl = 'CursorLine', numhl = 'CursorLine' })
