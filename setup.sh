#!/usr/bin/env bash

# renatoagds (SH to setup basic stuffs in new Mac OS)
DOTFILES=~/Documents/Personal/dotfiles

# go to main folder
cd ~

# install brew if isn't installed
if ! type "$brew" &> /dev/null; then
  echo "brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# setup oh-my-zsh
echo "oh-my-zsh"
curl -O https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
cat install.sh | awk 'NR!=113{print $0}' | sh
rm -rf ~/.zshrc
ln -s "${DOTFILES}/zsh/zshrc" ~/.zshrc
rm -rf install.sh

declare -a brew=(
    "nvm"
    "neovim"
    "mitmproxy"
    "python2"
    "python3"
    "git"
    "tmux"
    "zsh"
    "zsh-completion"
    "ack"
    "shpotify"
    "docker"
    "cmake"
    "watchman"
  )

declare -a cask=(
    "google-chrome"
    "iterm2"
    "firefox"
    "dash"
    "docker"
    "spectacle"
    "evernote"
    "telegram"
    "whatsapp"
    "slack"
    "spotify"
    "tuxera-ntfs"
    "skype" 
    "the-unarchiver"
    "adobe-acrobat-reader"
    "google-backup-and-sync"
    "android-studio"
    "java8"
    "frappe"
  )

# install all brew dep
echo "brew"
for i in "${brew[@]}"; do
  brew install "$i"
done

# install all cask dep
echo "brew-cask"
brew tap caskroom/versions
for i in "${cask[@]}"; do
  brew cask install "$i"
done

# setup neovim
echo "neovim"
pip2 install neovim
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
for f in ${DOTFILES}/vim/*.vim; do
  filename=$(basename "$f")
  ln -s "$f" "${HOME}/.config/nvim/${filename}"
done

# setup tmux
echo "tmux"
ln -s "${DOTFILES}/tmux/tmux.conf" ~/.tmux.conf

# export NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# install node/npm
echo "node/npm"
nvm install node
nvm use node
nvm alias default node

# setup modules
echo "npm"
declare -a npm=(
    "react-native-cli"
    "code-push-cli"
    "appcenter-cli"
    "npm-check-updates"
    "http-server"
    "tern"
    "tern-jsx"
    "eslint"
  )

for i in "${npm[@]}"; do
  npm i -g "$i"
done
