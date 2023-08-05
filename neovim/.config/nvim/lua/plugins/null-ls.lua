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
      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
          filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end

      local null_ls = require("null-ls")
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
        on_attach = on_attach,
        temp_dir = "/tmp",
      })
    end,
  },
}
