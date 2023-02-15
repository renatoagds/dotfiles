function map(mode, shortcut, command, custom_options)
  local options = custom_options or { silent = true, noremap = true }
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

local utils = {
  nmap = nmap,
  imap = imap,
  vmap = vmap,
  cmap = cmap,
  tmap = tmap
}

return utils
