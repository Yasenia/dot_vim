let mapleader = ' '

source ~/.vim/config/vundle.vim
source ~/.vim/config/keymap.vim

syntax enable
set number
set colorcolumn=120
set nospell
set spelllang=en_us
set history=1000
set t_Co=256
set hlsearch
set encoding=utf-8
set langmenu=en_US.utf-8
set wildmode=list:longest
set suffixesadd+=.java,.scala,.sc,.groovy,.js,.ts,.json,.py,.rb,.yml,.yaml,.conf,.xml
set noerrorbells
set visualbell
set guioptions-=L " hide the left scroll bar
set guioptions-=r " hide the right scroll bar
set guioptions-=T " hide the tool bar

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
autocmd BufNewFile,BufRead *.sc set filetype=scala
autocmd BufNewFile,BufRead *Jenkinsfile* set filetype=groovy

set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
autocmd FileType scala,ruby,javascript,typescript,yaml set softtabstop=2 | set shiftwidth=2
autocmd FileType vim,java,groovy,python set softtabstop=4 | set shiftwidth=4
