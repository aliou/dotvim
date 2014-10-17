# Vim settings.

These are my Vim configuration files. [There are][steve-losh] [many like][pengwynn]
[it][sanctum], but these are mine.

## Install

```sh
# Backup your .vim, .vimrc and .gvimrc files before running this.
git clone git://github.com/aliou/dotvim.git ~/.dotvim
ln -s ~/.dotvim/vim ~/.vim
ln -s ~/.dotvim/vimrc ~/.vimrc

# Set a colorscheme
echo "color hybrid" >> ~/.vimrc.local
echo "let g:airline_theme='lucius'; >> ~/.vimrc.local


# Then install Vundle and the other plugins:
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```

## Epitech

If you are an Epitech student, remember to change these [lines][l1] with your login
and name and set `g:epitech_header` so the Epitech header is automatically
inserted.

[l1]: https://github.com/aliou/dotvim/blob/master/vim/plugin/epitech.vim#L17-18
[l2]: https://github.com/gmarik/vundle
[steve-losh]: https://bitbucket.org/sjl/dotfiles/
[pengwynn]: https://github.com/pengwynn/dotfiles
[sanctum]: https://github.com/tejr/dotfiles
