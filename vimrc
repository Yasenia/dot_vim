" Vim 8+ configuration; paths do not depend on where the repository is checked out.
scriptencoding utf-8
set nocompatible
let g:dotvim_root = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'set runtimepath^=' . fnameescape(g:dotvim_root)
if filereadable(g:dotvim_root . '/local.vim')
  execute 'source ' . fnameescape(g:dotvim_root . '/local.vim')
endif
let g:dotvim_data_dir = get(g:, 'dotvim_data_dir',
      \ (empty($XDG_DATA_HOME) ? expand('~/.local/share') : $XDG_DATA_HOME) . '/dot_vim')
execute 'set runtimepath^=' . fnameescape(g:dotvim_data_dir)
execute 'set runtimepath+=' . fnameescape(g:dotvim_root . '/after')
let mapleader = ' '
for s:file in ['options', 'plugins', 'keymaps', 'autocmds']
  execute 'source ' . fnameescape(g:dotvim_root . '/config/' . s:file . '.vim')
endfor
unlet s:file
" vim-plug enables filetype support; retain a standalone fallback.
if !get(g:, 'dotvim_plugins_ready', 0)
  filetype plugin indent on
endif
if !exists('g:syntax_on')
  syntax enable
endif
if get(g:, 'dotvim_plugins_ready', 0) && isdirectory(g:dotvim_data_dir . '/plugged/gruvbox')
  colorscheme gruvbox
else
  colorscheme default
endif
