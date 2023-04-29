local dap = require("dap")
local dap_python = require('dap-python')

dap_python.setup('~/.mambaforge/envs/memfault/bin/python')
dap_python.test_runner = 'pytest'
vim.api.nvim_set_keymap('n', '<leader>ds', ':lua require("dap-python").test_method()<CR>', { noremap = true, silent = true })

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  -- Grab this from https://github.com/Microsoft/vscode-chrome-debug and
  -- build it with npm install && npm run build
  args = { os.getenv("HOME") .. "/Development/vscode-chrome-debug/out/src/chromeDebug.js" }
}

-- To attach, launch Chromium with:
-- flatpak run org.chromium.Chromium --remote-debugging-port=9222
dap.configurations.typescriptreact = {
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  }
}

vim.o.makeprg = "./.git/hooks/pre-commit"
