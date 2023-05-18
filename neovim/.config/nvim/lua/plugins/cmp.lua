return {
  "hrsh7th/nvim-cmp",
  dependencies = { "onsails/lspkind.nvim", "hrsh7th/vim-vsnip" },
  config = function()
    local lspkind = require("lspkind")
    local cmp = require("cmp")

    cmp.setup({
      snippet = { expand = function(args) vim.fn["vsnip#anonymous"](args.body) end },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
      }, { name = "buffer" }),
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
      }),
      formatting = { format = lspkind.cmp_format({}) },
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      },
    })
  end,
}
