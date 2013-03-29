set nocompatible
if has("win32")
    source $VIMRUNTIME/mswin.vim

    "For Work
    map <F12> :set tags+=C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags<CR>
    map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags C:\code\sandbox\BATCH_NORTHAMERICA\Applications<CR>
endif

if has("gui_running")
    "Hide toolbar in gui
    set guioptions-=T
    autocmd VimEnter * if expand('%') != "" | cd %:h | endif
endif

"Pathogen
execute pathogen#infect()

"change <leader> to ,
let mapleader=','

"General
set number
set nowrap

"Indenting
set tabstop=4
set expandtab
set cindent
set shiftwidth=4

"Folding
set foldenable
set foldmethod=syntax
set foldcolumn=5
set foldlevel=5

"Colors
syntax enable
set background=dark
let g:solarized_italic=0
set t_Co=16
colorscheme solarized
set encoding=utf-8

"AutoCompletion
filetype plugin on
set ofu=syntaxcomplete#Complete
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"NERDTree
map <F2> :NERDTreeToggle<CR>

"Taglist
map <F3> :TlistToggle<CR>

"Syntastic
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_auto_loc_list=1

"Powerline
set laststatus=2 "Always show the statusline
let g:Powerline_colorscheme = 'solarized256'

