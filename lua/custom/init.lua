local opt = vim.opt
local keymap = vim.api.nvim_set_keymap
opt.number = false
opt.inccommand = 'split'
opt.cmdheight = 0
opt.swapfile = false
keymap("t", "jk", [[<C-\><C-n>]])
keymap("n", "<C-Up>", "<cmd>resize -2<cr>")
keymap("n", "<C-Down>", "<cmd>resize +2<cr>")
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>")
