set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe' 
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'klen/python-mode'
Plugin 'derekwyatt/vim-scala'
call vundle#end()
filetype plugin indent on

source ~/.vim/config/plugins/pythonmode.vim
source ~/.vim/config/plugins/airline.vim
source ~/.vim/config/plugins/nerdtree.vim
source ~/.vim/config/plugins/tagbar.vim
source ~/.vim/config/plugins/solarized.vim
source ~/.vim/config/plugins/youcompleteme.vim
source ~/.vim/config/plugins/ack.vim
