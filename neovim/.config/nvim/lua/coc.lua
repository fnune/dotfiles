local function read_all(file)
  local file_open = assert(io.open(file, "rb"))
  local content = file_open:read("*all")
  file_open:close()
  return content
end

vim.cmd(read_all(os.getenv("HOME") .. "/.config/nvim/coc.vim"))
