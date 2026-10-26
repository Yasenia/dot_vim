# dot_vim

## Overview

My Vim configuration, with language-specific indentation, a dark theme, file navigation, and Git integration.

- Space as the leader key.
- Line numbers, search highlighting, and a column guide at 120 characters.
- Four-space indentation by default, with filetype-specific settings.
- Persistent undo and buffer switching without automatically saving changes.
- Built-in syntax support for JavaScript, TypeScript, JSX, TSX, Python, Scala, Kotlin, and Nginx.

### Plugins

| Name | Function | Usage |
|:--|:--|:--|
| [vim-plug](https://github.com/junegunn/vim-plug) | Plugin management | Required |
| [gruvbox](https://github.com/morhetz/gruvbox) | Color scheme | Enabled |
| [vim-airline](https://github.com/vim-airline/vim-airline) | Status line and buffer list | Enabled |
| [NERDTree](https://github.com/preservim/nerdtree) | File explorer | Enabled |
| [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) | Fuzzy file and buffer search | Enabled |
| [vim-surround](https://github.com/tpope/vim-surround) | Edit surrounding brackets, quotes, and tags | Enabled |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git commands | Enabled |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter) | Git diff signs | Enabled |
| [Tagbar](https://github.com/preservim/tagbar) | Code outline | Optional |
| [ALE](https://github.com/dense-analysis/ale) | Manual code formatting | Optional |

### Key Bindings

`<Leader>` means Space. Plugin mappings are available after the corresponding plugin is enabled and installed.

| Key / Command | Function |
|:--|:--|
| `<Leader>n` | Toggle NERDTree |
| `<C-p>` / `<Leader>a` | Search files with CtrlP |
| `:CtrlPBuffer` | Search open buffers |
| `:CtrlPMRUFiles` | Search recently used files |
| `[b` / `]b` | Switch to the previous / next buffer |
| `[<Space>` / `]<Space>` | Insert a blank line above / below the current line |
| `<C-l>` | Clear search highlighting and redraw |
| `<Leader>y` | Yank to the system clipboard; use `<Leader>yy` for a whole line |
| `<Leader>p` | Paste from the system clipboard |
| `<Leader>r` | Save and run the current Shell or Python file |
| `<Leader>t` | Toggle Tagbar, when enabled |
| `<Leader>f` | Format with ALE, when enabled and configured |
| `:Git` | Open the Fugitive Git interface |

Clipboard mappings require Vim with `+clipboard`. Running Python files requires `python3` on PATH. Shell files support simple `sh`, `bash`, and `zsh` shebangs; files without a shebang use `sh`.

## How to Use

Requires Vim 8 or later, Git, and curl. Back up any existing `~/.vim` and `~/.vimrc` before installing.

### Clone the Configuration

```sh
git clone https://github.com/Yasenia/dot_vim.git ~/.vim
```

### Set Up vim-plug

```sh
data="${XDG_DATA_HOME:-$HOME/.local/share}/dot_vim"
mkdir -p "$data/autoload"
curl --fail --location \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  --output "$data/autoload/plug.vim"
```

Plugins and undo files are stored under this data directory, separately from the configuration repository.

### Load the Configuration

Add the following line to `~/.vimrc`:

```vim
execute 'source ' . fnameescape(expand('~/.vim/vimrc'))
```

To try the configuration without changing `~/.vimrc`:

```sh
vim -u "$HOME/.vim/vimrc"
```

### Install Plugins

Open Vim and run:

```vim
:PlugInstall
```

Restart Vim after installation. Use `:PlugStatus` to check the plugins and `:messages` to view startup messages.

### Optional Plugins

Create `~/.vim/local.vim` to enable optional plugins:

```vim
let g:dotvim_enable_tagbar = 1
let g:dotvim_enable_ale = 1

" Example: use Ruff to format Python files.
let g:ale_fixers = {'python': ['ruff_format']}
```

Restart Vim, run `:PlugInstall`, and restart again.

Tagbar requires a compatible ctags implementation, preferably Universal Ctags. ALE formatters such as Ruff must be installed separately. Automatic linting and formatting on save are disabled by default.

### Customize the Configuration

| File / Directory | Content |
|:--|:--|
| `config/options.vim` | General editor settings |
| `config/keymaps.vim` | Key bindings |
| `config/autocmds.vim` | Editor events |
| `config/plugins.vim` | Plugin list and optional features |
| `config/plugins/ui.vim` | Theme and UI settings |
| `after/ftplugin/` | Filetype-specific settings |
| `local.vim` | Local variables, excluded from Git |

To use a different data directory, set it in `local.vim` and install vim-plug there:

```vim
let g:dotvim_data_dir = expand('~/.local/share/dot_vim')
```
