return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "vertical" then
            return vim.o.columns * 0.5 -- 50% of width
          else
            return 15
          end
        end,
        direction = "vertical",
        close_on_exit = false,
        shade_terminals = false,
        start_in_insert = false,
        persist_size = true,
      })

      local Terminal = require("toggleterm.terminal").Terminal
      -- persistent terminal instance for custom command
      local cmd_terminal = Terminal:new({
        cmd = "", -- placeholder
        direction = "vertical",
        hidden = true,
        on_open = function(t)
          -- map 'q' to close it
          vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })

      -- change command
      local function _change_cmd()
        vim.ui.input({ prompt = "Command to run in right panel: " }, function(input)
          if input and input ~= "" then
            cmd_terminal.cmd = input
          else
            vim.notify("No command provided", vim.log.levels.WARN)
            return
          end
          cmd_terminal:toggle()
        end)
      end

      -- toggle command
      local function _run_cmd()
        if cmd_terminal.cmd == "" then
          vim.ui.input({ prompt = "Command to run in right panel: " }, function(input)
            if input and input ~= "" then
              cmd_terminal.cmd = input
            else
              vim.notify("No command provided", vim.log.levels.WARN)
              return
            end
            cmd_terminal:toggle()
          end)
        else
          cmd_terminal:toggle()
        end
      end

      vim.api.nvim_set_keymap(
        "n",
        "<C-x>",
        "<cmd>lua _run_cmd()<CR>",
        { noremap = true, silent = true, desc = "Toggle custom cmd terminal on right" }
      )

      vim.api.nvim_set_keymap(
        "n",
        "<leader>x",
        "<cmd>lua _change_cmd()<CR>",
        { noremap = true, silent = true, desc = "Toggle custom cmd terminal on right" }
      )

      _G._change_cmd = _change_cmd
      _G._run_cmd = _run_cmd
    end,
  },
}
