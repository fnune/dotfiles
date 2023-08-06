return {
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim" },
    automatic_installation = { exclude = { "mypy" } },
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    disable_commands = true,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.code_actions.shellcheck,
          null_ls.builtins.code_actions.statix,
          null_ls.builtins.diagnostics.deadnix,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.gdlint,
          null_ls.builtins.diagnostics.jsonlint,
          null_ls.builtins.diagnostics.mypy.with({ extra_args = { "--ignore-missing-imports" } }),
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.formatting.alejandra,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.cbfmt,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.gdformat,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.ruff,
          null_ls.builtins.formatting.rustfmt,
          null_ls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
          null_ls.builtins.formatting.stylelint,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
        temp_dir = "/tmp",
      })
    end,
  },
}
