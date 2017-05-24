set nocompatible

" Leader
let mapleader = ','

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
set complete+=kspell  " Autocomplete with dictionary words when spell check is on

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

" list chars
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

" theme
syntax enable                   " enable syntax highlighting
set number                      " show line numbers
set nowrap                      " don't wrap overflow text
set background=dark             " background is dark
let base16colorspace=256        " use 256 color palette
colorscheme base16-tomorrow-night     " set colortheme

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

" searching
set hlsearch    " highlight searches
set incsearch   " show matches as search is being typed
set ignorecase  " case-insensitive search
set smartcase   " case-sensitive search if there are any caps



" Keyboard shortcuts

" save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qall<CR>
cmap w!! w !sudo tee >/dev/null %

" toggle ignorecase
nnoremap <leader>i :set ignorecase!<CR>

" toggle relativenumber
nnoremap <leader>n :set relativenumber!<CR>

" make Y consistent with C and D
nnoremap Y y$

" remap C-a as tmux steals it
nnoremap <C-i> <C-a>

" copy / paste system clipboard
nnoremap <leader>p "+p
nnoremap <silent> <leader>y :set operatorfunc=<SID>SystemCopyOperator<cr>g@
vnoremap <silent> <leader>y :<c-u>call <SID>SystemCopyOperator(visualmode())<cr>

" show file path
nnoremap <leader>P :echom @%<cr>

" search project command (i.e. better grep)
nnoremap \ :Ag<SPACE>

" grep a selection (or current word)
nnoremap <silent> <leader>a :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <silent> <leader>a :<c-u>call <SID>GrepOperator(visualmode())<cr>
nnoremap <silent> <leader>A :silent execute "Ag " . shellescape(expand("<cWORD>")) . " ."<cr>

" replace a selection (or the current word)
nnoremap <silent> <leader>r :set operatorfunc=<SID>ReplaceOperator<cr>g@
vnoremap <silent> <leader>r :<c-u>call <SID>ReplaceOperator(visualmode())<cr>
nnoremap <leader>R :%s/<C-R><C-W>/

" add a selection to the search register
nnoremap <silent> <leader>s :set operatorfunc=<SID>SearchOperator<cr>g@
vnoremap <silent> <leader>s :<c-u>call <SID>SearchOperator(visualmode())<cr>

" fuzzy file searching
nnoremap <leader>t :CtrlP .<CR>

" fuzzy file searching in current buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" clear fuzzy file searching cache
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP .<CR>

" ctrl-N unhighlights search
nnoremap <silent> <C-N> :nohlsearch<CR>

" toggle file browser
nnoremap <leader>d :NERDTreeToggle<CR>

" find current file in file browser
nnoremap <leader>f :NERDTreeFind<CR>

" toggle git diff markers in gutter
nnoremap <leader>g :GitGutterToggle<CR>

" update tags
" nnoremap <leader>[ :!ctags -R .<CR>

" properly delete buffer
nnoremap <leader>c :Bclose<CR>

" splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" strip whitespace
nnoremap <leader><space> :call <SID>strip_trailing()<CR>

" align text blocks on a symbol
noremap <leader>l :Tabularize
nnoremap <leader>l= :Tabularize /=<CR>
vnoremap <leader>l= :Tabularize /=<CR>
nnoremap <leader>l: :Tabularize /:\zs<CR>
vnoremap <leader>l: :Tabularize /:\zs<CR>

" YCM and Tern GoTo Def shortcuts
nnoremap <leader>] :YcmCompleter GoTo<CR>
nnoremap <leader>} :TernDef<CR>

" cucumber bar/pipe align
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" rspec / tslime
" noremap <leader>R :call RunAllSpecs()<CR>
" noremap <leader>r :call RunCurrentSpecFile()<CR>
" noremap <leader>s :call RunNearestSpec()<CR>
" nnoremap <leader>b <Plug>SetTmuxVars

" edit / source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>el :vsplit $MYVIMRC.local<CR>
nnoremap <leader>eb :vsplit $MYVIMRC.bundles<CR>
nnoremap <leader>elb :vsplit $MYVIMRC.bundles.local<CR>
noremap <silent> <leader>es :source $MYVIMRC<CR>:execute ":echo 'vimrc reloaded'"<CR>
noremap <leader>eu :PluginUpdate<CR>
noremap <leader>ei :PluginInstall<CR>



