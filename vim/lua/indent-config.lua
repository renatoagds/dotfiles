-- vim.g.vim_json_syntax_conceal = 0
-- vim.g.vim_json_conceal = 0
-- vim.g.markdown_syntax_conceal = 0
-- vim.g.indentLine_color_term = 241
-- vim.g.indentLine_color_gui = 241

-- http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
-- vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#444444 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    use_treesitter = true,
    space_char_blankline = " ",
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1"
    },
}
