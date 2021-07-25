#!/bin/bash

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install browser
brew install --cask google-chrome

# Install proper terminal
brew install --cask iterm2

# Install tools
brew install --cask jetbrains-toolbox
brew install --cask itsycal
brew install --cask sublime-text

# Intall cli commands
brew install tldr
brew install htop
brew install jq
brew install tree
