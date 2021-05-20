" @renatoagds neovim configuration

" === Python Setup
let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
let g:wakatime_PythonBinary = $HOME.'/.pyenv/versions/neovim3/bin/python'

" === Plugins ===
call plug#begin()

try
  source ~/.config/nvim/plugins.vim
catch
endtry

call plug#end()

" === Profile Setup ===

try
  source ~/.config/nvim/profile.vim
catch
endtry

" === Plugin Config ===

try
  source ~/.config/nvim/config.vim
catch
endtry
