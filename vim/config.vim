" == Helpers ==
augroup Mkdir " == create folder if don't exists
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" == Color Scheme ==
" let g:enable_bold_font = 1

" === Airline ===
let g:airline_theme = "tender"
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

" === SnipMate ===
" :imap jj <Plug>snipMateNextOrTrigger
" :smap jj <Plug>snipMateNextOrTrigger

" == UltiSnips ==
let g:UltiSnipsExpandTrigger="<leader>aa"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" === NerdTREE ===
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> <ESC>:NERDTreeToggle<CR>

" === Vim Javascript ===
let g:javascript_plugin_flow = 1

" === NerdCommenter ===
let g:NERDSpaceDelims = 1

" == Neomake ==
let g:neomake_warning_sign = {
\ 'text': 'W',
\ 'texthl': 'WarningMsg',
\ }

let g:neomake_error_sign = {
\ 'text': 'E',
\ 'texthl': 'ErrorMsg',
\ }

let g:makers = ['eslint']
let g:neomake_javascript_enabled_makers = g:makers
let g:neomake_jsx_enabled_makers = g:makers
autocmd! BufWritePost * Neomake

" == Vim JSX ==
let g:jsx_ext_required = 0

" == FZF ==
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

" == Javascript Libraries ==
let g:used_javascript_libs = 'underscore,jasmine,react,flux'

" == Vim Matchmaker == 
let g:matchmaker_enable_startup = 1
let g:matchmaker_matchpriority = -1

" == ListToggle ==
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" == Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
