local dap = require("dap")
local dap_python = require('dap-python')

local memfault_python_env = '/home/fausto/.mambaforge/envs/memfault/bin/python'

dap_python.setup(memfault_python_env)
dap_python.test_runner = 'pytest'

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

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      args = { "--log-level", "DEBUG" },
      runner = "pytest",
      python = memfault_python_env,
    }),
    require('neotest-jest')({
      jestCommand = "yarn workspace @memfault/app-frontend test:jest",
    }),
  }
})
