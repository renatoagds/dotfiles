"=== Profile Configuration ===
filetype plugin on
syntax enable
let mapleader=","

" === Color Scheme
set background=dark
colorscheme hybrid_reverse

" === Options
set cmdheight=2
set foldmethod=manual
set completeopt-=preview
set showcmd                  " Show (partial) command in status line.
set showmatch                " Show matching brackets.
set showmode                 " Show current mode.
set ruler                    " Show the line and column numbers of the cursor.
set number                   " Show the line numbers on the left side.
set relativenumber           " Show the relative numbers on the left side.
set formatoptions+=o         " Continue comment marker in new lines.
set textwidth=0              " Hard-wrap long lines as you type them.
set expandtab                " Insert spaces when TAB is pressed.
set tabstop=2                " Render TABs using this many spaces.
set shiftwidth=2             " Indentation amount for < and > commands.
set noerrorbells             " No beeps.
set modeline                 " Enable modeline.
set esckeys                  " Cursor keys in insert mode.
set linespace=0              " Set line-spacing to minimum.
set nojoinspaces             " Prevents inserting two spaces after punctuation on a join (J)
set splitbelow               " Horizontal split below current.
set splitright               " Vertical split to right of current.

if !&scrolloff
  set scrolloff=6            " Show next 3 lines while scrolling.
endif

if !&sidescrolloff
  set sidescrolloff=5        " Show next 5 columns while side-scrolling.
endif

set display+=lastline
set nostartofline            " Do not jump to first character with page commands.

if (has("termguicolors"))    " Set 16m colors
 set termguicolors
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
