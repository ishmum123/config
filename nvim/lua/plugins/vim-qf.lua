return {
  {
    "romainl/vim-qf",
    event = "VeryLazy", -- load lazily after start
    config = function()
      -- optional: open help on first run
      -- vim.cmd("doautocmd User vim-qf-loaded")
    end,
  },
}
