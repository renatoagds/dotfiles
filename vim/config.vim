" == Mkdir Recursive (create folder if don't exists) ==
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

" == CronJOB ==
autocmd filetype crontab setlocal nobackup nowritebackup

" == FZF.Vim ==
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" == Automatic define filetype for Flow Files ==
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.flow set filetype=javascript.jsx
augroup END

" == Spotify Utilities (depend on shpotify) ===
function! s:callSpotify(args, type)
  let cmd = 'silent !spotify ' . a:type . ' ' . a:args . ' &> /dev/null'
  exec cmd
  exec 'redraw!'
endf

command! -nargs=1 SpotifyVol call s:callSpotify(<q-args>, 'vol')
command! SpotifyPlay call s:callSpotify('', 'play')
command! SpotifyPause call s:callSpotify('', 'pause')
command! SpotifyNext call s:callSpotify('', 'next')

" == ADB Utilities (depend on alias) ===
function! s:callADBCommand(command)
  let cmd = ''

  if a:command == "reload"
    let cmd = 'silent !adb shell input keyevent 82 && adb shell input keyevent 19 && adb shell input keyevent 23 &> /dev/null'
  elseif a:command == "shake"
    let cmd = 'silent !adb shell input keyevent 82 &> /dev/null'
  endif

  exec cmd
  exec 'redraw!'
endf

command! RReload call s:callADBCommand('reload')
command! RShake call s:callADBCommand('shake')

" == Terminal (map ESC to leave in terminal) ==
tnoremap <Esc> <C-\><C-n>

" == Tern for Vim
nnoremap <leader>tr :TernRefs<CR> <bar> :resize 5<CR>

" == Color Scheme ==
" let g:enable_bold_font = 1

" === Airline ===
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

" == UltiSnips ==
let g:UltiSnipsExpandTrigger="<leader>aa"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_javascript = {'semi': 'never'}

" === NerdTREE ===
nnoremap <C-\> :NERDTreeToggle<CR>
inoremap <C-\> <ESC>:NERDTreeToggle<CR>

" === Vim Javascript ===
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

" === NerdCommenter ===
let g:NERDSpaceDelims = 1

" == ALE ==
let g:ale_linters = {'javascript': ['eslint', 'flow'], 'python': ['flake8']}
let g:ale_linters_explicit = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:airline#extensions#ale#enabled = 1

" == Vim JSX ==
let g:jsx_ext_required = 0

" == FZF ==
nnoremap <C-T> :Files<CR>
inoremap <C-T> <ESC>:Files<CR>i

" == Javascript Libraries ==
let g:used_javascript_libs = 'underscore,jasmine,react,flux,vue'

" == Vim Matchmaker == 
let g:matchmaker_enable_startup = 1
let g:matchmaker_matchpriority = -1

" == ListToggle ==
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" == indentLine ==
let g:indentLine_color_term = 238

" == Tern
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" == Echodoc ==
let g:echodoc_enable_at_startup = 1

" == Deoplete ==
call deoplete#custom#option({'complete_method': 'omnifunc'})
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript',
  \ 'javascript.jsx',
  \ 'vue'
  \ ]


" == Flow ==
let g:flow#enable = 1
let g:flow#showquickfix = 0

" == Editor Config ==
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" == AutoPairs ==
let g:AutoPairsMapCh = 0

" == Insert mode navigation ==
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" == Space navigation
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" == Gutentags
let g:gutentags_cache_dir='~/.config/nvim/tags/'

" == Vim Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" == Neomake ==
" let g:neomake_warning_sign = {
" \ 'text': 'W',
" \ 'texthl': 'WarningMsg',
" \ }

" let g:neomake_error_sign = {
" \ 'text': 'E',
" \ 'texthl': 'ErrorMsg',
" \ }

" let g:makers = ['eslint', 'flow']
" let g:neomake_javascript_enabled_makers = g:makers
" let g:neomake_jsx_enabled_makers = g:makers
" autocmd! BufWritePost * Neomake

" == Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1

" === SnipMate ===
" :imap jj <Plug>snipMateNextOrTrigger
" :smap jj <Plug>snipMateNextOrTrigger
