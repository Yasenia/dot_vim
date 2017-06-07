# Summary
Configuration of my vim.

# Install
## 1. Clone this project as `~/.vim`
``` shell
git clone https://github.com/Yasenia/dot_vim.git ~/.vim
```

## 2. Use `~/.vim` as the config of vim

* If you have already use `~/.vimrc` file as the config of vim:
``` shell
source ~/.vim/config/vundle.vim
echo 'source ~/.vim/vimrc' >> ~/.vimrc
```
* Else, just do nothing.

## 3. Set up vundle

``` shell
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
## 4. Install Plugins

Launch the vim, and type `:PluginInstall<Cr>`

## 5. Set up plugin: YouCompleteMe

``` shell
cd ~/.vim/bundle/YouCompleteMe
./install.py
```
