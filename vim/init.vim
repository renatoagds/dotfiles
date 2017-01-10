" @renatoagds neovim configuration

" === Plugins ===
call plug#begin()

try
  source ~/.config/nvim/plugins.vim
catch
endtry

call plug#end()

" === Plugin Config ===

try
  source ~/.config/nvim/config.vim
catch
endtry

" === Profile Setup ===

try
  source ~/.config/nvim/profile.vim
catch
endtry
