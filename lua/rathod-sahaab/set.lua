vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.incsearch = true

--- Start scrolling when cursor at -10th row
vim.opt.scrolloff = 10

vim.opt.guifont = { "JetBrainsMono Nerd Font Regular", "h11" }
vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_animation_length = 0.03;
vim.g.neovide_cursor_trail_size = 0.8;
