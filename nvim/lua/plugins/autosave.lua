return {
  {
    "Pocco81/auto-save.nvim",
    event = "InsertLeave", -- or "VeryLazy" to load later
    opts = {
      enabled = true,
      trigger_events = { "InsertLeave", "TextChanged" },
      debounce_delay = 500, -- wait milliseconds before saving
      condition = function(buf)
        local ft = vim.fn.getbufvar(buf, "&filetype")
        local bt = vim.fn.getbufvar(buf, "&buftype")
        -- DON’T save toggleterm or any terminal buffer
        if bt == "terminal" or ft == "toggleterm" then
          return false
        end
        -- Only save if modifiable
        return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].modifiable
      end,
      write_all_buffers = false,
      execution_message = {
        message = function()
          return "AutoSave ➤ " .. vim.fn.strftime("%H:%M:%S")
        end,
        dim = 0.15,
        cleaning_interval = 1000,
      },
    },
    config = function(_, opts)
      require("auto-save").setup(opts)
      vim.api.nvim_set_keymap(
        "n",
        "<leader>n",
        "<cmd>ASToggle<CR>",
        { noremap = true, silent = true, desc = "Toggle AutoSave" }
      )
    end,
  },
}
