local function home(path)
  return os.getenv("HOME") .. path
end

local memfault_python_bin = home("/.mambaforge/envs/memfault/bin/python")

local neotest = require("neotest")

neotest.setup_project(vim.loop.cwd(), {
  adapters = {
    require("neotest-jest")({ jestCommand = "yarn workspace @memfault/app-frontend test:jest" }),
    require("neotest-python")({ python = memfault_python_bin, args = { "-W", "ignore", "-vv" } }),
  },
})

vim.o.makeprg = "./.git/hooks/pre-commit"

vim.g.dbs = {
  { name = "memfault-pg-local",   url = "postgresql://memfault:memfault@localhost:5432/memfault_db" },
  { name = "memfault-tsdb-local", url = "postgresql://memfault:memfault@localhost:5433/memfault_db" },
}
