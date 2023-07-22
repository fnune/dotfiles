return {
  "Shatur/neovim-session-manager",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local config = require("session_manager.config")
    local session_manager = require("session_manager")

    session_manager.setup({
      sessions_dir = require("plenary.path"):new(vim.fn.stdpath("data"), "sessions"),
      autoload_mode = config.AutoloadMode.CurrentDir,
      autosave_last_session = true,
      autosave_ignore_not_normal = false, -- Save the session even if it's empty
      autosave_ignore_filetypes = {
        "gitcommit",
        "gitrebase",
      },
      autosave_ignore_buftypes = {},
      max_path_length = 80,
    })
  end
}
