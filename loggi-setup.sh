#!/usr/bin/env bash

# renatoagds (Setup loggi stuffs )
LOGGI=/opt/loggi
USER=loggi

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
    "ui-builder"
    "tracker-web-ui"
    "auth-web-ui"
    "shell-web-ui"
    "email-web-ui"
  )

# clone and setup front repos
echo "fronts repos"
for i in "${front[@]}"; do
  cd "${LOGGI}"
  git clone "git@github.com:loggi/${i}.git"
  cd "${i}"
  npm i
done

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

