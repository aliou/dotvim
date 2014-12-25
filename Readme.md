These are my Vim configuration files. [There are][steve-losh] [many like][pengwynn]
[it][sanctum], but these are mine.

## Install

```sh
# Backup your .vim and .vimrc before running this.
git clone git://github.com/aliou/dotvim.git ~/.dotvim
ln -s ~/.dotvim/vim ~/.vim
ln -s ~/.dotvim/vimrc ~/.vimrc

# Set colors
echo "color hybrid" >> ~/.vimrc.local
echo "let g:airline_theme='lucius'" >> ~/.vimrc.local

# Then install Vundle and the other plugins:
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```

### Update
```sh
# Download the upstream changes and apply your changes on top.
git pull --rebase

# Install eventual new plugins.
vim +BundleInstall +qall

# Remove eventual unused plugins.
vim +BundleClean
```

## Alternatives
Theses files are really tailored to my use and might not be the best for you. In
this case, I recommend @[skwp's][skwp-dotfiles] and [@sjl's][steve-losh]
dotfiles.

### Epitech

If you are an Epitech student, remember to change these [lines][l1] with your
login and name and set `g:epitech_header` so the Epitech header is automatically
inserted for C, C++, Java and Make files like this:

```vimscript
" ~/.vimrc
let g:epitech_header = 1
```

[l1]: https://github.com/aliou/dotvim/blob/master/vim/plugin/epitech.vim#L17-18
[l2]: https://github.com/gmarik/vundle
[steve-losh]: https://bitbucket.org/sjl/dotfiles/
[pengwynn]: https://github.com/pengwynn/dotfiles
[sanctum]: https://github.com/tejr/dotfiles
[skwp-dotfiles]: http://skwp.github.io/dotfiles/
