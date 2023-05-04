local modules = {
  "leader",
  "system",
  "settings",
  "plugins",
  "mappings",
  "theme",
}

for _, module in pairs(modules) do
  require(module)
end

local m = require("mapx")

m.nmap("<leader>R", function()
  for _, module in pairs(modules) do
    package.loaded[module] = nil
  end

  dofile(vim.env.MYVIMRC)

  vim.cmd("echo '↻ Reloaded " .. vim.env.MYVIMRC .. "'")
end, "Reload the configuration")
