return {
  "RRethy/vim-illuminate",
  config = function()
    local illuminate = require("illuminate")
    illuminate.configure({ delay = 300 })

    vim.cmd([[
      hi! link IlluminatedWordText Visual
      hi! link IlluminatedWordRead Visual
      hi! link IlluminatedWordWrite Visual
    ]])
  end,
}
