set nocompatible " be iMproved

so ~/.vim/plugins.vim

set backspace=indent,eol,start
syntax on
let mapleader=','
set number
set noerrorbells visualbell t_vb=
set nofoldenable
let g:DisableAutoPHPFolding = 1
set autowriteall
set complete=.,w,b,u
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set showcmd
set hidden
set title
set nobackup
set noswapfile
set autoindent
set smartindent
set smarttab
set copyindent
set list
set list listchars=tab:»·,trail:·
set wildmenu

"set timeout timeoutlen=200 ttimeoutlen=100

let @a="yiw/}O$this->iipa = iia$iipa;ii€ýb€ýa?constOOprotected $pa;"

highlight Search cterm=underline

"-------------Visuals---------------"
colorscheme atom-dark-256
set t_Co=256

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi CursorLineNR guibg=#333333
set cursorline


"We'll fake a custom left padding for each window.
"hi LineNr guibg=bg
"set foldcolumn=0
"hi foldcolumn guibg=bg

"Get rid of ugly split borders
hi vertsplit guifg=bg guibg=grey

"--------------Search---------------"
set hlsearch
set incsearch
set ignorecase



"--------------Split Managment---------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>


"--------------Mappings---------------"

"Exit insert mode by ii
imap ii <Esc>

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabe $MYVIMRC<cr>

"Make it easy to edit snippets file.
nmap <Leader>es :e ~/.vim/snippets/

"Make it easy to edit plugins file.
nmap <Leader>ep :tabe ~/.vim/plugins.vim<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

nmap ; :

"Fast saves
nmap <Leader>w :w!<cr>

"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome %<cr>

"NerdTree Toggle
nmap <C-b> :NERDTreeToggle<cr>

"CtrlP
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**

nmap <Leader>f :tag<space>

"Greplace.vim
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

"php-cs-fixer
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>



"--------------Laravel-Specific---------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader>lv :e resources/views/<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>




"--------------Abbreviations---------------"
abbrev gm !php artisan generate:mode
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration


"--------------Auto-Commands---------------"

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc so %
augroup END


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

augroup iphp
    autocmd!
    autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

    autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
    autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>
augroup END

augroup whitespaces
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

augroup autosave
    autocmd BufLeave,FocusLost * silent! wall
augroup END


"Sort PHP use statements
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

