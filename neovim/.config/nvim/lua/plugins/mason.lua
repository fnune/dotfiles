return {
  "williamboman/mason-lspconfig.nvim",
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      local m = require("mapx")
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({})

      mason_lspconfig.setup({
        ensure_installed = {
          "bashls",
          "clangd",
          "eslint",
          "jsonls",
          "lua_ls",
          "pyright",
          "ruff_lsp",
          "rust_analyzer",
          "sqlls",
          "taplo",
          "tsserver",
          "yamlls",
        },
      })

      local cmp_lsp = require("cmp_nvim_lsp")

      local lsp_capabilities = cmp_lsp.default_capabilities()
      local lsp_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        m.nmap("K", function() vim.lsp.buf.hover() end, bufopts, "Show documentation")
        m.nmap("<leader>k", function() vim.diagnostic.goto_prev() end, "Previous diagnostic")
        m.nmap("<leader>j", function() vim.diagnostic.goto_next() end, "Next diagnostic")
        -- m.nmap("<leader>r", function() vim.lsp.buf.rename() end, bufopts, "Rename symbol")
        m.nmap("<leader>p", function() vim.lsp.buf.format { async = true } end, bufopts, "Format document")

        m.nname("g", "Go to")
        m.nmap("gD", function() vim.lsp.buf.declaration() end, bufopts, "Go to declaration")
        m.nmap("gd", function() vim.lsp.buf.definition() end, bufopts, "Go to definition")
        m.nmap("gr", function() vim.lsp.buf.references() end, bufopts, "Show references")

        m.nname("a", "Code actions")
        m.nmap("<leader>ac", function() vim.lsp.buf.code_action() end, "Apply code action (normal)")
        m.xmap("<leader>ac", function() vim.lsp.buf.code_action() end, "Apply code action (visual)")
      end

      local common = {
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        handlers = {
          ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
          })
        }
      }

      mason_lspconfig.setup_handlers({
        function(server)
          lspconfig[server].setup(common)
        end,
        ["jsonls"] = function(server)
          lspconfig[server].setup({
            settings = { json = { schemas = require('schemastore').json.schemas(), validate = { enable = true } } },
            unpack(common),
          })
        end,
        ["yamlls"] = function(server)
          lspconfig[server].setup({
            settings = { yaml = { schemas = require('schemastore').yaml.schemas() } },
            unpack(common),
          })
        end,
        ["pyright"] = function(server)
          lspconfig[server].setup({
            root_dir = function() return vim.fn.getcwd() end,
            handlers = {
              ["textDocument/publishDiagnostics"] = function()
                -- noop: I get enough diagnostics from Ruff and mypy.
              end,
              unpack(common.handlers),
            },
            settings = {
              python = {
                analysis = {
                  diagnosticMode = "off",
                  typeCheckingMode = "off",
                },
              }
            },
            unpack(common),
          })
        end,
      })
    end,
  },
}
