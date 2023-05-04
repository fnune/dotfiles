return {
  "pwntester/octo.nvim",
  opts = {
    mappings = {
      submit_win = {
        approve_review = { lhs = "<M-a>", desc = "approve review" },
        comment_review = { lhs = "<M-m>", desc = "comment review" },
        request_changes = { lhs = "<M-r>", desc = "request changes review" },
        close_review_tab = { lhs = "<M-c>", desc = "close review tab" },
      },
    },
  },
  init = function()
    vim.cmd('hi! link OctoBubble Normal')
  end
}
