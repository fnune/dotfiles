local null_ls = require("null-ls")
local null_ls_mason = require("mason-null-ls")
local ts_node_action = require("ts-node-action")

ts_node_action.setup({})

null_ls_mason.setup({ automatic_installation = true })
null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.code_actions.ts_node_action,
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
    null_ls.builtins.diagnostics.stylelint,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.cbfmt,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.ruff,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
    null_ls.builtins.formatting.stylelint,
  }
})
