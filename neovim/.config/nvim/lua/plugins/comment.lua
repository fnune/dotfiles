return {
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      local comment = require("Comment")
      local comment_ts = require("ts_context_commentstring.integrations.comment_nvim")
      comment.setup({ pre_hook = comment_ts.create_pre_hook() })
    end
  }
}
