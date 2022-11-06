local opt = vim.opt
local keymap = vim.api.nvim_set_keymap
opt.number = false
opt.inccommand = 'split'
opt.cmdheight = 0
opt.swapfile = false
opt.autoread = true
opt.cursorline = true


-- autocmd
vim.cmd [[
set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
set autoread
]]
