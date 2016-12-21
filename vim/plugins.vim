call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'HTML-AutoCloseTag'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim'
Plug 'othree/html5.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'StanAngeloff/php.vim'
Plug 'jwalton512/vim-blade'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'ervandew/supertab'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'
Plug 'shawncplus/phpcomplete.vim'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
Plug 'hhsnopek/vim-sugarss'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kassio/vim-session_manager'
Plug 'jacoborus/tender'
Plug 'othree/javascript-libraries-syntax.vim'

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
let NERDTreeMinimalUI = 0
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.pyc$']

" CtrlP
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20,results:20'

" Tender Color scheme
let macvim_skip_colorscheme=1

"LightLine
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:h') . '/' . expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

"Airline
set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline_theme='powerlineish'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<c-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" js libraries
let g:used_javascript_libs = 'underscore,backbone, jquery, underscore, underscore, backbone, prelude, angularjs, angularui, angularuirouter, react, flux, requirejs, sugar, jasmine, chai, handlebars, ramda, vue, d3'
