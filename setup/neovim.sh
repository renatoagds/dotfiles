#!/usr/bin/env bash

# renatoagds (SH to setup basic stuffs in new Mac OS)
DOTFILES=~/Documents/Code/dotfiles

# go to main folder
cd ~

# install neovim
echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "Linking neovim files"
ln -s "${DOTFILES}/vim/colorscheme.lua" ~/.config/nvim/lua/plugins/colorscheme.lua
ln -s "${DOTFILES}/vim/copilot.lua" ~/.config/nvim/lua/plugins/copilot.lua
ln -s "${DOTFILES}/vim/lsp.lua" ~/.config/nvim/lua/plugins/lsp.lua
ln -s "${DOTFILES}/vim/lazyvim.json" ~/.config/nvim/lua/plugins/lazyvim.json

# setup tmux
echo "Adding tmux config in home"
ln -s "${DOTFILES}/tmux/tmux.conf" ~/.tmux.conf

# setup TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
