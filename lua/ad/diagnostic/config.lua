local format_message = function(diagnostic)
  if diagnostic.code then
    return string.format("%s (%s)", diagnostic.message, diagnostic.code)
  end

  return diagnostic.message
end

vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    format = format_message,
  }
})
