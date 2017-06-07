noremap <Leader>t :TagbarToggle<Cr>
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_width = 32

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

