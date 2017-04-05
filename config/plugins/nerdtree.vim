autocmd vimenter * NERDTree
autocmd bufenter * call ExitIfOnlyNerdtree()
noremap <Leader>n :NERDTreeToggle<Cr>

function ExitIfOnlyNerdtree()
    if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree())
        q
    endif
endfunction
