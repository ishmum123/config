-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.termguicolors = true
-- optional: set background depending on preference
vim.o.background = "light" -- or 'dark'

vim.o.sessionoptions = vim.o.sessionoptions .. ",globals"
