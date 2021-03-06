set nocompatible  " Use Vim defaults instead of 100% vi compatibility

set background=dark
set guifont=Monaco:h14
set wrap
map j gj
map k gk

set mouse=a

" 256 color theme molokai
if has('unix')
    set t_Co=256
    hi Normal  ctermbg=none
elseif has('win32')
    colorscheme desert
endif

set nu
" keep 50 lines of command line history
set history=50
" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

if has('mouse')
    set mouse=a
endif

" cut, copy
vnoremap <C-x> "+x
vnoremap <C-c> "+y
" paste in normal/insert/command mode
map <C-v> "+gP
imap <C-v> <C-R>+
cmap <C-v> <C-R>+


" infomative status line
" format, by default, vim does not show the status line at all.
set statusline=%F%m%r%h%w\[FORMAT=%{&ff}]\[TYPE=%Y]\[POS=%04l,%04v][%p%%]\[LEN=%L] 
" always shown, shown as the second last line in the editor window
set laststatus=2 " 

" ------- default settings, redefine it in script settings------
" encoding
set fileencodings=utf-8,gb18030,gbk " open file with
" set encoding=utf-8  " vim cache encoding
" set fileencoding=utf-8 " save file with


" tabs
set tabstop=4 " tab width 
set shiftwidth=4 " width of nested tabs
set expandtab " input spaces instead of tab when typing a tab
set softtabstop=4 " 1. space deleted when typing <BackSpace>
" show tabs
set listchars=tab:>.
set list

" -------------- ctags ----------------
if has('win32')
    let Tlist_Ctags_Cmd='$HOME\vimfiles\exec\ctags.exe'
endif
set tags=tags;,~/.vim/tags/cpp/tags  " ; 不可省略，表示若当前目录不存在 tags，则在父目录找
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let omniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" ------------- taglist ---------------
let Tlist_Exit_OnlyWindow=1  " exit vim when taglist is last window
let Tlist_File_Fold_Auto_Close=1  " fold tags of other windows
" let Tlist_Inc_Winwidth=0  " terminal/console version can't change the window width

" ---------- python dev env -----------
" autocmd BufWritePost *.py call Flake8()
let g:flake8_max_complexity=10

if has('unix')
    autocmd filetype python map <F5> :!python %<CR>
elseif has('win32')
    autocmd filetype python map <F5> :!python.exe %<CR>
endif

" ---------- cpp dev env ------------------
autocmd filetype cpp map <F7> :!g++ -o main %<CR>
if has('unix')
    autocmd filetype cpp map <F5> :!./main<CR>
elseif has('win32')
    autocmd filetype cpp map <F5> :!main.exe<CR>
endif

autocmd filetype make set noexpandtab

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
"Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'
call plug#end()

map <F3> :NERDTreeToggle<CR>
map <F4> :new term://bash<CR>
map <F6> :bn<CR>
syntax on

" Parentheses Match
hi MatchParen cterm=bold ctermbg=none ctermfg=blue
hi Error NONE

