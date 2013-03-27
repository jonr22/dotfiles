set nocompatible
source $VIMRUNTIME/mswin.vim

"Pathogen
execute pathogen#infect()

let mapleader=','

"Hide toolbar in gui
set guioptions-=T

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
colorscheme solarized

"AutoCompletion
filetype plugin on
set ofu=syntaxcomplete#Complete
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F12> :set tags+=C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags<CR>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags C:\code\sandbox\BATCH_NORTHAMERICA\Applications<CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"NERDTree
map <F2> :NERDTreeToggle<CR>

"Taglist
map <F3> :TlistToggle<CR>

"Make / Rebuild / Clean
"map <F6> :!clear; make<CR>
"map <S-F6> :!clear; make clean; make<CR>
"map <F7> :!clear; make debug<CR>
"map <S-F7> :!clear; make clean; make debug<CR>
"map <F8> :!clear; make clean; make lint<CR>
"map <S-F8> :!clear; splint *.c<CR>
"map <F9> :!clear; make clean<CR>

"Debug
"map <F5> :!gdb<CR>
"map <S-F5> :!make clean; make debug; gdb<CR>

