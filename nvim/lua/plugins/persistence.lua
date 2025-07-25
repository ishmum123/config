return {
  "folke/persistence.nvim",
  lazy = false, -- ensures plugin is loaded at startup
  opts = {
    dir = vim.fn.stdpath("state") .. "/sessions/",
    need = 1, -- only save if at least one buffer is open
    branch = true, -- separate sessions per Git branch
  },
  config = function(_, opts)
    require("persistence").setup(opts)

    -- Auto-restore session on startup, only if no file specified
    vim.api.nvim_create_autocmd("VimEnter", {
      nested = true,
      callback = function()
        if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
          require("persistence").load()
        end
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistenceSavePre",
      callback = function()
        vim.g.LAST_CMD = _G.last_cmd or ""
        vim.g.AUTOFORMAT_ENABLED = vim.g.autoformat -- copy current setting
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistenceLoadPost",
      callback = function()
        if vim.g.LAST_CMD then
          _G.last_cmd = vim.g.LAST_CMD
        end
        if vim.g.AUTOFORMAT_ENABLED ~= nil then
          vim.g.autoformat = vim.g.AUTOFORMAT_ENABLED
        end
      end,
    })

    -- Optional keymaps
    vim.keymap.set("n", "<leader>qs", function()
      require("persistence").load()
    end, { desc = "Restore session for current directory" })
    vim.keymap.set("n", "<leader>qS", function()
      require("persistence").select()
    end, { desc = "Select a session to restore" })
    vim.keymap.set("n", "<leader>ql", function()
      require("persistence").load({ last = true })
    end, { desc = "Restore last session" })
    vim.keymap.set("n", "<leader>qd", function()
      require("persistence").stop()
    end, { desc = "Disable auto-saving this session" })
  end,
}
