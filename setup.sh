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
echo "Installing Oh My ZSH"
curl -O https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
cat install.sh | awk 'NR!=113{print $0}' | sh
rm -rf ~/.zshrc
ln -s "${DOTFILES}/zsh/zshrc" ~/.zshrc
rm -rf install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

declare -a brew=(
    "nvm"
    "neovim"
    "mitmproxy"
    "pyenv"
    "pyenv-virtualenv"
    "git"
    "tmux"
    "zsh"
    "zsh-completion"
    "ack"
    "shpotify"
    "docker"
    "cmake"
    "watchman"
    "yarn"
    "highlight"
    "bat"
    "prettyping"
    "reattach-to-user-namespace"
  )

declare -a cask=(
    "brave-browser"
    "iterm2"
    "docker"
    "spectacle"
    "telegram"
    "whatsapp"
    "slack"
    "spotify"
    "the-unarchiver"
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
echo "Installing application from Brew Cask"
brew tap caskroom/versions
for i in "${cask[@]}"; do
  brew cask install "$i"
done

# install neovim
echo "Installing neovim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim/
for f in ${DOTFILES}/vim/*.vim; do
  filename=$(basename "$f")
  ln -s "$f" "${HOME}/.config/nvim/${filename}"
done

# setup tmux
echo "Adding tmux config in home"
ln -s "${DOTFILES}/tmux/tmux.conf" ~/.tmux.conf

# setup tern
echo "Adding tern config in home"
ln -s "${DOTFILES}/tern/tern-config" ~/.tern-config

# export NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# install node/npm
echo "Installing Node LTS"
nvm install lts/dubnium
nvm alias default lts/dubnium
nvm use default

# setup modules
echo "Installing Node Dependencies"
declare -a npm=(
    "npm-check"
    "http-server"
    "tern"
    "neovim"
    "pure-prompt"
  )

for i in "${npm[@]}"; do
  npm i -g "$i"
done

# setup scm_breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc

# setup TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
