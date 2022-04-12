return {
  -- Rubocop fixer outputs diagnostics first and then the fixed
  -- output. These are delimited by a "=======" string that we
  -- look for to remove everything before it.
  --
  -- The awk program finds the pattern, sets p to 1 and then skip the remaininig
  -- pattern on the line. It then prints what remains.
  formatCommand = "rubocop-daemon-wrapper --auto-correct --stdin ${INPUT} | awk '/====================/{p=1;next}p'",
  formatStdin = true
}
