return {
  "williamboman/mason-lspconfig.nvim",
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- LSPs
        "clangd",
        "eslint",
        "eslint_d",
        "jsonls",
        "lua_ls",
        "pyright",
        "rnix",
        "ruff_lsp",
        "rust_analyzer",
        "taplo",
        "tsserver",
        "yamlls",
        -- Formatters
        "stylua",
        "shellcheck",
        "prettierd",
        "black",
        "blackd-client",
        -- Linters
        "sqlfluff",
        "stylelint",
      },
      auto_update = true,
    },
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "b0o/SchemaStore.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local m = require("mapx")
      local lspconfig = require("lspconfig")

      local mason = require("mason")
      mason.setup({})

      local cmp_lsp = require("cmp_nvim_lsp")

      local lsp_capabilities = cmp_lsp.default_capabilities()
      local lsp_attach = function(_, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        m.nmap("K", function()
          vim.lsp.buf.hover()
        end, bufopts, "Show documentation")
        m.nmap("<leader>k", function()
          vim.diagnostic.goto_prev()
        end, "Previous diagnostic")
        m.nmap("<leader>j", function()
          vim.diagnostic.goto_next()
        end, "Next diagnostic")
        m.nmap("<leader>r", function()
          vim.lsp.buf.rename()
        end, bufopts, "Rename symbol")

        m.nname("g", "Go to")
        m.nmap("gD", function()
          vim.lsp.buf.declaration()
        end, bufopts, "Go to declaration")
        m.nmap("gd", function()
          vim.lsp.buf.definition()
        end, bufopts, "Go to definition")
        m.nmap("gr", function()
          vim.lsp.buf.references()
        end, bufopts, "Show references")

        m.nname("a", "Code actions")
        m.nmap("<leader>ac", function()
          vim.lsp.buf.code_action()
        end, "Apply code action (normal)")
        m.xmap("<leader>ac", function()
          vim.lsp.buf.code_action()
        end, "Apply code action (visual)")
      end

      local common = {
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      }

      lspconfig.gdscript.setup(common)

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup_handlers({
        function(server)
          lspconfig[server].setup(common)
        end,
        ["tsserver"] = function(server)
          lspconfig[server].setup(vim.tbl_deep_extend("force", common, {
            init_options = {
              hostInfo = "neovim",
              preferences = { importModuleSpecifierPreference = "non-relative" },
            },
            handlers = {
              ["textDocument/formatting"] = function()
                -- noop: let prettier do this
              end,
            },
          }))
        end,
        ["jsonls"] = function(server)
          lspconfig[server].setup(vim.tbl_deep_extend("force", common, {
            settings = { json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } } },
          }))
        end,
        ["yamlls"] = function(server)
          lspconfig[server].setup(vim.tbl_deep_extend("force", common, {
            settings = { yaml = { schemas = require("schemastore").yaml.schemas() } },
          }))
        end,
        ["lua_ls"] = function(server)
          lspconfig[server].setup(vim.tbl_deep_extend("force", common, {
            settings = { Lua = { diagnostics = { globals = { "vim" } } } },
          }))
        end,
        ["pyright"] = function(server)
          lspconfig[server].setup(vim.tbl_deep_extend("force", common, {
            root_dir = function()
              return vim.fn.getcwd()
            end,
            handlers = {
              ["textDocument/publishDiagnostics"] = function()
                -- noop: I get enough diagnostics from Ruff and mypy.
              end,
            },
            settings = {
              python = {
                analysis = {
                  diagnosticMode = "off",
                  typeCheckingMode = "off",
                },
              },
            },
          }))
        end,
      })

      local constants = require("constants")
      local handlers = vim.lsp.handlers
      handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = constants.floating_border })
      handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = constants.floating_border })
      vim.diagnostic.config({ float = { border = constants.floating_border } })

      local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = "󰋼 " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
  },
}
