" Map ✠ (U+2720) to <S-Cr>, so we have <S-Cr> mapped to ✠ in iTerm2 and ✠ mapped back to <S-Cr> in Vim.
nmap ✠ <S-Cr> 
nnoremap <silent><S-Cr> o<Esc>
nnoremap <silent><C-l> :<C-u>nohlsearch<Cr><C-l>
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

