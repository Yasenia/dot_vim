let mapleader = ' '

source ~/.vim/config/vundle.vim
source ~/.vim/config/keymap.vim

syntax enable
set number
set t_Co=256
set encoding=utf-8
set langmenu=en_US.utf-8
set wildmode=list:longest
set suffixesadd+=.java,.js,.py,.rb
set noerrorbells
set visualbell
set guioptions-=L " hide the left scroll bar
set guioptions-=r " hide the right scroll bar
set guioptions-=T " hide the tool bar
set history=1000

set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType ruby,javascript set softtabstop=2 | set shiftwidth=2
autocmd FileType vim,java,python set softtabstop=4 | set shiftwidth=4

