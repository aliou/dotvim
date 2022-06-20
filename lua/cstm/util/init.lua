local files
files = {
  is_readable = function(filename)
    local file = io.open(filename, 'r')

    if file ~= nil then
      io.close(file)
      return true
    end

    return false
  end,

  find_in_root = function(root_file_name)
    local root = vim.fn.expand('%:p:h')
    local previous = ""

    while root ~= previous do
      local path = vim.fn.resolve(root .. '/' .. root_file_name)
      if files.is_readable(path) then
        return path
      end

      previous = root
      root = vim.fn.fnamemodify(root, ':h')
    end

    return nil
  end,
}

return {
  files = files,
  fn = require('cstm.util.fn')
}
