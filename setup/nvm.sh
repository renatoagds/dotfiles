# export NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# install node/npm
echo "Installing Node LTS"
nvm install --lts

# setup modules
echo "Installing Node Dependencies"
declare -a npm=(
    "neovim"
    "pnpm"
  )

for i in "${npm[@]}"; do
  npm i -g "$i"
done
