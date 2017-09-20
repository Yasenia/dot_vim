nnoremap <silent><C-l> :<C-u>nohlsearch<Cr><C-l>
nnoremap <silent><S-Cr> o<Esc>
nnoremap <Leader>r :call Run()<Cr>
xnoremap p "_dP
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>f :Autoformat<CR>

function Run()
    w
    if &filetype == 'sh'
        :!time sh %
    endif
    if &filetype == 'python'
        :!time python3 %
    endif
endfunction

