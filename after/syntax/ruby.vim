if exists('g:cstm_disable_ruby_highlighting')
  finish
endif

syntax match ruby_debugger 'binding.pry'
syntax match ruby_debugger 'debugger'
syntax match ruby_debugger 'puts .* '

highlight link ruby_debugger Error
