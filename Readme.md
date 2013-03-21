# Vim settings.

## Install
    
    git clone git://github.com/aliou/dotvim.git ~/.dotvim
    ln -s ~/.dotvim/vim ~/.vim
    ln -s ~/.dotvim/vimrc ~/.vimrc
    ln -s ~/.dotvim/gvimrc ~/.gvimrc
    cd ~/.dotvim

Then install [Vundle][l2] and the plugins by running:

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

Or just run [this script][l3].

## Epitech

If you are an Epitech student, remember to change these [lines][l1] with your login
and name.

[l1]: https://github.com/aliou/dotvim/blob/master/vim/plugin/epitech/header.vim#L17-18
[l2]: https://github.com/gmarik/vundle
[l3]: https://gist.github.com/aliou/91851e576aa3917c0ab8
