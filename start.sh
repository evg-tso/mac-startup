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
brew install --cask visualvm
brew install --cask adobe-creative-cloud

# Intall cli commands
brew install tldr
brew install htop
brew install wget
brew install jq
brew install tree

# Install ZSH
brew install zsh

# install latest GIT
brew install git
brew install git-lfs

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ZSH autosuggestions, https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# https://formulae.brew.sh/formula/watch, https://www.geeksforgeeks.org/watch-command-in-linux-with-examples/
which watch || (brew install watch)

# install LastPass
brew install --cask lastpass

# install vscode
brew install --cask visual-studio-code

# Finder: Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true

# Activity Monitor: Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Enable TouchID for terminal SUDO
# https://dev.to/equiman/how-to-use-macos-s-touch-id-on-terminal-5fhg
# https://unix.stackexchange.com/questions/99350/how-to-insert-text-before-the-first-line-of-a-file
which gsed || (brew install gsed)
sudo gsed -i '1i auth	   sufficient     pam_tid.so' /etc/pam.d/sudo

# DBeaver
brew install --cask dbeaver-community

# powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

# Autojump
brew install autojump

# Rectangle
brew install --cask rectangle

# Jenv
# https://formulae.brew.sh/formula/jenv
brew install jenv

# maven
brew install maven

# Docker 
brew install --cask docker

# WhatsApp
brew install --cask whatsapp

# Postman
brew install --cask postman
