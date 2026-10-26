nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <Leader>r :<C-u>call dotvim#run()<CR>
xnoremap p "_dP
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>- vui_<Esc>
nnoremap <Leader>C /\u<CR>:nohlsearch<CR>
" No hidden writes when navigating. Ctrl-I/Tab keep their normal meaning.
nnoremap <silent> [b :<C-u>bprevious<CR>
nnoremap <silent> ]b :<C-u>bnext<CR>
nnoremap <silent> [<Space> O<Esc>j
nnoremap <silent> ]<Space> o<Esc>k
" Use the installed directory, since plugin commands may load after vimrc.
if get(g:, 'dotvim_plugins_ready', 0)
  if isdirectory(g:dotvim_data_dir . '/plugged/nerdtree')
    nnoremap <silent> <Leader>n :<C-u>NERDTreeToggle<CR>
  endif
  if isdirectory(g:dotvim_data_dir . '/plugged/ctrlp.vim')
    nnoremap <silent> <Leader>a :<C-u>CtrlP<CR>
  endif
  if g:dotvim_enable_tagbar && isdirectory(g:dotvim_data_dir . '/plugged/tagbar')
    nnoremap <silent> <Leader>t :<C-u>TagbarToggle<CR>
  endif
  if g:dotvim_enable_ale && isdirectory(g:dotvim_data_dir . '/plugged/ale')
    nnoremap <silent> <Leader>f :<C-u>ALEFix<CR>
  endif
endif
