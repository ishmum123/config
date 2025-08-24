-- in lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        initial_mode = "normal",
        generic_sorter = require("telescope.sorters").get_fuzzy_file,
        file_sorter = require("telescope.sorters").get_fuzzy_file,
      },
    })
    require("telescope").load_extension("fzf")
  end,
  keys = {
    -- disable any default fuzzy search mappings you want replaced:
    { "<leader>/", false },
    { "<leader>f/", false },

    -- map to Telescope:
    {
      "<leader>/",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Grep (project)",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "List buffers",
    },
    {
      "<leader>ws",
      function()
        require("telescope.builtin").lsp_workspace_symbols()
      end,
      desc = "Workspace symbols",
    },
  },
}
