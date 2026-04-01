#!/bin/bash

# ============================================================
# System prerequisites
# ============================================================

# Install Rosetta2 emulator for the new ARM silicon
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Make sure the Command Line Tools are installed
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add required taps
brew tap hashicorp/tap

# ============================================================
# Terminals
# ============================================================

brew install --cask iterm2 ghostty

# Ghostty config
MAC_STARTUP_DIR="${MAC_STARTUP_DIR:-$HOME/development/personal/mac-startup}"
mkdir -p ~/.config/ghostty
cp "$MAC_STARTUP_DIR/ghostty/config" ~/.config/ghostty/config

# ============================================================
# Browsers
# ============================================================

brew install --cask google-chrome

# ============================================================
# Editors & IDEs
# ============================================================

brew install --cask jetbrains-toolbox sublime-text visual-studio-code

# ============================================================
# CLI tools
# ============================================================

brew install git git-lfs gh tldr htop wget jq tree ripgrep watch gsed autojump grpcurl

# ============================================================
# Shell: ZSH + Oh My Zsh + plugins + theme
# ============================================================

brew install zsh

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions plugin
# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Powerlevel10k theme (oh-my-zsh native install)
# https://github.com/romkatv/powerlevel10k#oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# ============================================================
# Cloud & infrastructure CLIs
# ============================================================

brew install awscli kubectl k9s hashicorp/tap/vault
brew install --cask session-manager-plugin

# ============================================================
# Containers (Colima -- Docker Desktop alternative)
# ============================================================

brew install colima docker docker-compose

# Register docker-compose plugin
mkdir -p ~/.docker
if [ -f ~/.docker/config.json ]; then
  jq '. + {"cliPluginsExtraDirs": ["/opt/homebrew/lib/docker/cli-plugins"]}' ~/.docker/config.json > ~/.docker/config.json.tmp \
    && mv ~/.docker/config.json.tmp ~/.docker/config.json
else
  echo '{"cliPluginsExtraDirs": ["/opt/homebrew/lib/docker/cli-plugins"]}' > ~/.docker/config.json
fi

# ============================================================
# Programming languages & version managers
# ============================================================

brew install jenv maven go goenv clojure leiningen
brew install --cask corretto@21

# ============================================================
# AI coding tools
# ============================================================

brew install --cask claude-code chatgpt codex
brew install opencode

# Claude Code config
mkdir -p ~/.claude
cat > ~/.claude/settings.json << 'EOF'
{
  "permissions": {
    "allow": [
      "Bash(gh pr view*)",
      "Bash(gh pr diff:*)"
    ]
  },
  "autoUpdatesChannel": "stable"
}
EOF

# ============================================================
# Productivity & utilities
# ============================================================

brew install --cask itsycal rectangle obsidian keycastr maccy whatsapp postman another-redis-desktop-manager jdk-mission-control

# ============================================================
# macOS system settings
# ============================================================

# Dock: auto-hide
defaults write com.apple.dock autohide -bool true

# Finder: show hidden files
defaults write com.apple.Finder AppleShowAllFiles true

# Finder: show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Trackpad: tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Trackpad: three-finger drag (accessibility)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Activity Monitor: visualize CPU usage in the Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Enable TouchID for terminal sudo (survives macOS updates)
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo sed -i '' 's/^#auth/auth/' /etc/pam.d/sudo_local

# Restart affected services
killall Dock Finder
