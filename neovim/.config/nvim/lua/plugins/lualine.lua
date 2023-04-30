local gps = require("nvim-gps")

gps.setup({})

local lualine = require("lualine")

lualine.setup({
  theme = "auto",
  options = {
    globalstatus = true,
    section_separators = { "", "" },
    component_separators = { "│", "│" },
  }
})
