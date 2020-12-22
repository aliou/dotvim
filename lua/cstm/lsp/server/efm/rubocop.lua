return {
  lintCommand = 'rubocop-daemon-wrapper --format emacs --force-exclusion --stdin ${INPUT}',
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %t: %m"},
  lintIgnoreExitCode = true,
}
