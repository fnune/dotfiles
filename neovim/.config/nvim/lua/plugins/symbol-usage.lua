local SymbolKind = vim.lsp.protocol.SymbolKind

return {
  "Wansmer/symbol-usage.nvim",
  event = "BufReadPre",
  opts = {
    request_pending_text = false,
    vt_position = "end_of_line",
    kinds = {
      SymbolKind.Class,
      SymbolKind.Enum,
      SymbolKind.Function,
      SymbolKind.Method,
      SymbolKind.Variable,
    },
  },
}
