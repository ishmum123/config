-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.termguicolors = true
-- optional: set background depending on preference
-- TODO: Fix this
-- This needs to be dark when 'colorscheme' is set to tokyonight
-- This needs to be light when 'colorscheme' is set to vimbones
-- vim.o.background = "dark"

vim.o.sessionoptions = vim.o.sessionoptions .. ",globals"
