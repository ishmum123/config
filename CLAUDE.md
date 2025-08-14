# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles configuration repository containing personal development environment settings for macOS. It includes configurations for:
- Neovim (LazyVim-based setup)
- Zsh shell with Oh My Zsh and Powerlevel10k
- Alacritty terminal emulator
- Kitty terminal emulator
- Git configuration
- Homebrew package management

## Common Commands

### Initial Setup
```bash
# Run the automated macOS setup script
zsh mac_setup.zsh
```

### Neovim Management
```bash
# Open Neovim
nvim

# Inside Neovim:
# :Lazy          - Open plugin manager
# :Lazy sync     - Update all plugins
# :Lazy health   - Check plugin health
# :Mason         - Manage LSP servers/formatters
```

### Git Operations
```bash
# Stage and commit changes
git add -A
git commit -m "Update configuration"
git push origin main
```

## Architecture

### Neovim Configuration Structure
The Neovim setup uses LazyVim as a base configuration framework with custom plugins:

- `/nvim/init.lua` - Entry point that loads the lazy.nvim plugin manager
- `/nvim/lua/config/` - Core configuration files (autocmds, keymaps, lazy setup, options)
- `/nvim/lua/plugins/` - Individual plugin configurations, each in its own file:
  - `default.lua` - LazyVim default overrides
  - `lsp.lua` - Language server protocol configuration
  - `typescript-tools.lua` - TypeScript specific tooling
  - `telescope.lua` - Fuzzy finder configuration
  - `colorscheme.lua` - Theme configuration
  - Additional plugin files for specific functionality

### Shell Configuration
The repository uses a layered approach for shell configuration:
- `.zshrc` - Main Zsh configuration with Oh My Zsh, theme settings, and custom aliases
- `mac_setup.zsh` - Automated script for setting up a new macOS development environment

### Key Patterns
1. **Plugin Management**: Each Neovim plugin has its own configuration file in `/nvim/lua/plugins/`
2. **LazyVim Extension**: Custom configurations extend LazyVim's defaults rather than replacing them
3. **Automated Setup**: The `mac_setup.zsh` script provides idempotent installation of all dependencies

## Development Workflow

When modifying configurations:
1. Make changes to the relevant configuration files
2. Test changes locally (restart terminal for shell changes, reload Neovim for editor changes)
3. Commit changes with descriptive messages about what was modified
4. The repository tracks configuration changes over time through git history