set nocompatible " be iMproved

so ~/.vim/plugins.vim

set backspace=indent,eol,start
syntax enable
let mapleader=','
set nonumber
set noerrorbells visualbell t_vb=
set nofoldenable
let g:DisableAutoPHPFolding = 1
set autowriteall
set complete=.,w,b,u
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

let @a="yiw/}O$this->iipa = iia$iipa;ii€ýb€ýa?constOOprotected $pa;"


"-------------Visuals---------------"
colorscheme atom-dark
set t_Co=256
set macligatures
set guifont=Fira_Code:h14
set linespace=15

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window.
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

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

"NerdTree Toggle
nmap <C-b> :NERDTreeToggle<cr>

"CtrlP
nmap <D-p> :CtrlP<cr>
nmap <D-r> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

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
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>


"--------------Auto-Commands---------------"

"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc so %
augroup END


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


"Sort PHP use statements
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>



" Notes and Tips
" 
