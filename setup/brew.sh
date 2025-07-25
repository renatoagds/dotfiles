#!/usr/bin/env bash

# renatoagds (SH to setup basic stuffs in new Mac OS)
DOTFILES=~/Documents/Code/dotfiles

# go to main folder
cd ~

# install brew if isn't installed
# if ! type "$brew" &> /dev/null; then
  # echo "brew"
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi

declare -a brew=(
    "nvm"
    "neovim"
    "git"
    "tmux"
    "zsh"
    "zsh-completion"
    "watchman"
    "yarn"
    "highlight"
    "bat"
    "prettyping"
    "ripgrep"
    "fd"
  )

declare -a cask=(
    "brave-browser"
    "hyper"
    "docker"
    "rectangle"
    "telegram"
    "whatsapp"
    "slack"
    "spotify"
    "keka"
    "adobe-acrobat-reader"
    "numi"
    "1password"
    "kap"
    "vlc"
  )

# install all brew dep
echo "Installing application from Brew"
for i in "${brew[@]}"; do
  brew install "$i"
done

# install all cask dep
# echo "Installing application from Brew Cask"
# brew tap caskroom/versions
# for i in "${cask[@]}"; do
  # brew install --cask "$i"
# done

# setup scm_breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc
