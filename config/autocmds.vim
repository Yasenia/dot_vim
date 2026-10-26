augroup DotVimCursor
  autocmd!
  autocmd InsertEnter * setlocal cursorline
  autocmd InsertLeave * setlocal nocursorline
augroup END
