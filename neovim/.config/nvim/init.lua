local modules = {
  "system",
  "settings",
  "mappings",
  "plugins",
  "theme",
  "statusline",
}

for _, module in pairs(modules) do
  require(module)
end

vim.keymap.set("n", "<leader>R", function()
  for _, module in pairs(modules) do
    package.loaded[module] = nil
  end

  dofile(vim.env.MYVIMRC)

  vim.cmd("echo '↻ Reloaded " .. vim.env.MYVIMRC .. "'")
end)
