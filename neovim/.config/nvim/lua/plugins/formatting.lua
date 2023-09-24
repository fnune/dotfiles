return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    local formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_fix", { "black" } },
      rust = { "rustfmt" },
    }

    local prettier_supported = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "markdown",
      "markdown.mdx",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    }

    local prettier = { { "prettierd", "prettier" } }

    for _, vim_ft in ipairs(prettier_supported) do
      formatters_by_ft[vim_ft] = prettier
    end

    conform.setup({
      formatters_by_ft = formatters_by_ft,
      format_on_save = { lsp_fallback = true },
    })
  end,
  init = function()
    local m = require("mapx")
    local conform = require("conform")

    m.nmap("<leader>p", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { silent = true }, "Format document")
  end,
}
