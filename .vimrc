" Disable compatibility with vi which can cause unexpected issues.
set nocompatible


call plug#begin('/Users/aharo/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-clang-format'

Plug 'tpope/vim-fugitive'
Plug 'slashmili/alchemist.vim'
Plug 'shougo/vimproc.vim'
Plug 'vim-scripts/L9'
Plug 'rickharris/vim-railscasts'
Plug 'junegunn/seoul256.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-bufferline'
Plug 'mg979/vim-visual-multi'
Plug 'kien/ctrlp.vim'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-markdown'

Plug 'checkstyle/checkstyle'
Plug 'ervandew/eclim'


Plug 'neoclide/coc.nvim'
Plug 'coc-clangd '
call plug#end()



























filetype plugin indent on    " required
set nocompatible              " be iMproved, required
" Enable plugins and load plugin for the detected file type.
filetype plugin on

" IMPORTANT ***************
filetype indent off

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

set background=dark


"OFF"set spell	" Enable spell-checking
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set errorbells	" Beep or flash screen on errors
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 

set cursorline " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn " Highlight cursor line underneath the cursor vertically.
set wildmenu " Enable auto completion menu after pressing TAB.
set wildmode=list:full " Make wildmenu behave like similar to Bash completion.

set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

		" Immediately add a closing quotes or braces in insert mode.
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
set mouse=a

"OFF"set autoindent	" Auto-indent new lines
"OFF"set shiftwidth=4	" Number of auto-indent spaces
"OFF"set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs



set confirm	" Prompt confirmation dialogs
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour




inoremap jj <esc>

let mapleader = ","

nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F10> :cprevious<Return>
map <F11> :cnext<Return>















map <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python2.7 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc






let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>














let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = './checkstyle-8.4-all.jar'
let g:syntastic_java_checkstyle_conf_file = './checkstyle.xml'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



















	" NERDTree Settings
nnoremap <C-z> :NERDTreeToggle <CR>
	" Window Navigation with Ctrl-[hjkl]
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

