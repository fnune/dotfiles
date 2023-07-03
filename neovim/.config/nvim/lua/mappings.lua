-- Move to the first non-blank character of the line
vim.api.nvim_set_keymap("n", "0", "^", { noremap = true })

-- Disable the Q command
vim.api.nvim_set_keymap("n", "Q", "<nop>", { noremap = true })

-- Move by display lines, not actual lines
vim.api.nvim_set_keymap("n", "j", "gj", {})
vim.api.nvim_set_keymap("n", "k", "gk", {})

-- Center the buffer after scrolling up or down
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", {})
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", {})

-- Select last pasted text
vim.api.nvim_set_keymap("n", "gp", "`[v`]", {})

-- Clear hlsearch highlights
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>nohlsearch<cr>", {})

-- Exit insert mode in the terminal
vim.api.nvim_set_keymap("t", "<C-t><esc>", "<C-\\><C-n>", {})
