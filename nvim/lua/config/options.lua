-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.timeout = true -- ensure mapping timeouts are enabled
opt.timeoutlen = 100 -- reduce mapping wait time to 100ms (or less)
opt.ttimeoutlen = 0 -- recommended to disable terminal key-code delay

vim.g.lazyvim_picker = "telescope"
