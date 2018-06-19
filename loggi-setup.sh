#!/usr/bin/env bash

# renatoagds (Setup loggi stuffs )
LOGGI=/opt/loggi
USER=renatoagds

# export NVM
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# login into registry
echo "npm login"
npm login

# docker login (docker needs to be open)
echo "docker login"
docker login

# folder setup
echo "creating loggi folder"
sudo mkdir -p "${LOGGI}"
sudo chown -R "${USER}" "${LOGGI}"
sudo chmod -R 755 "${LOGGI}"

# install libpng
brew install libpng

#web-builder
cd "${LOGGI}"
git clone "git@github.com:loggi/ui-builder"
cd ui-builder
npm install
npm link
cd ~

declare -a front=(
    "corp-web-ui"
    "wms-web-ui"
    "retail-web-ui"
    "elke"
    "outer-pages-ui"
    "javascript"
    "consumer-app"
    "wms-terminal-app-1"
    "wms-terminal-app"
    "tracker-web-ui"
    "auth-web-ui"
    "shell-web-ui"
    "email-web-ui"
    "orwell-web-ui"
  )

# clone and setup front repos
echo "fronts repos"
for i in "${front[@]}"; do
  cd "${LOGGI}"
  git clone "git@github.com:loggi/${i}.git"
  cd "${i}"
  npm i
done

#war-room
cd "${LOGGI}"
git clone "git@github.com:loggi/war-room-web-ui"
cd war-room-web-ui
nvm install v6.9.5
nvm use v6.9.5
npm install
nvm use default
cd ~

declare -a others=(
    "ops"
    "loggi-web"
  )

echo "others repos"
cd "${LOGGI}"
for i in "${others[@]}"; do
  git clone "git@github.com:loggi/${i}.git"
done

loggi up
loggi setup-dev-db

