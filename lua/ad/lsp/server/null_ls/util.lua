local indent_str = function(str, indent)
  return string.rep(" ", indent) .. str
end

return {
  indent_str = indent_str,
}
