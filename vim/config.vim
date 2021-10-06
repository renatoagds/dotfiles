" ===============
" NO PLUGINS RELATED
" ===============

" == Mkdir Recursive (create folder if don't exists) ==
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" == CronTab ==
autocmd filetype crontab setlocal nobackup nowritebackup

" == Automatic define filetype for Flow Files ==
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.flow set filetype=javascript.jsx
augroup END

" == Terminal (map ESC to leave in terminal) ==
tnoremap <Esc> <C-\><C-n>

" == File Related
nnoremap ;; :w<CR>
nnoremap <C-W> :bd<CR>

" == Split Related
nnoremap L <C-W><C-L>
nnoremap H <C-W><C-H>

" == Space navigation
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" == Insert mode navigation ==
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ===============
" PLUGINS RELATED
" ===============

" === FZF.Vim ===
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <C-T> :Files<CR>
nnoremap <C-P> :GFiles<CR>
nnoremap <C-M> :Ag<CR>

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

" === COC.Nvim ===

" = format range code
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" = rename all references
nmap <leader>rn <Plug>(coc-rename)
" = go to definition/references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
" = list all lint errors
nnoremap <silent> <leader>l :<C-u>CocList diagnostics<cr>
" = navigate thru lint errors
nmap <silent> <c-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <c-j> <Plug>(coc-diagnostic-next)
" = trigger doc info
nnoremap <silent> K :call CocAction('doHover')<CR>
" = trigger completion list
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <NUL> coc#refresh()
" = navigate with tab on completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" = confirm completion on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-json',
      \'coc-html',
      \'coc-css',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-lists',
      \'coc-phpls',
      \]

" === Airline ===
let g:airline_theme = "dracula"
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 20
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>< <Plug>AirlineSelectPrevTab
nmap <leader>> <Plug>AirlineSelectNextTab

" === UltiSnips ===
let g:UltiSnipsExpandTrigger="<leader>aa"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_javascript = {'semi': 'never'}

" === Vim Javascript ===
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" === NerdCommenter ===
let g:NERDSpaceDelims = 1

" === Vim Matchmaker === 
let g:matchmaker_ignore_single_match = 1
let g:matchmaker_enable_startup = 1
let g:matchmaker_matchpriority = -1

" === indentLine ===
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
let g:indentLine_color_term = 241

" === Editor Config ===
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" === AutoPairs ===
let g:AutoPairsMapCh = 0

" === Vim Markdown ===
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" === Nvim TREE ===
lua <<EOF
require'nvim-tree'.setup {}
EOF
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_ignore = [ '.git', 'node_modules' ]
let g:nvim_tree_git_hl = 1
let g:nvim_tree_gitignore = 1
let g:nvim_tree_highlight_opened_files = 1

" === HOP ===
lua << EOF
require'hop'.setup()
EOF
nnoremap <leader><leader>w :HopWordAC<CR>
nnoremap <leader><leader>b :HopWordBC<CR>

" === Tree Sitter ===
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "python",
    "json",
    "json5",
    "php",
    "vim",
    "css",
    "html",
    "dockerfile",
    "vue",
    "lua",
    "go",
    "rust",
    "scss",
    "svelte",
    "tsx",
    "yaml",
  },
  highlight = {
    enable = true,
  },
}
EOF
