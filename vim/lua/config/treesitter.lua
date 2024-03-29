require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "python",
    "json",
    "json5",
    "jsonc",
    "jsdoc",
    "php",
    "vim",
    "css",
    "html",
    "dockerfile",
    "gitignore",
    "vue",
    "lua",
    "go",
    "rust",
    "scss",
    "svelte",
    "tsx",
    "yaml",
    "comment",
    "bash",
    "help"
  },
  highlight = {
    enable = true,
  },
}
