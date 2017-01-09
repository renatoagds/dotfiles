" @renatoagds neovim configuration

" === Plugins ===
call plug#begin()

try
  source ./plugins.vim
catch
endtry

call plug#end()

" === Profile Setup ===

try
  source ./profile.vim
catch
endtry

" === Plugin Config ===

try
  source ./config.vim
catch
endtry
