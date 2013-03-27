"Pathogen
execute pathogen#infect()

"General
set number
set nowrap

"Indenting
set tabstop=4
set expandtab
set autoindent
set smartindent
set shiftwidth=4

"Folding
set foldenable
set foldmethod=syntax
set foldcolumn=5
set foldlevel=5

"Colors
syntax on
colorscheme elflord
"syntax enable
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

"AutoCompletion
filetype plugin on
set ofu=syntaxcomplete#Complete
"set tags+=/home/jon/Developer/profile/vim/tagfiles/usr_include
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"NERDTree
map <F2> :NERDTreeToggle<CR>

"Taglist
map <F3> :TlistToggle<CR>

"Syntastic
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_auto_loc_list=1

"Make / Rebuild / Clean
map <F6> :!clear; make<CR>
map <S-F6> :!clear; make clean; make<CR>
map <F7> :!clear; make debug<CR>
map <S-F7> :!clear; make clean; make debug<CR>
map <F8> :!clear; make clean; make lint<CR>
map <S-F8> :!clear; splint *.c<CR>
map <F9> :!clear; make clean<CR>

"Debug
map <F5> :!gdb<CR>
map <S-F5> :!make clean; make debug; gdb<CR>