" Navigation
nmap <leader>m ]m
nmap <leader>M [m

" window size management
" nnoremap <leader>. <C-w>>
" nnoremap <leader>, <C-w><
" nnoremap <leader>= <C-w>=

" window movement
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

" rails navigation
" nnoremap <leader>v :Eview<CR>
" nnoremap <leader>c :Econtroller<CR>
" nnoremap <leader>m :Emodel<CR>



" Plugin settings

let g:used_javascript_libs = 'jquery'                               " set jquery in the list of used libraries
let python_version_2 = 1                                            " python syntax settings
let g:ctrlp_match_window = 'order:ttb,max:20'                       " ???
let g:ctrlp_switch_buffer = 'H'                                     " Open a new instance of a buffer unless <c-x> is pressed
let g:gitgutter_enabled=0                                           " git gutter disabled by default
let g:html_indent_tags = 'li\|p'                                    " Treat <li> and <p> tags like the block tags they are
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}               " use cmatcher with ctrlp
let NERDTreeIgnore = ['\.pyc$']                                     " hide *.pyc files in NERDTree
let g:NERDSpaceDelims=1                                             " ???
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'         " rspec / tslime
let g:ycm_autoclose_preview_window_after_insertion = 1              " auto close preview window with ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*'] " force editorconfig to place nice with fugitive

" syntastic configruation
let g:syntastic_check_on_open=1                                     " use syntastic to check file on open
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_ruby_checkers = ['mri']                             " use mri and default for ruby
let g:syntastic_scss_checkers = ['scss_lint']                       " use scss-lint for Sass files
let g:syntastic_javascript_checkers = ['jshint', 'jscs']            " use jshint and jscs for javascript files
let g:syntastic_html_checkers = []                                  " no html checking
let g:syntastic_python_checkers = ['python', 'pyflakes']            " use pyflakes and default for python
let g:syntastic_aggregate_errors = 1                                " display results from all checkers

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
" let g:airline_theme='base16_tomorrow'
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
if !exists('g:airline_symbols')
  let g:airline_symbols = {}

  " unicode symbols
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif

" use silver searcher, when available
if executable('ag')
  " use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --ignore bower_components --ignore node_modules --ignore dist -U --nocolor -g ""'
endif



" Autocommands

augroup window_sizing
  autocmd!
  autocmd VimResized * :wincmd =      " automatically rebalance windows on vim resize
augroup END

augroup whitespace
  autocmd!
  autocmd BufWritePre * call <SID>strip_trailing() " Cleanup trailing whitespace on save
augroup END

" add filetype mappings
augroup filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" extra rails.vim help
" augroup rails_helpers
"   autocmd!
"   autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
"   autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
"   autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
"   autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
"   autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
"   autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" augroup END

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
augroup file_location
  autocmd!
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END



" Functions / Commands

" Ag command
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" align pipe seperated tables
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

" strip trailing whitespace
function! s:strip_trailing()
  let previous_search=@/
  let previous_cursor_line=line('.')
  let previous_cursor_column=col('.')
  %s/\s\+$//e
  let @/=previous_search
  call cursor(previous_cursor_line, previous_cursor_column)
endfunction

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

function! s:GetSelection(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'V'
    normal! `<V`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  let tmp = @@
  let @@ = saved_unnamed_register

  return tmp
endfunction

function! s:GrepOperator(type)
  let text = s:GetSelection(a:type)

  silent execute "grep! -R " . shellescape(text) . " ."
  copen
  redraw!
endfunction

function! s:SearchOperator(type)
  let @/ = s:GetSelection(a:type)
  " let text = s:GetSelection(a:type)
  " call search(text)
  " call matchadd('Search', text)
endfunction

function! s:SystemCopyOperator(type)
  let @+ = s:GetSelection(a:type)
endfunction

function! s:ReplaceOperator(type)
  call inputsave()

  let text = s:GetSelection(a:type)
  let replace = input("Replace [" . text . "] with: ", text)

  call inputrestore()

  execute "%s/" . text . "/" . replace . "/g"
endfunction



" Load any local settings
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
