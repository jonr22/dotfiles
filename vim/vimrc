set nocompatible

"Pathogen
execute pathogen#infect()

"Windows specific stuff
if has("win32")
    source $VIMRUNTIME/mswin.vim

    "For Work
    map <F12> :set tags+=C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags<CR>
    map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f C:\code\sandbox\BATCH_NORTHAMERICA\Applications\tags C:\code\sandbox\BATCH_NORTHAMERICA\Applications<CR>
 
    "SingleCompile (use singlecompile on windows, as syntastic and :make don't work well
    map <F4> :cope<CR>
    map <F5> :SCCompileRun<CR>
    map <F7> :SCCompile<CR>
else "unix/linux/mac
    "Syntastic
    let g:syntastic_c_checkers = ['gcc']
    let g:syntastic_auto_loc_list=1
endif

"GUI specific stuff
if has("gui_running")
    "Hide toolbar in gui
    set guioptions-=T

    "set window size
    set lines=36
    set columns=120

    "Unix/Linux GUI doesn't change the pwd to the dir of the opened file
    if has("unix")
        autocmd VimEnter * if expand('%') != "" | cd %:h | endif
    endif
endif

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

"Theme
syntax enable
set background=dark
let g:solarized_italic=0
set t_Co=16
colorscheme solarized
set encoding=utf-8
call togglebg#map("<leader>s") "Toggle light/dark colors with <leader>s

"AutoCompletion
filetype plugin on
set ofu=syntaxcomplete#Complete
map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"NERDTree
map <F2> :NERDTreeToggle<CR>

"Taglist
map <F3> :TagbarToggle<CR>

"Powerline
set laststatus=2 "Always show the statusline
let g:Powerline_colorscheme = 'solarized256'

