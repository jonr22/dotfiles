set nocompatible

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on


" GUI specific stuff
if has("gui_running")
  set guioptions-=T " hide toolbar in gui
  set guioptions+=b " show bottom scroll bar

  " set window size
  set lines=36
  set columns=120
endif

" General
set autoread          " reload files when changed on disk, i.e. via `git checkout`
set history=1000      " remember commands
set tabpagemax=50     " maximum number of tab pages
set nrformats-=octal  " remove octal from <C-A> incrementing

set encoding=utf-8    " set file encoding
set fileformats+=mac  " default to mac EOLs

set laststatus=2      " always show status bar
set noshowmode        " use airline to show the mode
set showmatch         " show matching brackets
set showcmd           " show incomplete commands
set wildmenu          " show command line completion
" set wildmode=longest,list,full  " show a navigable menu for tab completion

set backspace=indent,eol,start  " ???
set complete-=i                 " ???

" wait 50ms for keycodes
set ttimeout
set ttimeoutlen=50

" no backup
set nobackup
set nowritebackup
set noswapfile

" Indenting
set tabstop=2     " tab is 2 spaces
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set shiftwidth=2  " auto-indent and >,< use 2 spaces
set shiftround    " always round >,< tabs to shiftwidth location
set expandtab     " expand tabs to spaces
set autoindent    " automatically do indenting
set smarttab      " <BS> will delete shiftwidth worth of space at start of line

" Folding
" set foldenable
" set foldmethod=syntax
" set foldcolumn=5
" set foldlevel=5

" Theme
syntax enable             " enable syntax highlighting
set number                " show line numbers
set nowrap                " don't wrap overflow text
set background=dark       " background is dark
let g:solarized_italic=0  " solarized italics don't look good
colorscheme solarized     " use solarized colors
call togglebg#map("<F9>") " Toggle light/dark colors with <leader>s

" open new split panes to right and bottom
set splitbelow
set splitright

" always show some margin space
set scrolloff=1       " always show a line above and below the cursor
set sidescrolloff=5   " always show 5 colums to the right of the cursor
set display+=lastline " ???

" Searching
set hlsearch    " highlight searches
set incsearch   " show matches as search is being typed
set ignorecase  " case-insensitive search
set smartcase   " case-sensitive search if there are any caps
" ctrl-N unhighlights
nnoremap <silent> <C-N> :nohlsearch<CR><C-N>

" Keyboard shortcuts
let mapleader = ','

" map easier window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" align text blocks on a symbol
map <leader>l :Tabularize
nmap <leader>l= :Tabularize /=<CR>
vmap <leader>l= :Tabularize /=<CR>
nmap <leader>l: :Tabularize /:\zs<CR>
vmap <leader>l: :Tabularize /:\zs<CR>

" grep replacement
nmap <leader>a :Ack
" toggle file browser
nmap <leader>d :NERDTreeToggle<CR>
" find current file in file browser
nmap <leader>f :NERDTreeFind<CR>
" fuzzy file searching
nmap <leader>t :CtrlP<CR>
" fuzzy file searching in current buffers
nmap <leader>b :CtrlPBuffer<CR>
" clear fuzzy file searching cache
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
" toggle ctag browser
nmap <leader>] :TagbarToggle<CR>
" toggle git diff markers in gutter
nmap <leader>g :GitGutterToggle<CR>
" update tags
nmap <leader>[ :!ctags -R .<CR>
" properly delete buffer
nnoremap <leader>c :Kwbd<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" hide *.pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

" rails naviagion
" nmap <leader>v :Eview<CR>
" nmap <leader>c :Econtroller<CR>
" nmap <leader>m :Emodel<CR>

" set vimrc path appropriately, and set command to reload vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nmap <leader><space> :call <SID>strip_trailing()<CR>

" Plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'            " ???
let g:ctrlp_switch_buffer = 'H'                          " Open a new instance of a buffer unless <c-x> is pressed
let g:NERDSpaceDelims=1                                  " ???
let g:gitgutter_enabled=0                                " git gutter disabled by default
let g:syntastic_check_on_open=1                          " use syntastic to check file on open
let g:syntastic_ruby_checkers = ['mri']                  " use mri and default for ruby
let g:syntastic_python_checkers = ['python', 'pyflakes'] " use pyflakes and default for python
let g:airline_powerline_fonts = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
let g:jedi#goto_assignments_command = "<leader><leader>g"
let g:jedi#goto_definitions_command = "<leader><leader>d"
let g:airline#extensions#syntastic#enabled = 0
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" use silver searcher, when available
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Autocommands
autocmd VimResized * :wincmd =      " automatically rebalance windows on vim resize
autocmd BufWritePre * call <SID>strip_trailing() " Cleanup trailing whitespace on save

" add filetype mappings
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml   " fdoc is yaml
autocmd BufRead,BufNewFile *.md set filetype=markdown " md is markdown

" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb

" Extra

" autocmd BufEnter * Rvm

" List chars
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

" allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" make Y consistent with C and D
nnoremap Y y$

" enable mouse interaction
set mouse=a
set ttymouse=xterm2

" repmap C-a as tmux steals it
nnoremap <C-q> <C-a>

" paste from clipboard
vmap <leader>y "+y
nmap <leader>p "+p

" rspec / tslime
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <leader>R :call RunAllSpecs()<CR>
map <leader>r :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
" nmap <leader>b <Plug>SetTmuxVars

" cucumber bar/pipe align
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Strip trailing whitespace
function! s:strip_trailing()
  let previous_search=@/
  let previous_cursor_line=line('.')
  let previous_cursor_column=col('.')
  %s/\s\+$//e
  let @/=previous_search
  call cursor(previous_cursor_line, previous_cursor_column)
endfunction

if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
