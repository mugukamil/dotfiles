" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------
" MacVim

if has('gui_macvim')
  set guifont=menlo\ for\ powerline:h16
  set linespace=15

  " Hide Toolbar in MacVim
  if has('gui_running')
    set guioptions-=T
    set guioptions-=r
    set go-=L
    set fu
  endif

 " Use option (alt) as meta key.
  set macmeta
endif

if has('macunix') || has('mac')
  " Fix meta key for Mac
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif
