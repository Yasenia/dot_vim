set encoding=utf-8
set number colorcolumn=120 nospell spelllang=en_us
set history=1000 hlsearch wildmode=list:longest
set suffixesadd+=.java,.scala,.sc,.groovy,.js,.ts,.json,.py,.rb,.yml,.yaml,.conf,.xml
set noerrorbells visualbell
set autoindent tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set backspace=indent,eol,start hidden
set laststatus=2
if has('termguicolors')
  set termguicolors
endif
if has('gui_running')
  set guioptions-=L
  set guioptions-=r
  set guioptions-=T
endif
" Keep undo/backup files outside Git; leave swap handling to Vim defaults.
for s:kind in ['undo', 'backup']
  call mkdir(g:dotvim_data_dir . '/' . s:kind, 'p', 0700)
endfor
let &undodir = g:dotvim_data_dir . '/undo//'
let &backupdir = g:dotvim_data_dir . '/backup//'
if has('persistent_undo')
  set undofile
endif
unlet s:kind
