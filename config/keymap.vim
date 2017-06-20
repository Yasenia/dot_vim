nnoremap <silent><C-l> :<C-u>nohlsearch<Cr><C-l>
nnoremap <silent><S-Cr> o<Esc>
nnoremap <Leader>r :call Run()<Cr>
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p

function Run()
    w
    if &filetype == 'sh'
        :!time sh % 
    endif
    if &filetype == 'python'
        :!time python3 %
    endif
endfunction
