set nocompatible

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on



" General Settings
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

" enable mouse interaction
set mouse=a
set ttymouse=xterm2

" no backup
set nobackup
set nowritebackup
set noswapfile

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

" turn off bells
set vb
set t_vb=

" Theme
syntax enable                   " enable syntax highlighting
set number                      " show line numbers
set nowrap                      " don't wrap overflow text
set background=dark             " background is dark
let base16colorspace=256        " use 256 color palette
colorscheme base16-tomorrow     " set colortheme to tomorrow

" indenting
set tabstop=2     " tab is 2 spaces
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set shiftwidth=2  " auto-indent and >,< use 2 spaces
set shiftround    " always round >,< tabs to shiftwidth location
set expandtab     " expand tabs to spaces
set autoindent    " automatically do indenting
set smarttab      " <BS> will delete shiftwidth worth of space at start of line

" folding
" set foldenable
" set foldmethod=syntax
" set foldcolumn=5
" set foldlevel=5

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



" Keyboard shortcuts
let mapleader = ','

" Window Movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" make Y consistent with C and D
nnoremap Y y$
" repmap C-a as tmux steals it
nnoremap <C-q> <C-a>

" paste from clipboard
vmap <leader>y "+y
nmap <leader>p "+p

" Searching
" search project command
nnoremap \ :Ag<SPACE>
" grep the current word
nnoremap <leader>a :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" search the current word
nnoremap <leader>w /<C-R><C-W><CR>
" fuzzy file searching
nmap <leader>t :CtrlP .<CR>
" fuzzy file searching in current buffers
nmap <leader>b :CtrlPBuffer<CR>
" clear fuzzy file searching cache
nmap <leader>T :CtrlPClearCache<CR>:CtrlP .<CR>
" ctrl-N unhighlights search
nnoremap <silent> <C-N> :nohlsearch<CR>

" General mappings
" toggle file browser
nmap <leader>d :NERDTreeToggle<CR>
" find current file in file browser
nmap <leader>f :NERDTreeFind<CR>
" toggle git diff markers in gutter
nmap <leader>g :GitGutterToggle<CR>
" update tags
nmap <leader>[ :!ctags -R .<CR>
" properly delete buffer
nnoremap <leader>c :Bclose<CR>
" splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
" strip whitespace
nmap <leader><space> :call <SID>strip_trailing()<CR>
" set vimrc path appropriately, and set command to reload vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" align text blocks on a symbol
map <leader>l :Tabularize
nmap <leader>l= :Tabularize /=<CR>
vmap <leader>l= :Tabularize /=<CR>
nmap <leader>l: :Tabularize /:\zs<CR>
vmap <leader>l: :Tabularize /:\zs<CR>
" cucumber bar/pipe align
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" rails naviagion
" nmap <leader>v :Eview<CR>
" nmap <leader>c :Econtroller<CR>
" nmap <leader>m :Emodel<CR>

" rspec / tslime
map <leader>R :call RunAllSpecs()<CR>
map <leader>r :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
" nmap <leader>b <Plug>SetTmuxVars



" Plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'               " ???
let g:ctrlp_switch_buffer = 'H'                             " Open a new instance of a buffer unless <c-x> is pressed
let g:gitgutter_enabled=0                                   " git gutter disabled by default
let g:html_indent_tags = 'li\|p'                            " Treat <li> and <p> tags like the block tags they are
let NERDTreeIgnore = ['\.pyc$']                             " hide *.pyc files in NERDTree
let g:NERDSpaceDelims=1                                     " ???
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")' " rspec / tslime
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "context"
let g:syntastic_check_on_open=1                             " use syntastic to check file on open
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_ruby_checkers = ['mri']                     " use mri and default for ruby
let g:syntastic_scss_checkers = ['scss_lint']               " use scss-lint for Sass files
let g:syntastic_javascript_checkers = ['jshint', 'jscs']    " use jshint and jscs for javascript files
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'                             " set airline theme
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
let g:airline#extensions#default#section_truncate_width = {
  \ 'warning': 120,
  \ 'x': 100,
  \ 'y': 80,
  \ 'b': 60,
  \ 'z': 40,
  \ }
" use silver searcher, when available
if executable('ag')
  " use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
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

" use omnifunc by default for css with supertab
autocmd FileType css call SuperTabSetDefaultCompletionType("<c-x><c-o>")

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif



" Functions / Commands
" Ag command
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Align pipe seperated tables
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
"
" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
let bclose_multiple = 1

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')



" Load any local settings
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
