" if exists('g:loaded_dl')
  finish
" endif

let s:mode_switches_automatically = system('defaults read -g AppleInterfaceStyleSwitchesAutomatically')
silent let s:current_mode = system('defaults read -g AppleInterfaceStyle')
echom v:shell_error

let g:loaded_dl = 1
