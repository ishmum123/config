return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {}, -- will be overridden by typescript-tools if used
        dartls = {
          cmd = { "dart", "language-server", "--protocol=lsp" },
          filetypes = { "dart" },
          root_dir = require("lspconfig.util").root_pattern("pubspec.yaml", ".git"),
        },
        intelephense = {
          cmd = { "intelephense", "--stdio" },
          filetypes = { "php" },
          root_dir = require("lspconfig.util").root_pattern(".git", "composer.json"),
          settings = {
            intelephense = {
              files = {
                associations = { "*.php", "*.module", "*.inc" },
                maxSize = 5000000,
              },
              diagnostics = { enable = true },
            },
          },
        },
      },
      setup = {
        -- Example: use typescript-tools.nvim instead of tsserver
        tsserver = function(_, opts)
          require("typescript-tools").setup({ server = opts })
          return true
        end,
      },
    },
  },
}
