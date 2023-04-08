if not vim.fn.executable('node') then
  os.execute('volta install node')
end

if not vim.fn.executable('yarn') then
  os.execute('volta install yarn')
end
