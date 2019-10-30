```
# setup pyenv/python for neovim

PYTHON2_VERSION=2.7.15
PYTHON3_VERSION=3.7.1

pyenv install "${PYTHON2_VERSION}"
pyenv install "${PYTHON3_VERSION}"

pyenv virtualenv "${PYTHON2_VERSION}" neovim2
pyenv virtualenv "${PYTHON3_VERSION}" neovim3

pyenv activate neovim2
pip install neovim

pyenv activate neovim3
pip install neovim

pip install flake8
ln -s $(pyenv which flake8) /usr/local/bin  # Assumes that $HOME/bin is in $PATH

pyenv deactivate
```
