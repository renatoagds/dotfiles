#!/usr/bin/env bash

# renatoagds (SH to setup basic stuffs in new Mac OS)
DOTFILES=~/Documents/Personal/dotfiles
PYTHON2_VERSION=2.7.15
PYTHON3_VERSION=3.7.1

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
  )

declare -a cask=(
    "google-chrome-dev"
    "iterm2"
    "firefox-developer-edition"
    "dash"
    "docker"
    "spectacle"
    "telegram"
    "whatsapp"
    "evernote"
    "slack"
    "spotify"
    "discord"
    "skype" 
    "the-unarchiver"
    "adobe-acrobat-reader"
    "google-backup-and-sync"
    "android-studio"
    "java8"
    "numi"
    "1password"
    "kap"
    "vlc"
    "devhub"
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
echo "Installing Node LTS Carbon"
nvm install lts/carbon
nvm alias default lts/carbon
nvm use default

# setup modules
echo "Installing Yarn Global Dependencies"
declare -a npm=(
    "npm-check"
    "http-server"
    "tern"
    "neovim"
  )

for i in "${npm[@]}"; do
  yarn global add "$i"
done

# setup scm_breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source ~/.zshrc

# setup TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# setup python-neovim
# pyenv install "${PYTHON2_VERSION}"
# pyenv install "${PYTHON3_VERSION}"

# pyenv virtualenv "${PYTHON2_VERSION}" neovim2
# pyenv virtualenv "${PYTHON3_VERSION}" neovim3

# pyenv activate neovim2
# pip install neovim

# pyenv activate neovim3
# pip install neovim

# pip install flake8
# ln -s $(pyenv which flake8) /usr/local/bin  # Assumes that $HOME/bin is in $PATH

# pyenv deactivate
