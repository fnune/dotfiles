local dap, dapui = require("dap"), require("dapui")

dapui.setup {}

require("nvim-dap-virtual-text").setup {}

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

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
