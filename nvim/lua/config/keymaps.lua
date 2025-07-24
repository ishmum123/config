-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local theme = require("config.theme_toggle")
vim.keymap.set("n", "<leader>ub", theme.toggle_bg, { desc = "Toggle light/dark background" })
vim.keymap.set("n", "<C-w>", ":update<CR>", { desc = "Save if modified" })
vim.keymap.set(
  "i",
  "<C-W>",
  "<C-o><C-w>a",
  { noremap = true, silent = true, desc = "Ctrl+W window command in Insert mode" }
)
