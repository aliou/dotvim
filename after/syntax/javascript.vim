if exists('g:cstm_disable_js_highlighting')
  finish
endif

syntax match js_debugger 'debugger'
syntax match js_debugger 'console.*'

highlight link js_debugger Error
