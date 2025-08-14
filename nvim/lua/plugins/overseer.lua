return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo", "OverseerRestartLast" },
  opts = {
    task_list = {
      direction = "bottom",
      min_height = 25,
      max_height = 25,
      default_detail = 1,
    },
    templates = { "builtin" },
    strategy = {
      "toggleterm",
      use_shell = false,
      direction = "horizontal",
      open_on_start = true,
      quit_on_exit = "never",
    },
  },
  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)
    
    -- Custom command to restart last task
    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local tasks = overseer.list_tasks({ recent_first = true })
      if tasks[1] then
        overseer.run_action(tasks[1], "restart")
      else
        vim.notify("No recent tasks to restart", vim.log.levels.WARN)
      end
    end, {})
  end,
  keys = {
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
    { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Task info" },
    { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build task" },
    { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick action" },
    { "<leader>ol", "<cmd>OverseerRestartLast<cr>", desc = "Restart last task" },
    { "<leader>oo", "<cmd>OverseerRestartLast<cr>", desc = "Restart last task (quick)" },
  },
}