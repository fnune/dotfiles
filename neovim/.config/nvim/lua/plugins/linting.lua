return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d", "stylelint" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d", "stylelint" },
      json = { "jsonlint" },
      python = { "mypy" },
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
      css = { "stylelint" },
      scss = { "stylelint" },
    }
  end,

  init = function()
    local lint = require("lint")
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
