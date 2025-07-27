return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional: tweak brightness of comments, etc.
      -- vim.g.zenbones_darken_comments = 45
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- dark theme style (change to "night", "storm", or "day")
      transparent = false,
      sidebars = "dark",
      floats = "dark",
    },
  },
}
