if has('python3')
endif

let g:pymode_python = 'python3'
"let g:pymode_rope = 0
" Enter the current millenium
set nocompatible

" Enable syntax and plugins (for netrw)
syntax enable
filetype plugin indent on

" Normalize splits
set splitbelow
set splitright

" Omni completion
"set omnifunc=syntaxcomplete#Complete

" Completor
" Use TAB to select completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Show matching brackets and parens
set showmatch


" FINDING FILES:

" Recursively search down the folder structure
" and provide tab-completion
set path+=**

" Use pop-up menu for tab completion of filenames
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
"   using any unique substring


" Set character encoding
set encoding=utf-8

"Show 3 lines above or below cursor when scrolling
set scrolloff=3

" Show command in last line
set showcmd

" Searching
" --------------
"  Highlight matches in search
set hlsearch

" Turn off search highlighting when done
nnoremap <Leader><Space> :nohlsearch<CR>


set autoindent
set ic
set ruler
set number
set rnu
set cursorline


" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

au BufNewFile,BufRead *.js,*.jsx,*.html,*.css,*.scss,*.rb,*.jl
    \ set tabstop=2
    \ | set softtabstop=2
    \ | set shiftwidth=2
    \ | set expandtab


au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=79
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix




" Python stuff
"" Flagging unnecessary whitespace
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"" Virtualenv support
py << EOF
import os
import sys
if 'VIRUTAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, "bin/activate_this.py")
  execfile(activate_this, dict(__file__=activate_this))
EOF

"" Syntastic Linter
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"" Ale Linter
""" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
""" You can disable this option too
""" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
""" For reference
"g:ale_lint_on_save to 0
""" Show 5 lines of errors (default: 10)
"let g:ale_list_window_size = 5


"Theme, Look and Feel
packadd! onedark.vim

"let g:onedark_termcolors=256
"let g:onedark_termcolors=16
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
colorscheme onedark

" let g:airline_theme='dracula'
" colorscheme dracula



if has('gui_running')
  "set guifont=Hack\ 12
  if has('gui_macvim')
    set guifont=InconsolataForPowerline-dz:h12 " OSX
  else
    set guifont=InconsolataForPowerline-dz\ 12 " Linux
  endif
else
  " Add terminal colorscheme here. 
endif

" set statusline=%.20F		"file path
" set statusline+=\ -\ 		"separator
" set statusline+=FileType:
" set statusline+=%y		"file type
" set statusline+=%=		"switch to right side
" set statusline+=%-4l		"row number
" set statusline+=:
" set statusline+=%-4L		"total rows
" set laststatus=2		"display status always

set guioptions-=L
set guioptions-=R
set guioptions=

let g:airline_powerline_fonts = 1


" IndentLines
let g:indentLine_char = ""
set list lcs=tab:\|\ 

" Emmet
"let g:user_emmet_install_global = 0
"autocmd FileType html,erb,css,jsx EmmetInstall
let g:user_emmet_leader_key = ","
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\    'extends' : 'jsx',
\  },
\}



" NERDTree
" ------------
map <C-n> :NERDTreeToggle<CR>
" Jump to NerdTree window from any other window
map <Leader>r :NERDTreeFind<CR>
autocmd BufWinEnter * NERDTreeFind
" Press this inside any open file in vim and will jump to the nerdtree and
" highlight where that file is -- leave off for now
" map ] :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Distraction Free Mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" Netrw
"let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * :Vexplore
augroup END


" Ruby Stuff
" -----------------------------------------
set rubydll=/System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/lib/libruby.2.3.0.dylib



" Signify -- Git 
" Leave it off for now
let g:signify_disable_by_default = 1

" Tags
nmap <F8> :TagbarToggle<CR> 


"Mappings
inoremap <C-u> <esc>vawUA
nnoremap <C-u> vawUw

"" Split Navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"" New Escape
inoremap <C-[> <Esc>
