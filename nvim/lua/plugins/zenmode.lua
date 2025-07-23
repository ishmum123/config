return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 0.95,
        width = 80,
        height = 1,
        options = { number = false },
      },
      plugins = {
        options = { enabled = true },
        tmux = { enabled = true },
      },
    })
    -- Map toggle
    vim.keymap.set("n", "<leader>uz", require("zen-mode").toggle, {
      desc = "Toggle Zen Mode",
    })
  end,
}
