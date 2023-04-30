local winbar = require("winbar")

winbar.setup({
  enabled = true,
  exclude_filetype = {
    "NeogitStatus",
    "NeogitCommitMessage",
    "NvimTree",
    "undotree",
  },
})
