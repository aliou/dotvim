# Vim settings.

## Install

```sh
# Backup your .vim, .vimrc and .gvimrc files before running this.
git clone git://github.com/aliou/dotvim.git ~/.dotvim
ln -s ~/.dotvim/vim ~/.vim
ln -s ~/.dotvim/vimrc ~/.vimrc
ln -s ~/.dotvim/gvimrc ~/.gvimrc
echo "color base16-default" >> ~/.vimrc.local
cd ~/.dotvim
```

Then install [Vundle][l2] and the plugins by running:

```sh
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```

## Epitech

If you are an Epitech student, remember to change these [lines][l1] with your login
and name and set `g:epitech_header` so the Epitech header is automatically
inserted.

[l1]: https://github.com/aliou/dotvim/blob/master/vim/plugin/epitech.vim#L17-18
[l2]: https://github.com/gmarik/vundle

