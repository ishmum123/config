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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vimbones",
    },
  },
}
