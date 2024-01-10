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

" turn off bells
set vb
set t_vb=

" theme
syntax on                   " enable syntax highlighting
set number                      " show line numbers
set relativenumber              " show relative linenumbers
set nowrap                      " don't wrap overflow text
let g:dracula_italic = 0
color dracula

" fix for tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

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
nnoremap <leader>P "+P
nnoremap <silent> <leader>y :set operatorfunc=<SID>SystemCopyOperator<cr>g@
vnoremap <silent> <leader>y :<c-u>call <SID>SystemCopyOperator(visualmode())<cr>

" copy and show file path
nnoremap <leader>z :let @+ = expand("%")<cr>:echom @%<cr>

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

" ctrl-N unhighlights search
nnoremap <silent> <C-N> :nohlsearch<CR>

" FZF
nnoremap <leader>t :Files<cr>
nnoremap <leader>b :Buffers<cr>

" toggle file browser
nnoremap <leader>d :NERDTreeToggle<CR>

" find current file in file browser
nnoremap <leader>f :NERDTreeFind<CR>

" properly delete buffer
nnoremap <leader>c :Bclose<CR>

" splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" strip whitespace
nnoremap <leader><space> :call <SID>strip_trailing()<CR>

" edit / source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>evl :vsplit $MYVIMRC.local<CR>
nnoremap <leader>eb :vsplit $MYVIMRC.bundles<CR>
nnoremap <leader>ebl :vsplit $MYVIMRC.bundles.local<CR>
noremap <silent> <leader>es :source $MYVIMRC<CR>:execute ":echo 'vimrc reloaded'"<CR>


" Plugin settings

let g:html_indent_tags = 'li\|p'                                    " Treat <li> and <p> tags like the block tags they are
let NERDTreeIgnore = ['\.pyc$']                                     " hide *.pyc files in NERDTree
let g:NERDSpaceDelims=1                                             " ???
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*'] " force editorconfig to place nice with fugitive

" ale configuration
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 0
let g:ale_linters = {
\ 'typescript': ['tslint', 'tsserver'],
\ 'javascript': ['eslint'],
\ 'python': ['flake8', 'mypy'],
\}

" airline configuration
let g:airline_powerline_fonts = 0
let g:airline_theme='dracula'
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

  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.maxlinenr = ''
endif

" use silver searcher, when available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
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

if g:has_async
  set updatetime=300
  let g:ale_lint_on_text_changed = 0

  augroup linting
    autocmd!
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
  augroup END
else
  echoerr "dotfiles require NeoVim or Vim >= 8"
endif

" Functions / Commands

" Ag command
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

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






" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set hidden
set cmdheight=2
set shortmess+=c
set signcolumn=yes
" inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" Remap for rename current word
" nmap <leader>orn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>of  <Plug>(coc-format-selected)
" nmap <leader>of  <Plug>(coc-format-selected)

" augroup cocgroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

"   " Highlight symbol under cursor on CursorHold
"   autocmd CursorHold * silent call CocActionAsync('highlight')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>oa  <Plug>(coc-codeaction-selected)
" nmap <leader>oa  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>oac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>oqf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" "  Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" command! -nargs=0 Prettier :CocCommand prettier.formatFile
