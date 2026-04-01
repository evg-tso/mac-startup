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

brew install --cask iterm2
brew install --cask ghostty

# Ghostty config
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.config/ghostty
ln -sf "$SCRIPT_DIR/ghostty/config" ~/.config/ghostty/config

# ============================================================
# Browsers
# ============================================================

brew install --cask google-chrome

# ============================================================
# Editors & IDEs
# ============================================================

brew install --cask jetbrains-toolbox
brew install --cask sublime-text
brew install --cask visual-studio-code

# ============================================================
# CLI tools
# ============================================================

brew install git
brew install git-lfs
brew install gh
brew install tldr htop wget jq tree
brew install ripgrep
brew install watch
brew install gsed
brew install autojump
brew install grpcurl

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

brew install awscli
brew install kubectl
brew install k9s
brew install hashicorp/tap/vault
brew install --cask session-manager-plugin

# ============================================================
# Containers (Colima -- Docker Desktop alternative)
# ============================================================

brew install colima
brew install docker
brew install docker-compose

# ============================================================
# Programming languages & version managers
# ============================================================

# Java
brew install jenv
brew install maven

# Go
brew install go
brew install goenv

# Clojure
brew install clojure
brew install leiningen

# ============================================================
# AI coding tools
# ============================================================

brew install --cask claude-code
brew install --cask chatgpt
brew install --cask codex
brew install opencode

# ============================================================
# Productivity & utilities
# ============================================================

brew install --cask itsycal
brew install --cask rectangle
brew install --cask obsidian
brew install --cask keycastr
brew install --cask whatsapp
brew install --cask postman
brew install --cask another-redis-desktop-manager
brew install --cask jdk-mission-control

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

# Enable TouchID for terminal sudo
# https://dev.to/equiman/how-to-use-macos-s-touch-id-on-terminal-5fhg
sudo gsed -i '1i auth\t   sufficient     pam_tid.so' /etc/pam.d/sudo

# Restart affected services
killall Dock Finder
