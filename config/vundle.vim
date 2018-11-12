set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'python-mode/python-mode'
Plugin 'derekwyatt/vim-scala'
Plugin 'leafgarland/typescript-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chr4/nginx.vim'
Plugin 'udalov/kotlin-vim'

call vundle#end()
filetype plugin indent on

source ~/.vim/config/plugins/pythonmode.vim
source ~/.vim/config/plugins/gruvbox.vim
source ~/.vim/config/plugins/airline.vim
source ~/.vim/config/plugins/nerdtree.vim
source ~/.vim/config/plugins/tagbar.vim
source ~/.vim/config/plugins/youcompleteme.vim
source ~/.vim/config/plugins/ack.vim
source ~/.vim/config/plugins/autoformat.vim
source ~/.vim/config/plugins/javascript.vim
source ~/.vim/config/plugins/typescript.vim
