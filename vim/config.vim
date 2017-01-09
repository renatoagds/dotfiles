function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

function! FlowArgs()
  let g:file_path = expand('#:p')
  return ['-c', 'cat '.g:file_path.' | '.g:flow_path.' check-contents --json | flow-vim-quickfix --path='.g:file_path]
endfunction

"=== Airline ===
let g:airline_theme='bubblegum'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#displayed_head_limit = 10

"=== SnipMate ===
:imap jj <Plug>snipMateNextOrTrigger
:smap jj <Plug>snipMateNextOrTrigger

"=== Deoplete ===
let g:deoplete#file#enable_buffer_path = 1

"=== NerdTREE ===
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> <ESC>:NERDTreeToggle<CR>

"=== Vim Javascript ===
let g:javascript_plugin_flow = 1

"=== VimFlow ===
let g:flow#enable = 0
let g:flow#autoclose = 0
let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))

"=== NerdCommenter ===
let g:NERDSpaceDelims = 1

" == Deoplete ==
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deoplete#sources#flow#flow_bin = g:flow_path
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
set completeopt-=preview

" == Neomake ==
let g:flow_maker = {
\ 'exe': 'sh',
\ 'args': function('FlowArgs'),
\ 'errorformat': '%E%f:%l:%c\,%n: %m',
\ 'cwd': '%:p:h'
\ }

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
let g:neomake_javascript_flow_maker = g:flow_maker
let g:neomake_jsx_flow_maker = g:flow_maker

autocmd! BufWritePost * Neomake

" == Vim JSX ==
let g:jsx_ext_required = 0

" == FZF ==
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

" == Nerdtree ==
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>
