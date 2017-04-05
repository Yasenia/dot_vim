noremap <Leader>r :call Run()<Cr>

function Run()
    w
    if &filetype == 'python'
        :!time python3 %
    endif
endfunction
