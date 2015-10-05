These are my Vim configuration files. [There are][steve-losh] [many like][pengwynn]
[it][sanctum], but these are mine.

### Disclaimer
This files are meant to be used with [Neovim](http://neovim.io) and
only contains a minimal vimrc for vim.

## Install

```sh
# Backup your .nvim and .nvimrc before running this.

ln -s ~/.dotvim/nvim ~/.nvim
ln -s ~/.dotvim/nvimrc ~/.nvimrc

# Then install Vundle and the other plugins:
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Install vim-plug and the other plugins.
curl -fLo ~/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall

# Setup colorscheme and airline theme.
echo -e "color moriarty\nlet g:airline_theme='lucius'" >> ~/.nvimrc.local
```

### Update
```sh
# Download the upstream changes and apply your changes on top.
git stash && git pull --rebase && git stash pop

# Install eventual new plugins.
nvim +PlugInstall

# Remove eventual unused plugins.
nvim +BundleClean
```

## Alternatives
Theses files are really tailored to my use and might not be the best for you. In
this case, I recommend checking out @[skwp's][skwp-dotfiles] and [@sjl's][steve-losh]
dotfiles.

### Epitech

If you are an Epitech student, remember to change these [lines][l1] with your
login and name and set `g:epitech_header` so the Epitech header is automatically
inserted for C, C++, Java and Make files like this:

```vimscript
" ~/.nvimrc
let g:epitech_header = 1
```

[l1]: https://github.com/aliou/dotvim/blob/fa06a59907b81b998a1de99e96b77c8fb3c55d47/vim/plugin/epitech.vim#L22-L23
[l2]: https://github.com/gmarik/vundle
[steve-losh]: https://bitbucket.org/sjl/dotfiles/
[pengwynn]: https://github.com/pengwynn/dotfiles
[sanctum]: https://github.com/tejr/dotfiles
[skwp-dotfiles]: http://skwp.github.io/dotfiles/
