" When in visual block mode, let me move the cursor anywhere in the buffer;
" don't restrict me only to regions with text
if has('virtualedit')
  set virtualedit+=block
endif
