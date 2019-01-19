if has('spell')
  " I use two dictionaries:
  "   - /usr/share/dict/words => Basic stuff.
  "   - ~/.vim/spell/custom-dictionary.utf8.add => Custom dictionary.
  set dictionary=/usr/share/dict/words
  set spellfile=~/.vim/spell/custom-dictionary.utf8.add

  augroup cstm_spell
    autocmd!

    " Spell for commits.
    autocmd FileType gitcommit setlocal spell textwidth=72

    " Spell for markdown
    autocmd FileType markdown setlocal spell
  augroup END
endif
