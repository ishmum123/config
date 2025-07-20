return {
  {
    "neovim/nvim-lspconfig",
    -- optional perf optimizations
    lazy = true,
    config = function()
      require("lspconfig").phpactor.setup({
        root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
        init_options = {
          ["language_server.diagnostics_on_update"] = false,
          ["language_server.diagnostics_on_open"] = false,
          ["language_server.diagnostics_on_save"] = false,
          ["language_server_phpstan.enabled"] = false,
          ["language_server_psalm.enabled"] = false,
        },
      })
    end,
  },
}
