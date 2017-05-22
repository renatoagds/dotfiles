" === FUNCTIONS ==

" == Vim Flow Path

" function! StrTrim(txt)
  " return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
" endfunction

" let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

" == Vim Flow Current File

" function! FlowArgs()
  " let g:file_path = expand('%:p')
  " return ['-c', g:flow_path.' check-contents '.g:file_path.' < '.g:file_path.' --json | flow-vim-quickfix']
" endfunction

" === END FUNCTIONS ===

"== Color Scheme ==
let g:enable_bold_font = 1

"=== Airline ===
let g:airline_theme = "hybrid"
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

"=== SnipMate ===
:imap jj <Plug>snipMateNextOrTrigger
:smap jj <Plug>snipMateNextOrTrigger

"=== NerdTREE ===
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> <ESC>:NERDTreeToggle<CR>

"=== Vim Javascript ===
let g:javascript_plugin_flow = 1

"=== VimFlow ===
" let g:flow#enable = 0
" let g:flow#autoclose = 0

"=== NerdCommenter ===
let g:NERDSpaceDelims = 1

" == Deoplete ==
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
" let g:autocomplete_flow#flow_bin = g:flow_path
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
let g:deoplete#file#enable_buffer_path = 1
let g:tern#filetypes = [
\ 'jsx',
\ 'javascript.jsx'
\ ]
set completeopt-=preview

" == Neomake ==
" let g:flow_maker = {
" \ 'exe': 'sh',
" \ 'args': function('FlowArgs'),
" \ 'errorformat': '%E%f:%l:%c\,%n: %m',
" \ 'cwd': '%:p:h'
" \ }

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
" let g:neomake_javascript_flow_maker = g:flow_maker
" let g:neomake_jsx_flow_maker = g:flow_maker

autocmd! BufWritePost * Neomake

" == Vim JSX ==
let g:jsx_ext_required = 0

" == FZF ==
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

" == Nerdtree ==
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

" == TagBar ==
nmap <F8> :TagbarToggle<CR>

" == Javascript Libraries ==
let g:used_javascript_libs = 'underscore,jasmine,react,flux'

" == Vim Matchmaker == 
let g:matchmaker_enable_startup = 1
