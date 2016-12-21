if has("gui_macvim")
    colorscheme tender
    highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

    set macligatures
    set guifont=fira_code:h18
    set linespace=20
    set foldcolumn=0
    set lines=17
    set columns=142
    hi foldcolumn guibg=bg

    macmenu &File.Print key=<nop>
endif
