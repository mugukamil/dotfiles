" Load vundle.vim
source ~/.vim/vundle.vim

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------
" MacVim

colorscheme xoria256
set guifont=menlo\ for\ powerline:h16
set guioptions-=T
set guioptions-=r
set go-=L
set fu
set linespace=15

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------

" ---------------
" Color
" ---------------
syntax enable
" Force 256 color mode if available
if $TERM =~ '-256color'
   set t_Co=256
endif

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
" -----------------------------
" File Locations
" -----------------------------
set backupdir=~/.vim/.backup// " Double // causes backups to use full file path
set directory=~/.vim/.tmp//
set spellfile=~/.vim/spell/custom.en.utf-8.add
" Persistent Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set number         " Line numbers on
set numberwidth=4
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file

" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the tooltips
  set balloondelay=100000
endif

"Show (partial) command in the status line
"set showcmd

" ---------------
" Behaviors
" ---------------
set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
" longest common part, then all.
set wildmode=longest,full
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set confirm            " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=400     " Time to wait for a command (after leader for example).
set ttimeout
set ttimeoutlen=100    " Time to wait for a key sequence.
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " I really don't like folds.
set formatoptions=crql
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=3        " Keep three lines below the last line when scrolling
set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists

" ---------------
" Text Format
" ---------------
set tabstop=4
set smarttab
set tags=tags
set softtabstop=4
set expandtab
set shiftwidth=4 " Tabs under smart indent
set shiftround
set backspace=indent,eol,start " Delete everything with backspace
set autoindent
set copyindent

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
  \rake-pipeline-*

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set nolist

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U
let g:session_autoload="no"

" ----------------------------------------
" Commands
" ----------------------------------------

" Silently execute an external command
" No 'Press Any Key to Contiue BS'
" from: http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
command! -nargs=1 SilentCmd
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" Fixes common typos
command! W w
command! Q q
" Restart Pow.cx for the Current App
command! PowRestart :SilentCmd touch tmp/restart.txt; touch tmp/.livereload.rb
command! Deploy :call VimuxRunCommand("mina deploy")

" Remove search results
command! H let @/=""


" ----------------------------------------
" Mappings
" ----------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=','
let g:mapleader = ','

" -----------------------
" Unmapped While Learning
" -----------------------

" No-op ^ and $ while learning H and L
noremap ^ <nop>
noremap $ <nop>
nnoremap <leader>sc <nop>

" ---------------
" Regular Mappings
" ---------------

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" Yank entire buffer with gy
nnoremap gy :0,$ y<cr>

" Select entire buffer
nnoremap vy ggVG

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap Y y$

" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
noremap H ^
noremap L $

" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j

" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" ---------------
" Window Movement
" ---------------
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"   4 Window Splits
"
"   -----------------
"   g1 | g2 | g3 | g4
"   -----------------
nnoremap <silent> g1 :WriteBufferIfNecessary<CR>:wincmd t<CR>
nnoremap <silent> g2 :WriteBufferIfNecessary<CR>:wincmd t<bar>:wincmd l<CR>
nnoremap <silent> g3 :WriteBufferIfNecessary<CR>:wincmd t<bar>:wincmd l<bar>
      \:wincmd l<CR>
nnoremap <silent> g4 :WriteBufferIfNecessary<CR>:wincmd b<CR>

" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" Swap Windows
nnoremap <silent> gx :wincmd x<CR>

" ---------------
" Modifer Mappings
" ---------------

" Make line completion easier.
inoremap <C-l> <C-x><C-l>
inoremap <C-l> <C-x><C-l>

" Scroll larger amounts with C-j / C-k
"nnoremap gj 15gjzz
"nnoremap gk 15gkzz
"vnoremap gj 15gjzz
"vnoremap gk 15gkzz

" ---------------
" Insert Mode Mappings
" ---------------

" Let's make escape better, together.
inoremap ii <Esc>
inoremap II <Esc>
inoremap Ii <Esc>
inoremap iI <Esc>

" ---------------
" Leader Mappings
" ---------------

" Clear search
noremap <silent><leader>/ :nohls<CR>

" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" Toggle spelling mode with ,s
nnoremap <silent> <leader>s :set spell!<CR>

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
"
" Example:
"          # Test 123
"          becomes
"          # --------
"          # Test 123
"          # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwvLr-^"lyyk"lP<cr>

" Format the entire file
nnoremap <leader>fef mx=ggG='x

" Format a json file with Underscore CLI
" Inspirited by https://github.com/spf13/spf13-vim/blob/3.0/.vimrc#L390
nnoremap <leader>gj <Esc>:%!underscore print<CR><Esc>:set filetype=json<CR>

" Split window vertically or horizontally *and* switch to the new split!
nnoremap <silent> <leader>hs :split<Bar>:wincmd j<CR>:wincmd =<CR>
nnoremap <silent> <leader>vs :vsplit<Bar>:wincmd l<CR>:wincmd =<CR>

" Close the current window
nnoremap <silent> ∑ :close<CR>

" ---------------
" Typo Fixes
" ---------------

noremap <F1> <Esc>
inoremap <F1> <Esc>
cnoremap w' w<CR>

" Disable the ever-annoying Ex mode shortcut key. Type visual my ass. Instead,
" make Q repeat the last macro instead. *hat tip* http://vimbits.com/bits/263
nnoremap Q @@

" Removes doc lookup mapping because it's easy to fat finger and never useful.
nnoremap K k
vnoremap K k

" Toggle paste mode with F5
nnoremap <silent> <F5> :set paste!<CR>

" Paste and select pasted
nnoremap <expr> gpp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Paste and select pasted
nnoremap gp :normal pgp<cr>

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" copy current file name (relative/absolute) to system clipboard
" from http://stackoverflow.com/a/17096082/22423
if has('mac') || has('gui_macvim') || has('gui_mac')
  " relative path  (src/foo.txt)
  nnoremap <silent> <leader>yp :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <silent> <leader>yP :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <silent> <leader>yf :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <silent> <leader>yd :let @*=expand("%:p:h")<CR>
endif

map <silent><leader>, :NERDTreeToggle<CR>

" Fast saves
nmap <leader>w :w!<cr>

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Load the current buffer in Chrome
nnoremap ,c :!open -a Google\ Chrome<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<leader>'

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-r> :CtrlPBufTag<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nnoremap <silent> <leader>z :QuickSpellingFix<CR>

" ---------------
" Convert Ruby 1.8 hash rockets to 1.9 JSON style hashes.
" From: http://git.io/cxmJDw
" Note: Defaults to the entire file unless in visual mode.
" ---------------
command! -bar -range=% NotRocket execute
  \'<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/e' . (&gdefault ? '' : 'g')

" ------------------------------------
" Convert .should rspec syntax to expect.
" From: https://coderwall.com/p/o2oyrg
" ------------------------------------
command! -bar -range=% Expect execute
  \'<line1>,<line2>s/\(\S\+\).should\(\s\+\)==\s*\(.\+\)' .
  \'/expect(\1).to\2eq(\3)/e' .
  \(&gdefault ? '' : 'g')

" ---------------
" Strip Trailing White Space
" ---------------
" From http://vimbits.com/bits/377
" Preserves/Saves the state, executes a command, and returns to the saved state
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
function! StripTrailingWhiteSpaceAndSave()
  :call Preserve("%s/\\s\\+$//e")<CR>
  :write
endfunction
command! StripTrailingWhiteSpaceAndSave :call StripTrailingWhiteSpaceAndSave()<CR>
nnoremap <silent> <leader>stw :silent! StripTrailingWhiteSpaceAndSave<CR>

" ---------------
" Paste using Paste Mode
"
" Keeps indentation in source.
" ---------------
function! PasteWithPasteMode()
  if &paste
    normal p
  else
    " Enable paste mode and paste the text, then disable paste mode.
    set paste
    normal p
    set nopaste
  endif
endfunction

command! PasteWithPasteMode call PasteWithPasteMode()
nnoremap <silent> <leader>p :PasteWithPasteMode<CR>

" ---------------
" Write Buffer if Necessary
"
" Writes the current buffer if it's needed, unless we're the in QuickFix mode.
" ---------------

function WriteBufferIfNecessary()
  if &modified && !&readonly
    :write
  endif
endfunction
command! WriteBufferIfNecessary call WriteBufferIfNecessary()

function CRWriteIfNecessary()
  if &filetype == "qf"
    " Execute a normal enter when in Quickfix list.
    execute "normal! \<enter>"
  else
    WriteBufferIfNecessary
  endif
endfunction

" Clear the search buffer when hitting return
" Idea for MapCR from http://git.io/pt8kjA
function! MapCR()
  nnoremap <silent> <enter> :call CRWriteIfNecessary()<CR>
endfunction
call MapCR()

" ---------------
" Make a scratch buffer with all of the leader keybindings.
"
" Adapted from http://ctoomey.com/posts/an-incremental-approach-to-vim/
" ---------------
function! ListLeaders()
  silent! redir @b
  silent! nmap <LEADER>
  silent! redir END
  silent! new
  silent! set buftype=nofile
  silent! set bufhidden=hide
  silent! setlocal noswapfile
  silent! put! b
  silent! g/^s*$/d
  silent! %s/^.*,//
  silent! normal ggVg
  silent! sort
  silent! let lines = getline(1,"$")
  silent! normal <esc>
endfunction

command! ListLeaders :call ListLeaders()

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

function! YankLineWithoutNewline()
  let l = line(".")
  let c = col(".")
  normal ^y$
  " Clean up: restore previous search history, and cursor position
  call cursor(l, c)
endfunction

nnoremap <silent>yl :call YankLineWithoutNewline()<CR>

" Show the word frequency of the current buffer in a split.
" from: http://vim.wikia.com/wiki/Word_frequency_statistics_for_a_file
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  new
  setlocal buftype=nofile bufhidden=hide noswapfile tabstop=20
  for [key,value] in items(frequencies)
    call append('$', key."\t".value)
  endfor
  sort i
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
" ----------------------------------------
" Auto Commands
" ----------------------------------------

augroup MyAutoCommands
  " Clear the auto command group so we don't define it multiple times
  " Idea from http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
  autocmd!
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Fix trailing whitespace in my most used programming langauges
  autocmd BufWritePre *.py,*.coffee,*.rb,*.erb,*.md,*.scss,*.vim,Cakefile,
        \*.hbs
        \ silent! :StripTrailingWhiteSpace

  " Help mode bindings
  " <enter> to follow tag, <bs> to go back, and q to quit.
  " From http://ctoomey.com/posts/an-incremental-approach-to-vim/
  autocmd filetype help nnoremap <buffer><cr> <c-]>
  autocmd filetype help nnoremap <buffer><bs> <c-T>
  autocmd filetype help nnoremap <buffer>q :q<CR>

  " Fix accidental indentation in html files
  " from http://morearty.com/blog/2013/01/22/fixing-vims-indenting-of-html-files.html
  autocmd FileType html setlocal indentkeys-=*<Return>

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  " Resize splits when the window is resized
  " from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
  au VimResized * :wincmd =

  autocmd cursorhold * set nohlsearch

  "NERDTree and Startify working at startup
  autocmd VimEnter *
        \   if !argc()
        \ |   Startify
        \ |   NERDTree
        \ |   wincmd w
        \ | endif

augroup END
