set nocompatible
source $VIMRUNTIME/mswin.vim

"Pathogen
execute pathogen#infect()

"change <leader> to ,
let mapleader=','

"Hide toolbar in gui
set guioptions-=T

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

"Theme
syntax enable
set background=dark
let g:solarized_italic=0
colorscheme solarized
set encoding=utf-8 " Necessary to show Unicode glyphs

"AutoCompletion
filetype plugin on
set ofu=syntaxcomplete#Complete
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"map <F12> :set tags+=C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags<CR>
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags C:\code\sandbox\BATCH_NORTHAMERICA\Applications<CR>

"NERDTree
map <F2> :NERDTreeToggle<CR>

"Taglist
map <F3> :TlistToggle<CR>

"Powerline
set laststatus=2   " Always show the statusline
let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'

"SingleCompile
map <F4> :cope<CR>
map <F5> :SCCompileRun<CR>
map <F7> :SCCompile<CR>

