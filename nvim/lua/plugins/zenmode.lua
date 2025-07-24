return {
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { twilight = { enabled = true } },
    },
    config = function()
      require("zen-mode").setup({
        window = {
          width = 80,
          height = 0.4,
          backdrop = 0.8,
        },
        plugins = {
          options = {
            laststatus = 0,
            ruler = false,
            showcmd = false,
          },
        },
      })
      vim.keymap.set("n", "<leader>uz", require("zen-mode").toggle, {
        desc = "Toggle Zen Mode",
      })
    end,
  },
  {
    "folke/twilight.nvim",
    event = "VeryLazy",
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.25, -- make inactive text 25% opaque
          color = { fg = "#888888", bg = nil },
        },
        context = 5, -- lines around cursor remain bright
      })
    end,
  },
}
