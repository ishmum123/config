-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>ub", function()
  require("config.theme_toggle").toggle_bg()
end, { desc = "Toggle light/dark background" })
map("n", "<C-w>", ":update<CR>", { desc = "Save if modified" })
map("i", "<C-W>", "<C-o><C-w>a", { noremap = true, silent = true, desc = "Ctrl+W window command in Insert mode" })
map("n", "<C-q>", ":q<CR>", { noremap = true, silent = true, desc = "Save if modified" })

map("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true, desc = "Comment line (Ctrl+/)" })

map("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { silent = true })

map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle line comment" })
map("v", "<leader>/", "gb", { remap = true, desc = "Toggle block comment" })
