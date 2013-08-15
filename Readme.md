# Vim settings.

## Install

```sh
git clone git://github.com/aliou/dotvim.git ~/.dotvim
ln -s ~/.dotvim/vim ~/.vim
ln -s ~/.dotvim/vimrc ~/.vimrc
ln -s ~/.dotvim/gvimrc ~/.gvimrc
cd ~/.dotvim
```

Then install [Vundle][l2] and the plugins by running:

```sh
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```

## Epitech

If you are an Epitech student, remember to change these [lines][l1] with your login
and name.

[l1]: https://github.com/aliou/dotvim/blob/master/vim/plugin/epitech.vim#L17-18
[l2]: https://github.com/gmarik/vundle

