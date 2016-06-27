call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json'
Plug 'HTML-AutoCloseTag'
Plug 'hail2u/vim-css3-syntax'
Plug 'justinmk/vim-syntax-extra'
Plug 'tpope/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'file:///Users/mugukamil/.vim/bundle/vim-peepopen'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mklabs/vim-backbone'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'evidens/vim-twig'
Plug 'tpope/vim-surround'
Plug 'StanAngeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'ervandew/supertab'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'

" Add plugins to &runtimepath
call plug#end()

" ES6
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" NerdTree
let NERDTreeHijackNetrw = 0

" CtrlP
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'


