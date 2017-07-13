# dot_vim
## Overview
The configuration of my vim.

### Plugins
|name|function|suggest|
|:--|:--|:--|
|[vundle.vim](https://github.com/VundleVim/Vundle.vim)|Manage all plugins|Required|
|[vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)|The theme of vim|Recommend|
|[vim-airline](https://github.com/vim-airline/vim-airline)|The status bar of vim|Recommend|
|[vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)|The theme of vim-airline|Recommend|
|[nerdtree](https://github.com/scrooloose/nerdtree)|The file explore of vim|Recommend|
|[tagbar](https://github.com/majutsushi/tagbar)|The tag bar of vim|Optional|
|[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)|Auto complete for coding|Optional|
|[ctrlp.vim](https://github.com/kien/ctrlp.vim)|Quickly search files|Recommend|
|[ack.vim](https://github.com/mileszs/ack.vim)|Quickly search text|Optional|
|[vim-surround](https://github.com/tpope/vim-surround)|Quickly type surroundings|Recommend|
|[python-mode](https://github.com/python-mode/python-mode)|Python support|Optional|
|[vim-scala](https://github.com/derekwyatt/vim-scala)|Scala support|Optional|

### Key Binding

|key|function|
|:--|:--|
|Space|Leader|
|\<Leader\>r|Run current file(shell/python)|
|\<S-Cr\>|Insert a blank line above current location and return to normal mode|
|\<Leader\>y|Copy text to system clipboard|
|\<Leader\>p|Paste text from system clipboard|


## How to use
### Clone `dot_vim` as `~/.vim`.
``` shell
git clone https://github.com/Yasenia/dot_vim.git ~/.vim
```

### Use `~/.vim` as the config of vim.
* If you have already use `~/.vimrc` file as the config of vim:
  ``` shell
  echo 'source ~/.vim/vimrc' >> ~/.vimrc
  ```
* Or else, just do nothing.

### Setup vundle.

``` shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Select the plugins as you wish.
Comment the plugins witch you are not need in the file `~/.vim/config/vundle.vim`.

### Install Plugins in vim.

Launch the vim, and type `:PluginInstall<Cr>`.

### Setup plugin: YouCompleteMe

``` shell
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py
```
