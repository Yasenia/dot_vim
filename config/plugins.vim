" One feature switch controls declaration, settings and mappings.
let g:dotvim_enable_tagbar = get(g:, 'dotvim_enable_tagbar', 0)
let g:dotvim_enable_ale = get(g:, 'dotvim_enable_ale', 0)
let g:dotvim_plugins_ready = 0
if !filereadable(g:dotvim_data_dir . '/autoload/plug.vim')
  echom 'dot_vim: vim-plug not installed; see README. Basic editing remains available.'
  finish
endif
execute 'source ' . fnameescape(g:dotvim_data_dir . '/autoload/plug.vim')
call plug#begin(g:dotvim_data_dir . '/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'branch': 'main' }
if g:dotvim_enable_tagbar
  Plug 'preservim/tagbar'
endif
if g:dotvim_enable_ale
  Plug 'dense-analysis/ale'
endif
" These globals must exist before the plugins' startup scripts run.
execute 'source ' . fnameescape(g:dotvim_root . '/config/plugins/ui.vim')
if g:dotvim_enable_tagbar
  let g:tagbar_width = 32
  let g:tagbar_iconchars = ['▸', '▾']
endif
if g:dotvim_enable_ale
  " Explicit per-project fixers only. Never format or lint on startup/save by default.
  let g:ale_fix_on_save = 0
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 0
  let g:ale_lint_on_save = 0
  let g:ale_linters_explicit = 1
endif
call plug#end()
let g:dotvim_plugins_ready = 1
