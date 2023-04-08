local nmap = require("utils").nmap

local function read_all(file)
  local file_open = assert(io.open(file, "rb"))
  local content = file_open:read("*all")
  file_open:close()
  return content
end

vim.cmd(read_all(os.getenv("HOME") .. "/.config/nvim/lua/plugins/coc.vim"))

function RunTests(all)
  if vim.bo.filetype == 'python' then
    if all then
      vim.cmd('CocCommand pyright.fileTest')
      vim.api.nvim_input('<C-j><C-w>L')
    else
      vim.cmd('CocCommand pyright.singleTest')
      vim.api.nvim_input('<C-j><C-w>L')
    end
  else
    if string.find(vim.bo.filetype, 'typescript') then
      if all then
        vim.cmd('CocCommand jest.fileTest')
      else
        vim.cmd('CocCommand jest.singleTest')
      end
    end
  end
end

nmap('<leader>ts', ':lua RunTests(false)<CR>')
nmap('<leader>ta', ':lua RunTests(true)<CR>')
