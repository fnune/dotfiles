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
	{ name = "memfault-pg-local", url = "postgresql://memfault:memfault@localhost:5432/memfault_db" },
	{ name = "memfault-tsdb-local", url = "postgresql://memfault:memfault@localhost:5433/memfault_db" },
}

local lint = require("lint")

local severities = {
	error = vim.diagnostic.severity.ERROR,
	warning = vim.diagnostic.severity.WARN,
	note = vim.diagnostic.severity.HINT,
}

lint.linters_by_ft.python = { "mypy_memfault" }
lint.linters.mypy_memfault = {
	cmd = home("/Development/memfault/.lint/mypy.sh"),
	stdin = false,
	append_fname = true,
	args = {},
	stream = "stdout",
	ignore_exitcode = true,
	env = nil,
	parser = function(output, bufnr)
		local pattern = "([^:]+):(%d+): (.+) %[(.-)/(.-)%]"
		local diagnostics = {}

		for line in output:gmatch("[^\r\n]+") do
			for _, lnum, message, severity, code in string.gmatch(line, pattern) do
				table.insert(diagnostics, {
					bufnr = bufnr,
					lnum = tonumber(lnum) - 1,
					col = 0,
					end_lnum = tonumber(lnum) - 1,
					end_col = 0,
					message = message,
					severity = severities[severity],
					source = "mypy",
					code = code,
				})
			end
		end

		return diagnostics
	end,
}
