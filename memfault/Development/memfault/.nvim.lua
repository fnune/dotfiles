local dap = require("dap")
local dap_python = require('dap-python')

local function home(path)
  return os.getenv("HOME") .. path
end

local memfault_python_bin = home("/.mambaforge/envs/memfault/bin/python")

dap_python.setup(memfault_python_bin)
dap_python.test_runner = 'pytest'

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  -- Grab this from https://github.com/Microsoft/vscode-chrome-debug and
  -- build it with npm install && npm run build
  args = { home("/Development/vscode-chrome-debug/out/src/chromeDebug.js") }
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

local neotest = require("neotest")

neotest.setup({
  adapters = {
    require('neotest-jest')({ jestCommand = "yarn workspace @memfault/app-frontend test:jest" }),
    require('neotest-python')({ python = memfault_python_bin }),
  }
})