#!/usr/bin/env zsh
set -euo pipefail

# 1️⃣ Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Updating Homebrew…"
brew update

# 2️⃣ Install core CLI tools
brew install git neovim fzf ripgrep ranger lazygit kitty

# 3️⃣ Install Nerd Font (MesloLGS NF)
brew install --cask font-meslo-lg-nerd-font

# 4️⃣ Setup fzf shell integration
echo "Installing fzf shell support…"
yes | "$(brew --prefix)/opt/fzf/install" --all

# 5️⃣ Install Oh My Zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh…"
  runHookzsh=$(mktemp)
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > $runHookzsh
  sed -i '' 's/^exec zsh/# exec zsh/' $runHookzsh
  sh $runHookzsh
  rm $runHookzsh
fi

# 6️⃣ Install Powerlevel10k
THEME_DIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
if [ ! -d "$THEME_DIR" ]; then
  echo "Installing Powerlevel10k…"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$THEME_DIR"
fi

# 7️⃣ Install zsh-autosuggestions & syntax-highlighting
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  PLUGDIR=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin
  if [ ! -d "$PLUGDIR" ]; then
    echo "Installing $plugin…"
    git clone https://github.com/zsh-users/$plugin.git "$PLUGDIR"
  fi
done

# 8️⃣ Configure ~/.zshrc
ZSHRC="$HOME/.zshrc"
autoload -U add-zsh-hook

ensure_line() {
  grep -qxF "$1" "$ZSHRC" || echo "$1" >> "$ZSHRC"
}

ensure_line "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" 
ensure_line "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
ensure_line "alias vi='nvim'"
ensure_line "alias vim='nvim'"
ensure_line "export EDITOR='nvim'"
ensure_line "export VISUAL='nvim'"
ensure_line "bindkey -v"
ensure_line "export KEYTIMEOUT=1"

# 9️⃣ Setup LazyGit config directory
mkdir -p "$HOME/Library/Application Support/lazygit"
LGC="$HOME/Library/Application Support/lazygit/config.yml"
if [ ! -f "$LGC" ]; then
  cat > "$LGC" <<EOF
# Lazygit config
gui:
  theme:
    selectedLineBgColor: ["underline"]
os:
  editCommand: "nvim"
EOF
fi

# 1️⃣0️⃣ Create Alacritty config folder
mkdir -p ~/.config/alacritty

echo "Setup complete! Please restart your terminal."

