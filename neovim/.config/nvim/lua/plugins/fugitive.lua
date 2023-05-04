return {
  "tpope/vim-fugitive",
  init = function()
    local m = require("mapx")

    m.nmap("<leader>Db", ":Git blame<cr>", { silent = true }, "Open git blame view")
  end
}
