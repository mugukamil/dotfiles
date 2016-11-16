if has("gui_macvim")
    colorscheme atom-dark
    highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

    set macligatures
    set guifont=fira_code:h15
    set linespace=20
    set foldcolumn=0
    hi foldcolumn guibg=bg

    macmenu &File.Print key=<nop>
endif
