local m = require("mapx")

m.nnoremap("0", "^")
m.nnoremap("Q", "<nop>")
m.nmap("j", "gj")
m.nmap("k", "gk")

m.nmap("<C-u>", "<C-u>zz", "Center the buffer after scrolling")
m.nmap("<C-d>", "<C-d>zz", "Center the buffer after scrolling")

m.nmap("gp", "`[v`]", "Select last pasted text")
m.nmap("<leader>l", "<cmd>nohlsearch<cr>", "Clear hlsearch highlights")
m.tmap("<C-t><esc>", "<C-\\><C-n>", "Exit insert mode in the terminal")
